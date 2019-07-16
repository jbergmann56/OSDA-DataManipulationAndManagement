-- 1. Create a query using the “world.country” table that utilizes as many SQL operators as possible.  
create schema MissingPersons; 
use MissingPersons;

-- 2.Import a list of non-standard addresses, then use case statements to standardize them in a similar format.
 
CREATE TABLE Person (
  ID int not null, 
  LastName varchar(50), 
  FirstName varchar(50), 
  Age int,
  PRIMARY KEY (ID)
  );

-- 3. Utilize the ifnull() function on a column to replace null values with the one of your choice. (must be same data type!)
ALTER TABLE Person
ADD Gender char(1);

-- 4.   In the “world” schema, obtain the name of all cities in North America that have a population over 1M, where the primary language is English.   
insert into Person (ID, LastName, FirstName, Age, Gender)
values 
(1,'Doe','Jane',42,'F'),
(2,'Doe','John',57,'M'),
(3,'Presley','Elvis',82,'M'),
(4,'Shakur','Tupac',49,'M')

-- 5. Using world.country table, combine all countries (repeating) with a life expectency of > 70 years or a GNP > 100000 
-- if error SET SQL_SAFE_UPDATES = 0;
Delete from Person WHERE LastName = 'Presley';
