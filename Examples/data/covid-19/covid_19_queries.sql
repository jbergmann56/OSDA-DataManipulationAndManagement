USE covid_19; #sleect the covid_19 database for active use

#Class 2 - Writing Queries
# What % of COVID-19 Cases vs. COVID-Related Deaths 
SELECT WEEK(date) as covid19_week, SUM(cases) AS covid19_cases_tot, SUM(deaths) AS covid19_deaths_total,
SUM(deaths)/SUM(cases) AS covid19_deaths_pcnt 
FROM covid_19.us
WHERE WEEK(date) BETWEEN 14 and 18
GROUP BY WEEK(date);

# What % of COVID-19 Cases vs. COVID-Related Deaths - Nebraska	1.37%
SELECT state, WEEK(date) as covid19_week, SUM(cases) AS covid19_cases_tot, SUM(deaths) AS covid19_deaths_total,
SUM(deaths)/SUM(cases) AS covid19_deaths_pcnt 
FROM covid_19.us_states
WHERE state in ('nebraska','iowa')
GROUP BY state, WEEK(date)
ORDER BY WEEK(date),state; 

#overall covid19 death % - 5.58%
SELECT state, SUM(deaths)/SUM(cases) AS covid19_deaths_pcnt 
FROM covid_19.us_states
WHERE WEEK(date) BETWEEN 13 and 20
GROUP BY state
ORDER BY SUM(deaths)/SUM(cases) DESC; 

#overall covid19 death % - 5.58%
SELECT SUM(deaths)/SUM(cases) AS covid19_deaths_pcnt 
FROM covid_19.us_states
WHERE WEEK(date) BETWEEN 13 and 20; 

#Subquery #1 - Where Statement
SELECT us.state, SUM(deaths)/SUM(cases) AS covid19_deaths_pcnt 
FROM covid_19.us_states AS us
WHERE (
	   SELECT DISTINCT state 
       FROM covid_19.us_states
       WHERE state in ('nebraska','iowa')
       )
GROUP BY US.state;

-- Subquery #1 - Where Statement - limit the "outer query" to only the states selected in the "inner query"
SELECT US.state, SUM(deaths)/SUM(cases) AS covid19_deaths_pcnt 
FROM covid_19.us_states AS US
WHERE (
	   SELECT DISTINCT state 
       FROM covid_19.us_states
       WHERE state in ('nebraska','iowa')
       )
GROUP BY US.state;

-- Subquery #2  - Check the counties in the "US CENSUS FIPS" table that have a match in the COVID_19 dataset (using left join)
SELECT a.fips, b.fips As covid_fips, a.stname,	a.ctyname 
FROM covid_19.us_census_fips AS a
LEFT JOIN 
(SELECT DISTINCT bb.fips FROM covid_19.us_counties AS bb) AS b ON a.fips = b.fips
ORDER BY a.fips;

-- Subquery #3 - Select the total population rom the demographic table, for the corresponding county in the COVID Dataset. 
SELECT a.fips, a.date, a.county,	a.state, a.cases, a.deaths,
	 (SELECT DISTINCT b.popestimate2019 FROM covid_19.us_census_fips AS b WHERE a.fips = b.fips) AS popestimate2019
FROM covid_19.us_counties AS a
ORDER BY a.fips;

#Class 3 - Extracting and Storing Data
#create view with Nebraska counties only 
CREATE VIEW us_states_ne AS 
SELECT date AS covid_date, state, fips, county, cases, deaths
FROM covid_19.us_counties
WHERE state = 'Nebraska'; 

#utilize view in sql select query
SELECT * 
FROM us_states_ne
WHERE county IN ('Douglas','Lancaster','Sarpy')
ORDER BY county, covid_date;

#dropping view
DROP VIEW us_states_ne;

#creating table using constraints & primary key
CREATE TABLE us_states_ne_info (
	covid_date DATETIME NOT NULL,
	state TEXT, 
	fips INT, 
	county TEXT, 
	cases INT, 
	deaths INT, 
  PRIMARY KEY (covid_date, fips)
);

INSERT INTO us_states_ne_info (covid_date, state, fips, county, cases, deaths) 
SELECT date AS covid_date, state, fips, county, cases, deaths
FROM covid_19.us_counties
WHERE state = 'Nebraska'; 

SELECT * 
FROM us_states_ne_info
WHERE county IN ('Douglas','Lancaster','Sarpy')
ORDER BY county, covid_date;

