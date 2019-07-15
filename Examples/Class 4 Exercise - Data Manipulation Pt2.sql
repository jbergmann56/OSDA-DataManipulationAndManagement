-- 1. Create a schema named “MissingPersons”
create schema MissingPersons; 
use MissingPersons;

-- 2. Create a table in “MissingPersons” schema named “person”, with the following qualities: 
-- Fields:  ID, LastName, FirstName, Age
-- Primary Key: ID
-- Field Constraints: Not Nullable
 
CREATE TABLE MissingPersons (
  ID int not null, 
  LastName varchar(50), 
  FirstName varchar(50), 
  Age int,
  PRIMARY KEY (ID)
  );

-- 3. Alter the table to include (add) a “Gender” field.
ALTER TABLE MissingPersons
ADD Gender char(1);

-- 4.   Insert the following records into the classicmodels.customers table: 
insert into MissingPersons (ID, LastName, FirstName, Age, Gender)
values 
(1,'Doe','Jane',42,'F'),
(2,'Doe','John',57,'M'),
(3,'Presley','Elvis',82,'M'),
(4,'Shakur','Tupac',49,'M')

-- 5. Delete the record with “LastName” = “Presley”
-- if error SET SQL_SAFE_UPDATES = 0;
Delete from  MissingPersons WHERE LastName = 'Presley';

-- 6. Update the LastName in the record that contains “ID” = 4 to “LastName” = ‘Crooks’
update  MissingPersons
SET LastName = 'Crooks'
where ID = 4;

-- 7. drop the column "FirstName" from the table
ALTER TABLE MissingPersons DROP FirstName;

-- 7. drop the "person" from the table
Drop TABLE MissingPersons;