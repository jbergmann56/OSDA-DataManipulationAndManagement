#use class_project; 
/* 1. What are the total sales for Action vs. Role-Playing games in North America by Year, since 2000?  */
SELECT a.`year` AS game_year, a.genre, sum(na_sales) AS NA_Total_Sales
FROM class_project.console_games AS a 
WHERE a.`year` >= 2000
AND a.genre = 'Action'
GROUP BY game_year

UNION ALL

SELECT a.`year` AS game_year, a.genre, sum(na_sales) as NA_Total_Sales
FROM class_project.console_games as a 
WHERE a.`year` >= 2000
AND a.genre = 'Role-Playing'
GROUP BY game_year

ORDER BY game_year, genre; #order results after union

/* 2. During that time period, how does “Role-Playing” game sales compare vs. other Genres? (All Countries)  */
SELECT a.genre, SUM(a.na_sales+a.eu_sales+a.jp_sales+a.other_sales) AS Total_Sales
FROM ( #subquery
SELECT a1.genre, a1.na_sales, a1.eu_sales, a1.jp_sales,a1.other_sales
FROM class_project.console_games AS a1
WHERE a1.`year` >= 2000 
) AS a
GROUP BY a.genre
ORDER BY Total_Sales DESC;

/* 3. What is the most popular console (by NA Sales) for Role Playing games, for consoles with a “first_retail_availablity” since 2000?  */
SELECT a.genre, b.platform, b.first_retail_availability, b.discontinued, SUM(na_sales) AS NA_Total_Sales
FROM class_project.console_games AS a 
INNER JOIN class_project.console_dates AS b ON a.platform = b.platform AND b.first_retail_availability >= '2000-01-01'
WHERE a.`year` >= 2000
AND a.genre = 'Role-Playing'
GROUP BY a.genre, b.platform, b.first_retail_availability, b.discontinued;

/* 4. Obtain the average rank of games created in 2014, by genre.  
How does this order compare with the current video game rankings in the “console_game_sales” table?   */

SELECT '2014' AS game_year, a.genre, AVG(a.`rank`) AS avg_game_rank
FROM class_project.console_games AS a 
WHERE a.`year` = 2014
GROUP BY a.genre

UNION

SELECT 'NOT 2014' AS game_year, a.genre, AVG(a.`rank`) AS avg_game_rank
FROM class_project.console_games AS a 
WHERE a.`year` IN (SELECT a.`year` FROM class_project.console_games WHERE a.`year` <> 2014)
GROUP BY a.genre

ORDER BY avg_game_rank;

