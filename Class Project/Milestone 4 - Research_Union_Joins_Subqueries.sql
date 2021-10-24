use consoles; 
/* 1. What are the total sales for console games in North America by Year, since 2000?  */
SELECT a.game_year, a.genre, sum(na_sales) as NA_Total_Sales
FROM consoles.console_games as a 
where a.game_year >= 2000
and a.genre = 'Action'
group by a.game_year

union all 

SELECT a.game_year, a.genre, sum(na_sales) as NA_Total_Sales
FROM consoles.console_games as a 
where a.game_year >= 2000
and a.genre = 'Role-Playing'
group by a.game_year

order by game_year, genre;

/* 2. During that time period, how does “Role-Playing” game sales compare vs. other Genres? (All Countries)  */
SELECT a.genre, sum(na_sales+eu_sales+jp_sales+other_sales) as Total_Sales
FROM consoles.console_games as a 
where a.game_year >= 2000
group by a.genre
order by NA_Total_Sales desc

/* 3. What is the most popular console (by NA Sales) for Role Playing games, for consoles with a “first_retail_availablity” since 2008?  */
SELECT a.genre, b.platform_name, b.first_retail_availability, b.discontinued, sum(na_sales) as NA_Total_Sales
FROM consoles.console_games as a 
inner join console_dates as b on a.platform = b.platform_name and b.first_retail_availability >= '2000-01-01'
where a.game_year >= 2000
and a.genre = 'Role-Playing'
group by a.genre, b.platform_name

/* 4. Obtain the average rank of games created in 2016, by genre.  How does this order compare with the current video game rankings in the “console_game_sales” table?   */
SELECT a.genre, avg(game_rank) as avg_game_rank
FROM consoles.console_games as a 
where a.game_year = 2014
group by a.genre

/* 4a - compare results vs. console_game_sales table */ 
SELECT * FROM consoles.console_game_sales;