DELETE FROM us_states_ne_info
WHERE county = 'Douglas';

SELECT * 
FROM us_states_ne_info
WHERE county IN ('Douglas','Lancaster','Sarpy')
ORDER BY county, covid_date;

#example of not using a WHERE clause
UPDATE us_states_ne_info
SET county = NULL;

#check - all county values are set to NULL!!!!!!!!!!!!!
SELECT * 
FROM us_states_ne_info;

DROP TABLE us_states_ne_info;

#Class 4 - Joining and Merginig Data
USE covid_19;

#Explore US Census Data
SELECT * 
FROM us_census_fips AS a
LIMIT 10;

#Explore Covid-19 - US County Data
SELECT *
FROM us_counties AS b
LIMIT 10; 

#Join Covid-19 & US Counties data
SELECT a.*, b.* 
FROM us_census_fips AS a
LEFT JOIN covid_19.us_counties as b on a.fips = b.fips;

#Join Covid-19 & US Counties data - no matches
SELECT a.STNAME, a.CTYNAME, b.* 
FROM us_census_fips AS a
LEFT JOIN covid_19.us_counties as b on a.fips = b.fips
WHERE b.county IS NULL;

#Join Covid-19 & US Counties data - Population Information
SELECT a.STNAME, a.CTYNAME, a.POPESTIMATE2019, a.deaths2019, b.* 
FROM us_census_fips AS a
INNER JOIN covid_19.us_counties as b on a.fips = b.fips
ORDER BY a.fips, date DESC;

#what is the most recent day in the dataset? 
SELECT MAX(a.date)
from us_counties AS a;

#Join Covid-19 & US Counties data - no matches
SELECT a.STNAME, a.CTYNAME, a.POPESTIMATE2019, a.deaths2019, b.* 
FROM us_census_fips AS a
INNER JOIN covid_19.us_counties AS b ON a.fips = b.fips AND b.date = (SELECT MAX(d.date) from us_counties AS d)
ORDER BY a.fips, date DESC;

#Covide-19 deaths per capita
SELECT a.STNAME, a.CTYNAME, 
b.cases/a.POPESTIMATE2019 AS covid_cases_per_capita, 
a.deaths2019/a.POPESTIMATE2019 AS deaths_per_capita_2019, 
b.deaths/a.POPESTIMATE2019 AS covid_deaths_per_capita_2019, 
b.* 
FROM us_census_fips AS a
INNER JOIN covid_19.us_counties AS b ON a.fips = b.fips AND b.date = (SELECT MAX(d.date) from us_counties AS d)
ORDER BY b.deaths/a.POPESTIMATE2019 DESC;

#Covid-19 cases per capita
SELECT a.STNAME, a.CTYNAME, a.POPESTIMATE2019, 
b.cases/a.POPESTIMATE2019 AS covid_cases_per_capita, 
a.deaths2019/a.POPESTIMATE2019 AS deaths_per_capita_2019, 
b.deaths/a.POPESTIMATE2019 AS covid_deaths_per_capita_2019, 
b.* 
FROM us_census_fips AS a
INNER JOIN covid_19.us_counties AS b ON a.fips = b.fips AND b.date = (SELECT MAX(d.date) from us_counties AS d)
ORDER BY b.cases/a.POPESTIMATE2019 DESC;

#Class 5 - Cleansing Data Using SQL
USE covid_19;

#duplicates by date
SELECT date
FROM covid_19.us_states;

#duplicates by aggregation
SELECT date, SUM(1) AS dup_count
FROM covid_19.us_states
GROUP BY date
HAVING dup_count > 1;

#Removing Duplicates using DISTINCT Keyword - List all dates in covid_19 dataset
SELECT state AS covid19_state
FROM covid_19.us_states;

SELECT  state AS covid19_state
FROM covid_19.us_states
ORDER BY date DESC;

#get number of cased by monyh from COVID-19 Date Field
SELECT MONTH(date) as covid19_date, SUM(CASES) AS total_cases
FROM covid_19.us_states
GROUP BY MONTH(date);

#Apply date functions to COVID-19 Dataset
SELECT DISTINCT date as covid19_date, DATEDIFF(CURDATE(), date), DAY(date),MONTH(date),YEAR(date), DAYOFWEEK(date)
FROM covid_19.us_states;

