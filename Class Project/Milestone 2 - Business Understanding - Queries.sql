USE console;  /* use the project's database/schema - console */
-- 1. Based on the collected console data, what is the newest platform in our dataset and what year was it first available?    
SELECT *
FROM console_dates
order by first_retail_availability desc;

-- 2. Which console had the longest lifespan (in years)?  
SELECT platform_name,  datediff(discontinued,first_retail_availability)/365 as console_life
FROM console_dates
order by console_life desc;

-- 3. Based on game data, which country has the most video game sales, over all platforms? 
SELECT sum(na_sales) as na_sales, sum(eu_sales) as eu_sales,sum(jp_sales) as jb_sales,sum(other_sales) as other_sales
FROM console_games;

-- 4. How many video games were produced for the NES platform? 
SELECT platform, sum(na_sales+eu_sales+jp_sales+other_sales) as total_sales
FROM console_games
where platform = 'NES'
group by platform;

-- 5. What Genre of games had the most unit sales for the XBox 360 system? 
SELECT genre, sum(na_sales+eu_sales+jp_sales+other_sales) as total_sales
FROM console_games
where platform = 'X360'
group by genre
order by total_sales desc;

-- 6. Overall, what is the most popular genre of games, by unit sales?  
SELECT genre, sum(na_sales+eu_sales+jp_sales+other_sales) as total_sales
FROM console_games
group by genre
order by total_sales desc;

-- 7. Based on this information, what type of game and/or console  would you recommend to management?   
-- Based on your knowledge of the problem, data research & intuition - Choose your own answer!