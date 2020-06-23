#!/usr/bin/env python
# coding: utf-8

# # source: https://realpython.com/python-data-cleaning-numpy-pandas/
# 
# # In this tutorial, we’ll leverage Python’s Pandas and NumPy libraries to cover the following ETL Topics:
# 
# * Dropping unnecessary columns in a DataFrame
# 
# * Changing the index of a DataFrame
# 
# * Using .str() methods to clean columns
# 
# * Using the DataFrame.applymap() function to clean the entire dataset, element-wise
# 
# * Renaming columns to a more recognizable set of labels
# 
# * Skipping unnecessary rows in a CSV file

# In[35]:


import pandas as pd #
import numpy as np


# In[36]:


#read csv file into python using pandas
df = pd.read_csv('BL-Flickr-Images-Book.csv')
df.head() #explore dataframe column contents


# <b> Dropping Columns in a DataFrame </b>

# In[37]:


col_to_drop = ['Edition Statement',
            'Corporate Author',
            'Corporate Contributors',
          'Former owner',
            'Engraver',
            'Contributors',
           'Issuance type',
            'Shelfmarks']

df.drop(col_to_drop, inplace=True, axis=1)
df.head()


# <b> Create an index field, based on unidue values </b>

# In[53]:


if df['Identifier'].is_unique: #check if column is unique
    print('pandas dataframe field is unique')
    df = df.set_index('Identifier')
    print(df.loc[206]) # can now reference bt index value
df.head()


# # Tidying up Fields in the Data
# Pandas docs: https://pandas.pydata.org/pandas-docs/stable/reference/frame.html#attributes-and-underlying-data
# 
# <b>Purpose: clean specific columns and get them to a uniform format to get a better understanding of the dataset and enforce consistency </b>

# <b> check Pandas dataframe columns and datatypes </b>

# In[54]:


print(df.dtypes) #get data type of each column in dataframe - change if needed (see next cell for example)
print(df.shape) #get data type counts - change using 


# <b> Change fist 4 characters of "date of publication" field to numeric, to use in future calculations </b>

# In[55]:


extr = df['Date of Publication']
df['Date of Publication'] = pd.to_numeric(extr)
df['Date of Publication'].head()


# In[56]:


#Combining str Methods with NumPy to Clean Columns
#np.where function, which is basically a vectorized form of Excel’s IF() macro.
#np.where(condition1, x1, 
#        np.where(condition2, x2, 
#            np.where(condition3, x3, ...))
df['Place of Publication'].head(10)


# In[57]:


#to clean this column in one sweep, we can use str.contains() to get a boolean mask.
pub = df['Place of Publication']
london = pub.str.contains('London') #find all rows in "place of publication that contains 'London'
print(london[:10]) # print first 5 rows of dataframe - Returns "True" if sting is found


# In[58]:


#replace hypen "-" with blank character '' 
oxford = pub.str.contains('Oxford') #find all rows in "place of publication that contains 'Oxford'
df['Place of Publication'] = np.where(london, 'London',
                                      np.where(oxford, 'Oxford',
                                               pub.str.replace('-', ' '))) #replace "-" with bloank character
df['Place of Publication'].head(10)


# In[59]:


#replace multiple values in a pandas dataframe by applying the applymap() function
# create callable function to apply to each data element - 
#see https://chrisalbon.com/python/data_wrangling/pandas_apply_operations_to_dataframes/ for more details
def chg_author(item):
    if type(item) is not str:
        return item
    if 'A., A. A.' in item:
        return 'J.Bergmann'
    else:
        return item
cleaned_df = df.applymap(chg_author)
print(cleaned_df.head())


# <b> Export Resulting "Cleaned" dataset to CSV file.</b>  
#     Note: remove csv header for import into MySQL  

# In[63]:


#export in utf-8 encoding - helps with later import into mysql!
cleaned_df.to_csv('BL-Flickr-Images-Book-Cleaned.csv',header=False,encoding='utf-8')


# <b> Python Bulk Loading Data (ETL) into MySQL with Python </b><br>
# Insert "Cleaned" csv file into MySQL database table 

# In[64]:


#install pymysql using pip "!pip install pymysql"
#!pip install pymysql


# In[65]:


#purpose:  Python Bulk Loading Data (ETL) into MySQL with Python
#Insert "Cleaned" csv file into MySQL database table
import pymysql #pymysql package to connect to MySQL and execute SQL statements with Python


# In[68]:


import csv #Python Core Package - import csv file from local path
mydb = pymysql.connect(host='localhost', user='root', passwd='root', db='sys')
#open cleaned dataset to import into MySQL table (See Table Create Script - ETL_Python2SQL_Books.sql)
csv_data = csv.reader(open('BL-Flickr-Images-Book-Cleaned.csv',encoding='utf-8'))


# In[79]:


#run MySQL SQL query to create table for imported CSV file
cursor = mydb.cursor()
query = """CREATE TABLE sys.etl_books (
  identifier varchar(10) NOT NULL,
  place_of_publication text,
  date_of_publication varchar(50) DEFAULT NULL,
  publisher text,
  title text,
  author text,
  flickr_url text,
  PRIMARY KEY(identifier)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci"""
cursor.execute(query)
mydb.commit()
cursor.close()


# In[81]:


#import each row of the csv file in to the corresponding database/table in MySQL
cursor = mydb.cursor()
query = """INSERT INTO etl_books(identifier, place_of_publication, date_of_publication, publisher, title, author, flickr_url) 
VALUES(%s,%s,%s,%s,%s,%s,%s)
"""
for row in csv_data:
    cursor.execute(query,row)
mydb.commit()


# In[82]:


#close msql data stream
cursor.close()
print("Imported!")


# In[86]:


#check results via query 
cursor = mydb.cursor()
query = """SELECT * FROM sys.etl_books"""
cursor.execute(query)
mydb.commit()
result = cursor.fetchall()
cursor.close()


# In[88]:


#print results of the query
print(result[1])

