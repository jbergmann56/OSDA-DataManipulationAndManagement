/* Step 1 - Create Database to store "Console" class project data */
use consoles; 

/* step 2 - create tables to hold console games and platform information */
CREATE TABLE USA_Preorder (
Pos Integer,
Game varchar(100),
Game_Console_Company_Genre varchar(200),
Weeks_to_Launch char(3),
Weekly_Change Integer,
Total Integer
);

insert into consoles.USA_Preorder (Pos, Game, Game_Console_Company_Genre, Weeks_to_Launch, Weekly_Change, Total)
values
(	11,'Kingdom Hearts III Walkthrough Guide - PS4','Kingdom Hearts III (PS4),Square Enix, Role-Playing','5',36258,355927	),
(	12,'Days Gone Walkthrough Guide - PS4','Days Gone (PS4),Sony Interactive Entertainment, Action-Adventure','17',1298,139289	),
(	13,'New Super Mario Bros. U Deluxe Walkthrough Guide - NS','New Super Mario Bros. U Deluxe (NS),Nintendo, Platform','2',12774,122379	),
(	14,'Resident Evil 2 Walkthrough Guide - PS4','Resident Evil 2 (PS4),Capcom, Action-Adventure','4',4244,97851	),
(	15,'Kingdom Hearts III Walkthrough Guide - XOne','Kingdom Hearts III (XOne),Square Enix, Role-Playing','5',3400,77673	),
(	16,'Ace Combat 7: Skies Unknown Walkthrough Guide - PS4','Ace Combat 7: Skies Unknown (PS4),Bandai Namco Games, Shooter','3',2366,57941	),
(	17,'MLB The Show 19 Walkthrough Guide - PS4','MLB The Show 19 (PS4),Sony Interactive Entertainment, Sports','13',5627,57718	),
(	18,'Jump Force Walkthrough Guide - PS4','Jump Force (PS4),Bandai Namco Entertainment, Fighting','7',4591,52972	),
(	19,'Devil May Cry 5 Walkthrough Guide - PS4','Devil May Cry 5 (PS4),Capcom, Action','5',1663,48593	),
(	20,'Ace Combat 7: Skies Unknown Walkthrough Guide - XOne','Ace Combat 7: Skies Unknown (XOne),Bandai Namco Games, Shooter','3',1387,47429	),
(	21,'Resident Evil 2 Walkthrough Guide - XOne','Resident Evil 2 (XOne),Capcom, Action-Adventure','4',2242,46534	),
(	22,'Metro Exodus Walkthrough Guide - XOne','Metro Exodus (XOne),Deep Silver, Shooter','7',1104,41141	),
(	23,'Metro Exodus Walkthrough Guide - PS4','Metro Exodus (PS4),Deep Silver, Shooter','7',1025,40665	),
(	24,'Crackdown 3 Walkthrough Guide - XOne','Crackdown 3 (XOne),Microsoft Studios, Action','7',496,40540	),
(	25,'Mortal Kombat 11 Walkthrough Guide - XOne','Mortal Kombat 11 (XOne),Warner Bros. Interactive Entertainment, Fighting','17',3854,35254	),
(	26,'Tom Clancy’s The Division 2 Walkthrough Guide - PS4','Tom Clancy’s The Division 2 (PS4),Ubisoft, Shooter','11',1684,34093	),
(	27,'Yoshi Walkthrough Guide - NS','Yoshi (NS),Nintendo, Platform','13',1154,27998	),
(	28,'Tom Clancy’s The Division 2 Walkthrough Guide - XOne','Tom Clancy’s The Division 2 (XOne),Ubisoft, Shooter','11',1211,27635	),
(	29,'Sekiro: Shadows Die Twice Walkthrough Guide - PS4','Sekiro: Shadows Die Twice (PS4),Activision, Role-Playing','12',1456,27403	),
(	30,'Mortal Kombat 11 Walkthrough Guide - PS4','Mortal Kombat 11 (PS4),Warner Bros. Interactive Entertainment, Fighting','17',5949,26416	),
(	31,'Anthem Walkthrough Guide - PS4','Anthem (PS4),Electronic Arts, Role-Playing','8',1720,25142	),
(	32,'Overkills The Walking Dead Walkthrough Guide - PS4','Overkills The Walking Dead (PS4),505 Games, Action-Adventure','6',1119,23756	),
(	33,'Animal Crossing Walkthrough Guide - NS','Animal Crossing (NS),Nintendo, Simulation','N/A',1784,23059	),
(	34,'Luigis Mansion 3 Walkthrough Guide - NS','Luigis Mansion 3 (NS),Nintendo, Action-Adventure','N/A',1398,22472	),
(	35,'Bayonetta 3 Walkthrough Guide - NS','Bayonetta 3 (NS),Nintendo, Action','N/A',22464,22464	),
(	36,'Code Vein Walkthrough Guide - PS4','Code Vein (PS4),Bandai Namco Entertainment, Action','N/A',206,22062	),
(	37,'Anthem Walkthrough Guide - XOne','Anthem (XOne),Electronic Arts, Role-Playing','8',1522,21428	),
(	38,'Overkills The Walking Dead Walkthrough Guide - XOne','Overkills The Walking Dead (XOne),505 Games, Action-Adventure','6',738,19999	),
(	39,'Mortal Kombat 11 Walkthrough Guide - NS','Mortal Kombat 11 (NS),Warner Bros. Interactive Entertainment, Fighting','17',1753,18490	),
(	40,'Code Vein Walkthrough Guide - XOne','Code Vein (XOne),Bandai Namco Entertainment, Action','N/A',278,18378	),
(	1,'','Super Smash Bros. (2018)(NS),,','1',53541.5539431225,1103894	),
(	2,'','Red Dead Redemption 2(PS4),,','3',42068.6928019115,705407	),
(	3,'','Call of Duty: Black Ops IIII(PS4),,','7',11796.1830862622,511667	),
(	4,'','Mario Kart 8 Deluxe(NS),,','2',23637.3874871803,438400	),
(	5,'','Spider-Man (PS4)(PS4),,','9',6575.17018722231,426691	),
(	6,'','Super Mario Party(NS),,','6',33735.4932424377,422274	),
(	7,'','FIFA 19(PS4),,','4',29211.2176858786,373147	),
(	8,'','Pokemon: Lets Go, Pikachu!(NS),,','8',10761.9295445549,337851	),
(	9,'','Red Dead Redemption 2(XOne),,','5',18133.9408516226,281247	),
(	10,'','Call of Duty: Black Ops IIII(XOne),,','10',22517.3616567018,250631	)




