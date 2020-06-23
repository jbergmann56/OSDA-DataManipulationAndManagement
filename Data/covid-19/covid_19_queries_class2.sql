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
FROM us_census_fips AS a
LEFT JOIN 
(select distinct bb.fips from covid_19.us_counties as bb) as b on a.fips = b.fips
order by a.fips;