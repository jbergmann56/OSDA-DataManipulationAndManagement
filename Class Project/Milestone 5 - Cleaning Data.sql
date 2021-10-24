use consoles; 
/* 1. Use the “USA_PreOrders_Import.sql” file to create a table populated with preorder data, in the “Class Project/Consoles” folder.  */

/* 2. Create a “USA_PreOrder_Chart” view that cleans-up the following data.
a) Change the “N/A” values in the “Weeks to Launch” column to 30, then cast the field as an Integer 
b) Create “Console”, “Company” and “Genre” fields from the text in “Game_Console_Company_Genre” 
c) Fill-In the “Game” and “Genre” columns with relevant values, for games in Pos 1-10.  
d) Calculate the difference between today and the date the preorder list was last published. (‘2018-12-29’) */
Create view vw_USA_PreOrder_Chart as 
	SELECT Pos, Weekly_Change, Total, 
    convert(replace(a.Weeks_To_Launch,'N/A',30),unsigned) as Weeks_To_Launch_New, /* 2a) */ 
    /* for console, get string between the "(" and ")" */ 
    substring(a.Game_Console_Company_Genre, INSTR(a.Game_Console_Company_Genre, '(')+1, INSTR(a.Game_Console_Company_Genre, ')')-INSTR(a.Game_Console_Company_Genre, '(')-1) as Console, /* 2b) */ 
    /* for Company, look for substring in text, then give corresponding answer */
    Case when pos between 1 and 10 then 'Extreme Games'  /* "Created Company" */ 
    when a.Game_Console_Company_Genre like '%Bandai%' then 'Bandai Namco Entertainment'
    when  a.Game_Console_Company_Genre like '%Nintendo%' then 'Nintendo'
    when  a.Game_Console_Company_Genre like '%Ubisoft%' then 'Ubisoft'
    when  a.Game_Console_Company_Genre like '%Microsoft%' then 'Microsoft'
    when  a.Game_Console_Company_Genre like '%Electronic Arts%' then 'Electronic Arts'
    when  a.Game_Console_Company_Genre like '%Capcom%' then 'Capcom'
    when  a.Game_Console_Company_Genre like '%505 Games%' then '505 Games'
    else 'Other Company' end as Company, /* 2b) */ 
    /* for Company, look for substring in text, then give corresponding answer */
    Case when pos in (1,3,5,7,9) then 'Action-Adventure'  /* 2c */ 
    when pos in (2,4,6,8,10) then 'Role-Playing'  /* 2c */ 
    when a.Game_Console_Company_Genre like '%Role-Playing%' then 'Role-Playing'
    when  a.Game_Console_Company_Genre like '%Action-Adventure%' then 'Action-Adventure'
    when  a.Game_Console_Company_Genre like '%Fighting%' then 'Fighting'
    when  a.Game_Console_Company_Genre like '%Action%' then 'Action Only'
    else 'Other Genre' end as Genre,
    datediff(curdate(),  '2018-12-29') as days_last_published /* 2d */ 
    
    FROM consoles.usa_preorder as a
 
/* 3. Fill-in the “Genre” for the global top-10 pre-ordered games, select “Weeks to Launch”, then summarize by “Total” - 
What Genre has the top pre orders as of EOY 2018, and what genre do you think will be best in 2019? */

SELECT a.genre, a.Weeks_To_Launch_New, sum(total) as total_presales_2018
FROM vw_USA_PreOrder_Chart as a
group by a.genre, a.Weeks_To_Launch_New
order by a.genre, a.Weeks_To_Launch_New
