#1. Create a schema named “MissingPersons” 
CREATE SCHEMA missingpersons; 
USE missingpersons;

/* #2.Create a table in “MissingPersons” schema named “Person”, with the following qualities:  
Fields:  ID, LastName, FirstName, Age
Primary Key: ID
Field Constraints: Not Nullable
*/
CREATE TABLE person (
  ID INT NOT NULL, 
  lastname VARCHAR(50), 
  firstname VARCHAR(50), 
  age INT,
  PRIMARY KEY (ID)
  );

#3. Alter the table to include (add) a “Gender” field. 
ALTER TABLE person
ADD gender CHAR(1);

/*  #4.  Insert the following records into the table: 
(1,'Doe','Jane',42,’F’) ,(2,'Doe','John',57,’M’),
(3,'Presley','Elvis',82,’M') ,(4,'Shakur','Tupac',49,’M’) */
INSERT INTO person (ID, lastname, firstname, age, gender)
VALUES
(1,'Doe','Jane',42,'F'),
(2,'Doe','John',57,'M'),
(3,'Presley','Elvis',82,'M'),
(4,'Shakur','Tupac',49,'M');

#5. Delete the record with “lastname” = “Presley” 
-- if error run the followin code:  SET SQL_SAFE_UPDATES = 0;
DELETE FROM person WHERE lastname = 'Presley';

#6. Update the LastName in the record that contains “ID” = 4 to “LastName” = ‘Crooks’ 
UPDATE missingpersons.person
SET lastname = 'Crooks' 
WHERE ID = 4;

#7. Drop the column “firstname” from the table 
ALTER TABLE missingpersons.person
DROP firstname;

#8. drop the “Person” table from the “MissingPersons” schema.
DROP TABLE missingpersons.person; 