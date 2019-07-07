create database online_sales;

use online_sales;

CREATE TABLE transactions (
    transaction_id VARCHAR(50),
    timestamp_id VARCHAR(50),
    customer_id VARCHAR(50),
    fname VARCHAR(50),
    surname VARCHAR(50),
    shipping_state VARCHAR(20),
    item VARCHAR(50),
    item_description VARCHAR(50),
    retail_price DECIMAL(6 , 2 ),
    loyalty_discount DECIMAL(3 , 2 )
);
