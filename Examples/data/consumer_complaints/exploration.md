# Exploration

1. How many complaints occur each year?
```
SELECT
    YEAR(date_received) as year,
    COUNT(YEAR(date_received)) as total_complaints
FROM
    complaints
GROUP BY YEAR(date_received);
```
There are 3x as many complaints reported in 2014 as 2013 and 2015.

Follow-up:
* Does 2014 look like an anomaly in the full dataset?

2. How many complaints occur by month?
```
SELECT
    MONTHNAME(date_received) AS month_received,
    COUNT(MONTH(date_received)) AS monthly_total,
    CASE
        WHEN COUNT(MONTH(date_received)) >= 6000 THEN '******'
        WHEN COUNT(MONTH(date_received)) >= 5000 THEN '*****'
        WHEN COUNT(MONTH(date_received)) >= 4000 THEN '****'
        ELSE '***'
    END AS monthly_total_viz
FROM
    complaints
GROUP BY MONTH(date_received)
ORDER BY MONTH(date_received);
```
There are fewer complaints made during the summer months May, June, and July.

Speculation: people interact with their financial institutions less often in the summer. They are more likely to interact with them during heavy buying seasons, like December, or tax season, like March and April.

Follow-ups:
* Over this the 3 year period covered by this dataset, I would naively expect about 56 complaints per month ( (365*3)/62177 ~= 56). How does that compare to the actual distribution of complaints by month for each year?
* To what extent is this data meaningful? Is more data necessary to try to say anything about the years 2013-2015?
* How accurate is this data? What is the time delay between when events occur and when the event is recorded in the data?

3. What is the distribution of complaints by year and month?
```
SELECT
    YEAR(date_received) AS year_received,
    MONTHNAME(date_received) AS month_received,
    COUNT(MONTH(date_received)) AS monthly_total,
    CASE
        WHEN COUNT(MONTH(date_received)) >= 3000 THEN '***'
        WHEN COUNT(MONTH(date_received)) >= 2000 THEN '**'
        WHEN COUNT(MONTH(date_received)) >= 1000 THEN '*'
        ELSE ''
    END AS monthly_total_viz
FROM
    complaints
GROUP BY YEAR(date_received), MONTH(date_received)
ORDER BY YEAR(date_received), MONTH(date_received);
```
This distribution shows that the data is incomplete for 2013 and 2015. That might explain why there is 3x more data reported in 2014. We only have 2013 data for July-December. We only have 2015 data for January-September and the extremely low counts for June-September suggest that actual complaints haven't made it into the data yet due to latency between among event, reporting, and recording. Thus, only 2014 plus or minus a few months in 2013 and 2015 is probably reliable. Those tails can provide some context for 2014.
