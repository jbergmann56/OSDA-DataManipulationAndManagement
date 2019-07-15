CREATE TABLE consoles.console_game_sales (
  `Rank` int(11) DEFAULT NULL,
  `Rank_Last_Month` text,
  `Title` text,
  `Publisher` text,
  `Genre` text,
  `Date` date DEFAULT NULL
);

insert into consoles.console_game_sales (`Rank`, Rank_Last_Month,Title,Publisher,Genre,`Date`) 
values
(1,'1','Mortal Kombat 11','Warner Bros. Interactive','Fighting',5/30/2019),
(2,'2','Days Gone','Sony (Corp)','Action',5/30/2019),
(3,'NEW','Total War: Three Kingdoms','Sega','Action',5/30/2019),
(4,'NEW','Rage 2*','Bethesda Softworks','Shooter',5/30/2019),
(5,'6','Grand Theft Auto V','Take 2 Interactive (Corp)','Action',5/30/2019),
(6,'5','Super Smash Bros. Ultimate*','Nintendo','Platform',5/30/2019),
(7,'11','Red Dead Redemption II','Take 2 Interactive (Corp)','Shooter',5/30/2019),
(8,'3','MLB 19: The Show','Sony (Corp)','Sports',5/30/2019),
(9,'14','Minecraft#','Multiple Video Game Manufacturers','Puzzle',5/30/2019),
(10,'9','NBA 2K19','Take 2 Interactive (Corp)','Sports',5/30/2019)
