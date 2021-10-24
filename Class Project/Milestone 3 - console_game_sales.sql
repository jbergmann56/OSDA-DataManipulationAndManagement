/* 1a - Create a table named “console_game_sales” in the consoles schema, using the “ConsoleGames_201905.csv” file in the “Class Project/consoles” folder */
-- drop table consoles.console_game_sales  
CREATE TABLE consoles.console_game_sales (
  `Rank` int(11) DEFAULT NULL,
  `Rank_Last_Month` text,
  `Title` text,
  `Publisher` text,
  `Genre` text,
  `Date` date DEFAULT NULL
);

/* 1b - Create a SQL script that inserts the values of the CSV file, into the “console_game_sales” table. */
INSERT INTO consoles.console_game_sales (`Rank`, Rank_Last_Month,Title,Publisher,Genre,`Date`) 
VALUES
(1,'1','Mortal Kombat 11','Warner Bros. Interactive','Fighting','2019-5-30'),
(2,'2','Days Gone','Sony (Corp)','Action','2019-5-30'),
(3,'NEW','Total War: Three Kingdoms','Sega','Action','2019-5-30'),
(4,'NEW','Rage 2*','Bethesda Softworks','Shooter','2019-5-30'),
(5,'6','Grand Theft Auto V','Take 2 Interactive (Corp)','Action','2019-5-30'),
(6,'5','Super Smash Bros. Ultimate*','Nintendo','Platform','2019-5-30'),
(7,'11','Red Dead Redemption II','Take 2 Interactive (Corp)','Shooter','2019-5-30'),
(8,'3','MLB 19: The Show','Sony (Corp)','Sports','2019-5-30'),
(9,'14','Minecraft#','Multiple Video Game Manufacturers','Puzzle','2019-5-30'),
(10,'9','NBA 2K19','Take 2 Interactive (Corp)','Sports','2019-5-30');

/* 2. The company is not interested in producing Sports Games - Remove these observations from the “console_game_sales” table */ 
DELETE FROM consoles.console_game_sales WHERE Genre = 'Sports';

/* 3.The CEO insist that “Barbie Adventure Game” is a top-seller.  Insert a record with that “Title” into the table, for comparison purposes (mock-up field values)  */ 
INSERT INTO consoles.console_game_sales (`Rank`, Rank_Last_Month,Title,Publisher,Genre,`Date`) 
VALUES
(55,	'102',	'Barbie Adventure Game',	'Nevermind Games',	'Action',	'2019-5-30');
