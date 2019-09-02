create database consumer_complaints;

use consumer_complaints;

drop table if exists complaints;

create table complaints
(
	date_received date,
    product_name varchar(50),
    subproduct varchar(50),
    issue varchar(255),
    subissue varchar(255),
    consumer_narrative varchar(255),
    company_response_public varchar(255),
    company varchar(50),
    state char(2),
    zipcode varchar(5),
    tags varchar(255),
    consumer_consent varchar(50),
    submission_medium varchar(50),
    date_sent date,
    company_response_consumer varchar(255),
    timely_response varchar(3),
    consumer_disputed varchar(3),
    complaintID varchar(10)
);

