USE classicmodels;
CREATE TABLE classicmodels.customers (	
customer_number INT NOT NULL UNIQUE,	
customer_name VARCHAR(50) NOT NULL,     
contact_lastname VARCHAR(50) NOT NULL,   
contact_firstname VARCHAR(50) NOT NULL,    
phone VARCHAR(50) NOT NULL,    
addressline1 VARCHAR(50) NOT NULL,   
addressline2 VARCHAR(50) DEFAULT NULL,    
city VARCHAR(50) NOT NULL,   
state CHAR(2) DEFAULT NULL,    
postalcode VARCHAR(15) DEFAULT NULL,    
country CHAR(3) NOT NULL DEFAULT 'USA',    
salesrep_employeenumber INT DEFAULT NULL,    
creditlimit DECIMAL(10,2) CHECK (creditlimit < 1000000),   
 PRIMARY KEY (customer_number)
);

/* Constraints are the rules enforced on the data columns of a table.
Types of Constraints:  https://www.tutorialspoINT.com/sql/sql-constraINTs.htm */

ALTER TABLE customers
ADD column_name VARCHAR(255);

ALTER TABLE classicmodels.customers
DROP column_name;

#DROP CONSTRAINT customers_ibfk_1; --example, no named constraint in classicmodels.customers table

DROP TABLE IF EXISTS customers;

INSERT  INTO classicmodels.customers (customer_number, customer_name, contact_lastname, contact_firstname, phone, addressline1, addressline2, city, state, postalcode, country, salesrep_employeenumber, creditlimit) 
VALUES (103,'Atelier graphique','Schmitt','Carine ','40.32.25','54, rue Royale',NULL,'Nantes',NULL,'44000','FRA',1370,2100.00),
       (112,'Signal Gift Stores','King','Jean','7025551838','8489 Strong St.',NULL,'Las Vegas','NV','83030','USA',1166,'71800.00');

UPDATE classicmodels.customers 
SET city = 'Omaha', state = 'NE'
WHERE customer_number = 103;


