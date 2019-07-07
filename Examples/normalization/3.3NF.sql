-- check for 3NF
SELECT 
    *
FROM
    customers;
SELECT 
    *
FROM
    transactions;

-- create temp table with item data
CREATE TABLE temp AS SELECT item, item_description, retail_price FROM
    transactions;

-- check success
SELECT 
    *
FROM
    temp;

-- create item table
CREATE TABLE items AS SELECT DISTINCT * FROM
    temp;

-- check success, 1NF, 2NF, 3NF
SELECT 
    *
FROM
    items;

-- delete non-FK item fields from transactions
alter table transactions
drop column item_description,
drop column retail_price;

-- check success, check for 3NF
SELECT 
    *
FROM
    transactions;

-- clean up: drop temp table
drop table temp;

