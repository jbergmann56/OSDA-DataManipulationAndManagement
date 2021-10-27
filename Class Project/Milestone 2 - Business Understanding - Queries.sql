USE class_project;  /* use the project's database/schema - console */
-- 1. Based on the collected console data, what is the newest platform in our dataset and what year was it first available?    
SELECT *
FROM console_dates
ORDER BY STR_TO_DATE(first_retail_availability, '%m/%d/%Y') DESC; 
#note: STR_TO_DATE is a mysql function used to convert date string of different formats to date types!

-- 2. Which console had the longest lifespan (in years)?  
SELECT platform,  DATEDIFF(STR_TO_DATE(discontinued, '%m/%d/%Y'),STR_TO_DATE(first_retail_availability, '%m/%d/%Y'))/365 AS console_life
FROM console_dates
ORDER BY console_life DESC;

-- 3. Based on game data, which country has the most video game sales, over all platforms? 
SELECT SUM(na_sales) AS na_sales, sum(eu_sales) as eu_sales,sum(jp_sales) AS jb_sales, SUM(other_sales) AS other_sales #sums over entire columns
FROM console_games;

-- 4. How many video games were produced for the NES platform? 
SELECT count(DISTINCT `name`) AS game_count
FROM console_games
WHERE platform = 'NES';

-- 5. What Genre of games had the most unit sales for the XBox 360 system? (Math
SELECT genre, SUM(na_sales+eu_sales+jp_sales+other_sales) AS total_sales
FROM console_games
WHERE platform = 'X360'
GROUP BY genre
ORDER BY total_sales DESC;

-- 6. Overall, what is the most popular genre of games, by unit sales?  
SELECT genre, SUM(na_sales+eu_sales+jp_sales+other_sales) AS total_sales
FROM console_games
GROUP BY genre
ORDER BY total_sales DESC;

-- 7. Based on this information, what type of game and/or console  would you recommend to management?   
-- Based on your knowledge of the problem, data research & intuition - Choose your own answer!