use class_project; 
/* 1. Use the “USA_PreOrders_Import.sql” file to create a table populated with preorder data, in the “ClASs Project/Consoles” folder.  */

/* 2. Create a “USA_PreOrder_Chart” view that cleans-up the following data.
a) Change the “N/A” values in the “Weeks to Launch” column to 30, THEN cASt the field AS an Integer 
b) Create “Console”, “Company” AND “Genre” fields from the text in “game_console_company_genre” 
c) Fill-In the “Game” AND “Genre” columns with relevant values, for games in Pos 1-10.  
d) Calculate the difference BETWEEN today AND the date the preorder list wAS lASt published. (‘2018-12-29’) */
ALTER VIEW class_project.vw_USA_PreOrder_Chart AS 
	SELECT pos, weekly_change, total, 
    CASE WHEN CAST(a.pos AS UNSIGNED) <= 10 THEN LEFT(a.game_console_company_genre,INSTR(a.game_console_company_genre,',')-1) #NOTE - in MySQL, must use SIGNED or UNSIGNED type for integers!
    ELSE a.game END AS game,
    convert(replace(a.Weeks_To_Launch,'N/A',30),unsigned) AS weeks_to_launch_new, /* 2a) */ 
    /* for console, get string BETWEEN the "(" AND ")" */ 
    SUBSTRING(a.game_console_company_genre, INSTR(a.game_console_company_genre, '(')+1, INSTR(a.game_console_company_genre, ')')-INSTR(a.game_console_company_genre, '(')-1) AS console, /* 2b) */ 
    /* for Company, look for substring in text, THEN give corresponding answer */
    CASE WHEN pos BETWEEN 1 AND 10 THEN 'Extreme Games'  /* "Created Company" */ 
    WHEN a.game_console_company_genre LIKE '%BANDai%' THEN 'BANDai Namco Entertainment'
    WHEN  a.game_console_company_genre LIKE '%NintENDo%' THEN 'NintENDo'
    WHEN  a.game_console_company_genre LIKE '%Ubisoft%' THEN 'Ubisoft'
    WHEN  a.game_console_company_genre LIKE '%Microsoft%' THEN 'Microsoft'
    WHEN  a.game_console_company_genre LIKE '%Electronic Arts%' THEN 'Electronic Arts'
    WHEN  a.game_console_company_genre LIKE '%Capcom%' THEN 'Capcom'
    WHEN  a.game_console_company_genre LIKE '%505 Games%' THEN '505 Games'
    ELSE 'Other Company' END AS company, /* 2b) */ 
    /* for Company, look for substring in text, THEN give corresponding answer */
    CASE WHEN pos in (1,3,5,7,9) THEN 'Action-Adventure'  /* 2c */ 
    WHEN pos in (2,4,6,8,10) THEN 'Role-Playing'  /* 2c */ 
    WHEN a.game_console_company_genre LIKE '%Role-Playing%' THEN 'Role-Playing'
    WHEN  a.game_console_company_genre LIKE '%Action-Adventure%' THEN 'Action-Adventure'
    WHEN  a.game_console_company_genre LIKE '%Fighting%' THEN 'Fighting'
    WHEN  a.game_console_company_genre LIKE '%Action%' THEN 'Action Only'
    ELSE 'Other Genre' END AS genre,
    datediff(curdate(),  '2018-12-29') AS days_last_published /* 2d */ 
    
    FROM class_project.usa_preorder AS a;
 
/* 3. Fill-in the “Genre” for the global top-10 pre-ordered games, select “Weeks to Launch”, THEN summarize by “Total” - 
What Genre hAS the top pre orders AS of EOY 2018, AND what genre do you think will be best in 2019? */

SELECT a.genre, a.Weeks_To_Launch_New, sum(total) AS total_presales_2018
FROM class_project.vw_USA_PreOrder_Chart AS a
GROUP BY a.genre, a.Weeks_To_Launch_New
ORDER BY a.genre, a.Weeks_To_Launch_New
