CREATE DATABASE classicmodels;
USE classicmodels;

CREATE TABLE customers (
	customer_number INT(11) NOT NULL,
	customer_name VARCHAR(50) NOT NULL, 
    contact_lastname VARCHAR(50) NOT NULL,
    contact_firstname VARCHAR(50) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    addressline1 VARCHAR(50) NOT NULL,
    addressline2 VARCHAR(50) DEFAULT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) DEFAULT NULL,
    postalcode VARCHAR(15) DEFAULT NULL,
    country VARCHAR(50) NOT NULL,
    salesrep_employeenumber INT(11) DEFAULT NULL,
    creditlimit DECIMAL(10,2) DEFAULT NULL,
    PRIMARY KEY (customer_number)
);

INSERT  INTO classicmodels.customers (customer_number, customer_name, contact_lastname, contact_firstname, phone, addressline1, addressline2, 
city, state, postalcode, country, salesrep_employeenumber, creditlimit) 

VALUES 
(103,'Atelier graphique','Schmitt','Carine ','40.32.25','54, rue Royale',NULL,'Nantes',NULL,'44000','France',1370,2100.00),
(112,'Signal Gift Stores','King','Jean','7025551838','8489 Strong St.',NULL,'Las Vegas','NV','83030','USA',1166,'71800.00');

UPDATE  classicmodels.customers 
SET city = 'Omaha'
where customer_number = 103;

DELETE FROM  classicmodels.customers
WHERE customer_number = 112;

use world;
CREATE VIEW world.vw_countries_asia AS
  SELECT  tbl.`Name` AS country
  FROM world.country AS tbl
  WHERE  (tbl.continent = 'Asia');

  SELECT  country
  FROM world.vw_countries_asia
  WHERE  Country IN ('India', 'China', 'Nepal')


