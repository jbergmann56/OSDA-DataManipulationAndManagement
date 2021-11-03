USE class_project; 
/* 3. Once designing and normalization of the database is complete, create the SQL code (via views) 
that creates the OLAP relationship between tables.  */

#Create Game Relation
CREATE OR REPLACE VIEW class_project.game AS
SELECT `Name` AS game_name, #primary key
`rank` AS game_rank, `year` AS game_year, genre, na_sales, jp_sales, other_sales,
platform, #foreign key - console
publisher #foreign key - publisher

FROM console_games;

#test relationship
SELECT * FROM class_project.game as a;

#Create Game_Preorder Relation
CREATE OR REPLACE VIEW class_project.game_preorder AS
SELECT game, CURDATE() AS `date`, #primary composite key
pos, weeks_to_launch_new, days_last_published 

FROM vw_usa_preorder_chart;

#test relationship
SELECT a.*,b.* 
FROM class_project.game a LEFT JOIN class_project.game_preorder b on b.game = a.game_name;

#Create Game_Sales Relation
CREATE OR REPLACE VIEW class_project.game_sales AS
SELECT title, `date`, #Composite Primary key
`rank`

FROM console_game_rank;

#test relationship
SELECT a.*,b.* 
FROM class_project.game a LEFT JOIN class_project.game_sales b on b.title = a.game_name;

#Create Publisher Relation
CREATE OR REPLACE VIEW class_project.publisher AS
SELECT DISTINCT publisher #Primary key

FROM console_games;

#test relationship
SELECT a.*,b.* 
FROM class_project.game a LEFT JOIN class_project.publisher b on b.publisher = a.publisher;

#Create Console Relation
CREATE OR REPLACE VIEW class_project.console AS
SELECT DISTINCT platform AS platform_name, #Primary key
first_retail_availability, discontinued, units_sold_millions, `comment` AS platform_comment

FROM console_dates;

#test relationship
SELECT a.*,b.* 
FROM class_project.game a LEFT JOIN class_project.console b on b.platform_name = a.platform;