/* String Examples */ 
SELECT CONCAT(county,', ', state) AS full_name, INSTR(county,'douglas') as douglas_county, TRIM(LEADING 'Doug' FROM county ) las_county, 
REPLACE(county,'douglas','douglas2'), LCASE(county), LENGTH(county), SUBSTRING(county, 1, 5)
FROM covid_19.us_counties
WHERE county LIKE'doug_as%'
ORDER by full_name DESC;

#Class 6 - Dimensional Modeling - COVID Data
CREATE DATABASE covid_19_datawarehouse;
USE covid_19_datawarehouse;

#create a staging table that contains covid_19 data elements (ETL)
CREATE TABLE covid_19_datawarehouse.covid_19_county_stage (
  ID INT AUTO_INCREMENT UNIQUE,  #create a unique interger number for each record in table
  covid_date DATE NOT NULL,
  county TEXT,
  state TEXT,
  fips INT DEFAULT 0,
  cases INT DEFAULT 0,
  deaths INT DEFAULT 0,
  CTYNAME VARCHAR(255) DEFAULT NULL,
  CENSUS2010POP INT DEFAULT NULL,
  POPESTIMATE2019 INT DEFAULT NULL,
  NPOPCHG_2019 INT DEFAULT NULL,
  DEATHS2019 INT DEFAULT NULL,
  NATURALINC2019 INT DEFAULT NULL,
  INTERNATIONALMIG2019 INT DEFAULT NULL,
  DOMESTICMIG2019 INT DEFAULT NULL,
  NETMIG2019 INT DEFAULT NULL,
  RESIDUAL2019 INT DEFAULT NULL,
  GQESTIMATESBASE2010 INT DEFAULT NULL,
  GQESTIMATES2019 INT DEFAULT NULL,
  RDEATH2019 DOUBLE DEFAULT NULL,
  RNATURALINC2019 DOUBLE DEFAULT NULL,
  RINTERNATIONALMIG2019 DOUBLE DEFAULT NULL,
  RDOMESTICMIG2019 DOUBLE DEFAULT NULL,
  RNETMIG2019 DOUBLE DEFAULT NULL,
  PRIMARY KEY (ID)
);
SET GLOBAL TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
INSERT INTO covid_19_datawarehouse.covid_19_county_stage (/*id,*/ covid_date, county, state, fips, cases, deaths,
CTYNAME, CENSUS2010POP, POPESTIMATE2019, NPOPCHG_2019, DEATHS2019, NATURALINC2019, INTERNATIONALMIG2019, DOMESTICMIG2019, NETMIG2019,
RESIDUAL2019, GQESTIMATESBASE2010, GQESTIMATES2019, RDEATH2019, RNATURALINC2019, RINTERNATIONALMIG2019,  RDOMESTICMIG2019, RNETMIG2019)

SELECT DISTINCT a.`date` as covid_date, 'ALL COUNTIES' AS county, a.state, a.fips, a.cases, a.deaths,
b.CTYNAME, b.CENSUS2010POP, b.POPESTIMATE2019, b.NPOPCHG_2019, b.DEATHS2019, b.NATURALINC2019, b.INTERNATIONALMIG2019, b.DOMESTICMIG2019, b.NETMIG2019,
b.RESIDUAL2019, b.GQESTIMATESBASE2010, b.GQESTIMATES2019, b.RDEATH2019, b.RNATURALINC2019, b.RINTERNATIONALMIG2019,  b.RDOMESTICMIG2019, b.RNETMIG2019
FROM covid_19.us_states a 
LEFT JOIN covid_19.us_census_fips b on a.FIPS = b.STATE and b.SUMLEV = '40';

#create dimensional tables before creating metric "fact" table
#create a dimensional "dim" table that contains date information, used in summarizing and/or measures in the "fact" tables
CREATE TABLE covid_19_datawarehouse.dim_date (
  date_id INT AUTO_INCREMENT UNIQUE,  #create a unique interger number for each record in table
  covid_date DATE, 
  week_number INT,
  weekday INT, 
  month_number INT,
  covid_year INT,
  PRIMARY KEY (date_id)
);

INSERT INTO covid_19_datawarehouse.dim_date (covid_date, week_number, weekday, month_number, covid_year)

SELECT DISTINCT b.covid_date, WEEK(b.covid_date), WEEKDAY(b.covid_date), MONTH(b.covid_date), YEAR(b.covid_date)
FROM covid_19_datawarehouse.covid_19_county_stage as b;

/* check date_id table */
SELECT * FROM covid_19_datawarehouse.dim_date;

