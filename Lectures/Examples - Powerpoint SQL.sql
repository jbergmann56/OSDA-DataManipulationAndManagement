#Lecture Queries - ODSA Data Manipulation and Management

#Lecture 1 - Slide 15, Lecture 2 - Slide 4 & 6 - Example - World Query
SELECT continent,  name as country #what columns to get
FROM world.country #what schema/table to read
WHERE continent  = 'asia' #limit result
ORDER BY continent, country DESC  #Sort rows in resul
LIMIT 10; #number of rows to “bring back”

#Lecture 2 - Slide 9 - Example - Aggregate Function
SELECT continent,  SUM(population) AS total_pop
FROM world.country #what schema.table to read data
GROUP BY continent  #summarize by group
HAVING SUM(population) > 0 #Limit final results of agg. 
ORDER BY continent DESC;    #Sort rows in result    

#Lecture 2 - Slide 10 - Example - Control Flow Function
SELECT  SUM(population) AS total_pop, 
CASE WHEN continent IN ('Asia', 'Africa', 'Europe', 'Oceania') THEN 'Eastern'
WHEN RIGHT(continent,7) = 'America' then 'Western' #use of "right" string function
ELSE continent END AS hemisphere
FROM world.country #what schema/table to read data
GROUP BY hemisphere; /*, continent, RIGHT(continent,7), RIGHT(continent,9)*/  #summarize by group

#Lecture 2 - Slide 11 - Example - Scalar "Value" Function
SELECT `name` AS country, indepyear, YEAR(CAST('1991-1-1' AS DATE)) AS start_year
FROM world.country #what schema.table to read data
WHERE indepyear >= YEAR(CAST('1991-1-1' AS DATE)) 
ORDER BY indepyear DESC; #Sort rows from newest to oldest

#Lecture 3 - Slide 5 - Create a New Database/Schema
#Note: Won't work because of user permissions in cloud db, but works otherwise - see classicmodels example
CREATE DATABASE classicmodels; 
USE classicmodels;

#Lecture 3 - Slide 6 - Creating Tables
CREATE TABLE  jbergmann.customers (	
customer_number INT NOT NULL UNIQUE,	
customer_name VARCHAR(50) NOT NULL,     
contact_lastname VARCHAR(50) NOT NULL,   
contact_firstname VARCHAR(50) NOT NULL,    
phone VARCHAR(50) NOT NULL,    
addressline1 VARCHAR(50) NOT NULL,   
 addressline2 VARCHAR(50) DEFAULT NULL,    
city VARCHAR(50) NOT NULL,   
state CHAR(2) DEFAULT NULL,    
postalcode VARCHAR(15) DEFAULT NULL,    
country CHAR(3) NOT NULL DEFAULT 'USA',    
salesrep_employeenumber INT DEFAULT NULL,    
creditlimit DECIMAL(10,2) CHECK (creditlimit < 1000000),   
 PRIMARY KEY (customer_number)
);
/* Constraints are the rules enforced on the data columns of a table.
Types of Constraints:  https://www.tutorialspoINT.com/sql/sql-constraINTs.htm 
SET SQL_SAFE_UPDATES = 0; -- if error using the DELETE clause, run the preceeding code */

#Lecture 3 - Slide 8 - Modifying & Deleting Tables
#Add column
ALTER TABLE jbergmann.customers
ADD `column_name` VARCHAR(255);

#Drop Column 
ALTER TABLE  jbergmann.customers 
DROP `column_name`;

#Drop Constraint 
ALTER TABLE  jbergmann.customers 
DROP CONSTRAINT customers_ibfk_1; 

#Drop/Delete Table
DROP TABLE IF EXISTS  jbergmann.customers;

#Lecture 3 - Slide 9 - Manually Insert Values into Tables
INSERT INTO jbergmann.customers (customer_number, customer_name, contact_lastname, contact_firstname, phone, addressline1, addressline2, city, state, postalcode, country, salesrep_employeenumber, creditlimit) 

VALUES 
(103,'Atelier graphique','Schmitt','Carine ','40.32.25','54, rue Royale',NULL,'Nantes',NULL,'44000','FRA',1370,'2100.00'),
(112,'Signal Gift Stores','King','Jean','7025551838','8489 Strong St.',NULL,'Las Vegas','NV','83030','USA',1166,'71800.00');

