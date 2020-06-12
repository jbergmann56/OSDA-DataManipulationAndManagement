USE covid_19; #sleect the covid_19 database for active use

#Class 2 - Writing Queries
# What % of COVID-19 Cases vs. COVID-Related Deaths 
SELECT WEEK(`date`) as covid19_week, SUM(cases) AS covid19_cases_tot, SUM(deaths) AS covid19_deaths_total,
SUM(deaths)/SUM(cases) AS covid19_deaths_pcnt 
FROM covid_19.us
WHERE WEEK(`date`) BETWEEN 14 and 18
GROUP BY WEEK(`date`);

# What % of COVID-19 Cases vs. COVID-Related Deaths - Nebraska	1.37%
SELECT state, WEEK(`date`) as covid19_week, SUM(cases) AS covid19_cases_tot, SUM(deaths) AS covid19_deaths_total,
SUM(deaths)/SUM(cases) AS covid19_deaths_pcnt 
FROM covid_19.us_states
WHERE state in ('nebraska','iowa')
GROUP BY state, WEEK(`date`)
ORDER BY WEEK(`date`),state; 

#overall covid19 death % - 5.58%
SELECT state, SUM(deaths)/SUM(cases) AS covid19_deaths_pcnt 
FROM covid_19.us_states
WHERE WEEK(`date`) BETWEEN 13 and 20
GROUP BY state
ORDER BY SUM(deaths)/SUM(cases) DESC; 

#overall covid19 death % - 5.58%
SELECT SUM(deaths)/SUM(cases) AS covid19_deaths_pcnt 
FROM covid_19.us_states
WHERE WEEK(`date`) BETWEEN 13 and 20; 

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
SELECT a.fips, a.`date`, a.county,	a.state, a.cases, a.deaths,
	 (SELECT DISTINCT b.popestimate2019 FROM covid_19.us_census_fips AS b WHERE a.fips = b.fips) AS popestimate2019
FROM covid_19.us_counties AS a
ORDER BY a.fips;

#Class 3 - Extracting and Storing Data
#create view with Nebraska counties only 
CREATE VIEW us_states_ne AS 
SELECT `date` AS covid_date, state, fips, county, cases, deaths
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
SELECT `date` AS covid_date, state, fips, county, cases, deaths
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
