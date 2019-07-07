/* Step 1 - Create Database to store "Console" class project data */
create schema console;
use console; 

/* step 2 - create tables to hold console games and platform information */
CREATE TABLE console_games (
    game_rank integer,
    game_name varchar(1200),
    platform varchar(1200),
    game_year integer,
    genre varchar(20),
    publisher varchar(1200),
    na_sales float8,
    eu_sales float8,
    jp_sales float8,
    other_sales float8    
);
CREATE TABLE console_dates (
    platform_name char(120),
    first_retail_availability date,
    discontinued date,
    units_sold_mill float8,
    platform_comment varchar(120)    
);

/* Step 3 - Load console information into tables using MySQL Import utility
a) Right-Click Table -->  Table Data Import Wizard 
b) Select matching file from "project/console" directory --> Use existing table
c) Use Default Import Settings -->  Import Data */ 