#Lecture 3 - Slide 10 - Select Values into Tables
#Step 1) Create the covid19.us table in your personal schema
CREATE TABLE jbergmann.us (
  `date` DATETIME DEFAULT NULL,
  `cases` INT DEFAULT NULL,
  `deaths` INT DEFAULT NULL
);

#Step 2) create query for records you want to store in the covide19.us table
INSERT INTO jbergmann.us (`date`,cases,deaths) 
SELECT `date`,cases,deaths
FROM covid_19.us;

#Step 3) Check Results
SELECT *
FROM jbergmann.us;
 
#Lecture 3 - Slide 11 - Update Existing Values in Table
#Step 1) Create the covid19.us table in your personal schema
UPDATE jbergmann.customers 
SET city = 'Omaha', state = 'NE'
WHERE customer_number = 103;

#Lecture 3 - Slide 12 - Delete Records in Table
#Step 1) Create the covid19.us table in your personal schema
DELETE FROM jbergmann.customers 
WHERE customer_number = 112;

#Lecture 3 - Slide 13 - Create and Query View
#Step 1) Create the covid19.us table in your personal schema
CREATE VIEW jbergmann.vw_countries_asia AS
  SELECT  tbl.`name` AS country
  FROM world.country AS tbl
  WHERE  (tbl.continent = 'Asia');

#View Usage - Query View
SELECT  country
FROM jbergmann.vw_countries_asia
WHERE country IN ('India', 'China', 'Nepal');

#Lecture 4 - Slide 8 - Inner Join - Example
SELECT a.`name` AS country, b.`language`   
FROM world.country as a 
INNER JOIN world.countrylanguage AS b ON a.code = b.countrycode and b.isofficial ='T';

#Lecture 4 - Slide 10 - Left Join - Example
SELECT a.`name` AS country, b.`language`    
FROM world.country AS a 
LEFT JOIN world.countrylanguage AS b ON a.code = b.countryCode AND b.`Language` ='English';

#Lecture 4 - Slide 13 - UNION All
SELECT a.`name` as country
FROM world.country as a
INNER JOIN world.countrylanguage as b 
ON a.`code` = b.countrycode AND b.`Language`='English'
WHERE a.Continent = 'North America'

UNION ALL 

SELECT a.`name` as country
FROM world.country AS a 
INNER JOIN world.countrylanguage AS b 
ON a.`code` = b.countrycode AND b.`Language`='Spanish'
WHERE a.continent = 'North America';

#Lecture 4 - Slide 14 - Full outer Join using UNION
#Left Table - All countries vs. Right Table - Portugese
SELECT a.`code` AS country_code, b.`language` 
FROM world.country AS a
LEFT JOIN world.countrylanguage AS b 
ON a.`code`=b.countrycode AND b.`language`='Portuguese'
WHERE a.continent = 'South America'

UNION

#Right Table - Other Languages vs. Left Table - South American Countries
SELECT NULL AS country_code, b.`language` 
FROM world.country AS a
RIGHT JOIN world.countrylanguage AS b ON a.`code`=b.countrycode
WHERE a.continent = 'South America';

#Lecture 4 - Slide 15 - UNION
SELECT a.`name` AS country
FROM world.country AS a
INNER JOIN world.countrylanguage as b 
ON a.`code` = b.countrycode AND b.`Language`='English'
WHERE a.Continent = 'North America'

UNION

SELECT a.`name` as country
FROM world.country AS a 
INNER JOIN world.countrylanguage AS b 
ON a.`code` = b.countrycode AND b.`language`= 'spanish'
WHERE a.continent = 'North America';

#Lecture 4 - Slide 17 - Subquery - FROM Clause
SELECT   subq.continent, SUM(subq.population) AS total_pop
FROM (
SELECT continent,  `name` AS country, population
FROM world.country
WHERE continent = 'asia'
)  AS subq #using subquery
GROUP BY subq.Continent;

