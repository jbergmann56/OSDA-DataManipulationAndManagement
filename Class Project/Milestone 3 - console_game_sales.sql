/* Note: Build the tables in your given schema - ex. jbergmann */
/* 1a - Create a table named “console_game_sales” in the consoles schema, using the “ConsoleGames_201905.csv” file in the “Class Project/consoles” folder */
DROP TABLE IF EXISTS class_project.console_game_rank;  
CREATE TABLE class_project.console_game_rank (
   id INT NOT NULL AUTO_INCREMENT, #creates a running counter for the number of rows, good to use for primary key 
  `rank` INT DEFAULT NULL,
  `rank_last_month` TEXT,
  `title` TEXT,
  `publisher` TEXT,
  `genre` TEXT,
  `date` TEXT DEFAULT NULL,
  PRIMARY KEY (id)
);

/* 1b - Create a SQL script that inserts the values of the CSV file, into the “console_game_sales” table. */
INSERT INTO class_project.console_game_rank (`rank`, rank_last_month,title,publisher,genre,`date`) 
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
DELETE FROM class_project.console_game_rank
WHERE genre = 'Sports';

/* 3.The CEO insist that “Barbie Adventure Game” is a top-seller.  Insert a record with that “Title” into the table, for comparison purposes (mock-up field values)  */ 
INSERT INTO class_project.console_game_rank (`rank`, rank_last_month, title, publisher, genre, `date`) 
VALUES
(55,	'102',	'Barbie Adventure Game',	'Nevermind Games',	'Action',	'2019-5-30');