#create a dimensional "dim" table that contains US County information, used in summarizing and/or measures in the "fact" tables
CREATE TABLE covid_19_datawarehouse.dim_state (
  state_id INT AUTO_INCREMENT UNIQUE,  #create a unique interger number for each record in table
  county TEXT,
  state TEXT,
  fips INT,
  PRIMARY KEY (state_id)
);

INSERT INTO covid_19_datawarehouse.dim_state (county, state, fips)
SELECT DISTINCT b.county, b.state, b.fips
FROM covid_19_datawarehouse.covid_19_county_stage as b;

/* check date_id table */
SELECT * FROM covid_19_datawarehouse.dim_state;

#create a dimensional "fact" table that contains measures used in calculations
CREATE TABLE covid_19_datawarehouse.fact_covid19 (
  ID INT,  #create a unique integer number for each record in table
  date_id INT, #foreign key --> date dimension 
  state_id INT, #foreign key --> state dimension 
  cases INT DEFAULT 0,
  deaths INT DEFAULT 0,
  CENSUS2010POP INT DEFAULT NULL,
  POPESTIMATE2019 INT DEFAULT NULL,
  NPOPCHG_2019 INT DEFAULT NULL,
  DEATHS2019 INT DEFAULT NULL,
  NATURALINC2019 INT DEFAULT NULL,
  INTERNATIONALMIG2019 INT DEFAULT NULL,
  DOMESTICMIG2019 INT DEFAULT NULL,
  NETMIG2019 INT DEFAULT NULL,
  RESIDUAL2019 INT DEFAULT NULL,
  GQESTIMATESBASE2010 INT DEFAULT NULL,
  GQESTIMATES2019 INT DEFAULT NULL,
  RDEATH2019 DOUBLE DEFAULT NULL,
  RNATURALINC2019 DOUBLE DEFAULT NULL,
  RINTERNATIONALMIG2019 DOUBLE DEFAULT NULL,
  RDOMESTICMIG2019 DOUBLE DEFAULT NULL,
  RNETMIG2019 DOUBLE DEFAULT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
  FOREIGN KEY (state_id) REFERENCES dim_state(state_id)
);

INSERT INTO covid_19_datawarehouse.fact_covid19 (id, cases, deaths,
CENSUS2010POP, POPESTIMATE2019, NPOPCHG_2019, DEATHS2019, NATURALINC2019, INTERNATIONALMIG2019, DOMESTICMIG2019, NETMIG2019,
RESIDUAL2019, GQESTIMATESBASE2010, GQESTIMATES2019, RDEATH2019, RNATURALINC2019, RINTERNATIONALMIG2019,  RDOMESTICMIG2019, RNETMIG2019,
date_id, state_id)

SELECT b.id, b.cases, b.deaths,
b.CENSUS2010POP, b.POPESTIMATE2019, b.NPOPCHG_2019, b.DEATHS2019, b.NATURALINC2019, b.INTERNATIONALMIG2019, b.DOMESTICMIG2019, b.NETMIG2019,
b.RESIDUAL2019, b.GQESTIMATESBASE2010, b.GQESTIMATES2019, b.RDEATH2019, b.RNATURALINC2019, b.RINTERNATIONALMIG2019,  b.RDOMESTICMIG2019, b.RNETMIG2019,
d.date_id, s.state_id

FROM covid_19_datawarehouse.covid_19_county_stage as b
LEFT JOIN covid_19_datawarehouse.dim_date d on b.covid_date = d.covid_date #put date dimensional key in fact table, for future OLAP joins
LEFT JOIN covid_19_datawarehouse.dim_state s on b.fips = s.fips #put state dimensional key in fact table, for future OLAP joins
;

#Query OLAP dimensional model - see "Database--> Reverse Engineer" for star-schema model in the "covid_19_datawarehouse" database
#get the total population, cases, deaths for the 20th week of the year - for the states of Iowa and Nebraska
SELECT s.state, d.covid_date, weekday(d.covid_date) as day_of_week, d.week_number, f.cases, f.deaths, f.popestimate2019
FROM covid_19_datawarehouse.fact_covid19 AS f
INNER JOIN covid_19_datawarehouse.dim_date AS d ON f.date_id = d.date_id
INNER JOIN covid_19_datawarehouse.dim_state AS s ON f.state_id = s.state_id
WHERE d.week_number = 20
AND s.state in ('iowa', 'nebraska')