#Lecture 4 - Slide 19 - Subquery - SELECT Clause
SELECT us.state
,(SELECT MAX(s1.cases) FROM covid_19.us AS s1) AS total_US_cases
,MAX(us.cases) AS state_cases, MAX(us.cases) / 
(SELECT MAX(s1.cases) FROM covid_19.us AS s1)  AS state_prop
FROM covid_19.us_states AS us
GROUP BY us.state
ORDER BY state_prop DESC;

#Lecture 4 - Slide 20 - Subquery - WHERE Clause
SELECT q.*
FROM covid_19.us_states AS q
WHERE state in (SELECT DISTINCT state FROM covid_19.us_states WHERE LEFT(state,1) = 'N')
AND q.`date` = CAST('2021-10-15' AS DATE); 

#Lecture 5 - Slide 7 - SQL Wildcards - World Example 
#note the use of the REGEXP expression in MySQL - see more at: https://www.w3resource.com/mysql/string-functions/mysql-regexp-function.php

#Like Operator to find countries that contain the string "ain"
SELECT a.`name` as country 
FROM world.country AS a
WHERE a.`name` LIKE '%ain%';

#All City starting with any character, followed by "ondon
SELECT `name` as city, countrycode
FROM world.city
WHERE `name` LIKE '_ondon';

#Find all countries starting with "b", "s", or "p":
SELECT `name` as country
FROM world.country
WHERE `name` REGEXP '^[BSP]'; 

#Find all countries where the second letter is a, b, or c:
SELECT `name` as country
FROM world.country
WHERE `name` REGEXP '^.[abc]'; #note the use of the REGEXP expression in MySQL

#Lecture 5 - Slide 8 -Identify Duplicates by Aggregation
SELECT `name` AS city, district, SUM(1) AS `count`                                 
FROM world.city                                                                                                                                          
GROUP BY `name`, district
HAVING count > 1;

SELECT *                             
FROM world.city     
WHERE `name` = 'San Juan' AND district = 'San Juan'    ;                                                                                                                                 
                                                                                          
#Lecture 5 - Slide 8 -Identify Duplicates by Aggregation
SELECT `name` AS city, SUM(1) AS `count`                                 
FROM world.city                                                                                
WHERE countrycode='USA'                                                              
GROUP BY `name`   
HAVING count > 1;

#Lecture 5 - Slide 9 - SQL Query - Find duplicates Via key (Aggregate & Join)
SELECT a.*   
FROM world.city AS a  INNER JOIN
(SELECT `name` AS city, SUM(1) AS `count`                                 
FROM world.city                                                                                
WHERE countrycode='USA'                                                              
GROUP BY `name`   
HAVING count > 1) AS b ON  a.`name` = b.city 
WHERE a.countrycode='USA' 
ORDER BY a.`name`;

#distinct keywork


#Lecture 5 - Slide 13 - SQL Query - Numeric Functions - Fill-in and convert `GNPOld` values in World.Country
#convert decimal in int type
SELECT `name` AS country, 
CONVERT(ROUND(gnpold,0),UNSIGNED) AS gnpold2                       
FROM world.country;

#Replace NULL values using Coalesce “0” 
SELECT `name` AS country, COALESCE(gnpold,0) as gnpold3                       
FROM world.country;

#Lecture 5 - Slide 15 -  String Functions - Convert USA City & State Names to “City, St.” in World.City
SELECT `name` AS city, district AS state ,
CONCAT(`name`, ', ', CASE WHEN district = 'New York' THEN 'NY'
					WHEN INSTR(district,'Tex') then 'TX'
					WHEN district = 'Arizona' THEN REPLACE(district, 'Arizona', 'AZ')
					WHEN TRIM(LEADING 'Penn' FROM district) = 'sylvania' THEN 'PA' #LEADING is a MySQL keyword
					ELSE UPPER(LEFT(district,2)) END) AS city_state_full
FROM world.city AS a  
WHERE a.CountryCode='USA' ;

#Lecture 5 - Slide 17 -  Date Functions - Get the number of years since each country’s independence 
SELECT `name` AS country, YEAR(CURDATE()) AS curr_year, indepyear,
CASE WHEN indepyear IS NULL THEN 0
ELSE YEAR(CURDATE())-indepyear END AS years_ind
FROM world.country;

#Lecture 8 - 
