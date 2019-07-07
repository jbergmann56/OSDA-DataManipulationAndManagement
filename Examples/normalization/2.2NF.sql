-- check for 2NF
SELECT 
    *
FROM
    transactions;

-- separate customer cols
CREATE TABLE temp AS SELECT customer_id,
    fname,
    surname,
    shipping_state,
    loyalty_discount FROM
    transactions;

-- check output
SELECT 
    *
FROM
    temp;

-- check for 1NF
SELECT 
    *
FROM
    temp;

-- remove duplicates = convert to 1NF
CREATE TABLE customers AS SELECT DISTINCT * FROM
    temp;

-- check success and for 2NF
SELECT 
    *
FROM
    customers;

-- drop customer cols from transactions, except FK
alter table transactions
drop column fname,
drop column surname,
drop column shipping_state,
drop column loyalty_discount;

-- check success
SELECT 
    *
FROM
    transactions;
    
-- clean up: delete temp table
drop table temp;