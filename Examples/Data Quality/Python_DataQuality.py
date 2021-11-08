#!/usr/bin/env python
# coding: utf-8

# In[5]:


#example:  https://github.com/SauceCat/pydqc/blob/master/test/pydqc_test_on_Zillow.ipynb
#Import Pandas & numpy library
import pandas as pd
import numpy
#import infer_schema, data_summary, data_compare, data_consist data quality libraries
#Install library before using code:  !pip install pydqc
import sys
import joblib
sys.modules['sklearn.externals.joblib'] = joblib
from pydqc import infer_schema, data_summary, data_compare, data_consist 


# In[2]:


#Load Dataset, then explore Rows/Columns in a Pandas DataFrame
path = 'C:/Users/Jeremy Bergmann/OneDrive - Paradigm Oral Surgery/Documents/GitHub/OSDA-DataManipulationAndManagement/Examples/Data Quality'
df = pd.read_csv(path + '/Datasets/BL-Flickr-Images-Book.csv')
df.head() #explore dataframe column contents
print(df.shape)


# In[4]:

#infer schema based on full set of data
infer_schema.infer_schema(data=df, fname='books', output_root=path+'/output/', 
                          sample_size=1.0, type_threshold=0.5, n_jobs=2, base_schema=None)


# In[ ]:


#Cleaning the Entire Dataset Using the applymap Function
# DataFrame. Pandas .applymap() method is similar to the in-built map() function and 
#simply applies a function to all the elements in a DataFrame.
def get_citystate(item):
     if ' (' in item:
         return item[:item.find(' (')]
     elif '[' in item:
         return item[:item.find('[')]
     else:
         return item
    
towns_df =  towns_df.applymap(get_citystate)


# In[ ]:


#Renaming Columns and Skipping Rows
#skipping rows upon import
olympics_df = pd.read_csv('Datasets/olympics.csv', header=1) #header starts on row 1 of file
olympics_df.head()

