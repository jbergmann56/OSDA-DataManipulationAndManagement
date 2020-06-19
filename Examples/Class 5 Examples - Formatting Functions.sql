/* Case Statements */
SELECT vw.country,  
CASE WHEN country = 'India' THEN 'Gandhi'                      
WHEN country = 'Nepal'   THEN 'Mt. Everest'                      
WHEN country = 'China'   THEN 'Great Wall'               
ELSE  'Unknown' END  AS  famous_stuff
FROM world.vw_countries_asia AS vw                         
WHERE vw.country IN ('India', 'China', 'Nepal','Taiwan');

/* Cleaning Data - US Regions */
SELECT DISTINCT district AS state, /* Eliminates duplicate rows */
CASE WHEN district IN ('Nebraska','Iowa','Missouri','Kansas') THEN 'Midwest' 
WHEN district IN ('Arizona','Colorado') THEN 'Southwest' 
WHEN district LIKE ('Cali%') THEN 'West Coast'
WHEN district = 'New Mexico' OR district = 'Nevada' THEN 'Southwest'               
WHEN district LIKE ('N_w%') then 'Northeast' /*Ex. ‘New York’, ‘New Jersey’*/ 
WHEN district LIKE ('% of %') then 'East Coast'
WHEN district LIKE ('%Dakota') then 'Midwest' /*Ex. ‘North Dakota’ */
ELSE 'needs region' END as usa_region   /* States that don’t meet criteria */
FROM world.city  
WHERE countrycode='USA' /* and district LIKE ('N_w [M]%') */
ORDER BY state;

/* Identifying Duplicates - By Aggregation & Key */
#outer query - duplicates by key 
SELECT a.*   
FROM world.city AS a  INNER JOIN
#inner query - by aggregation - using SUM(1)
(SELECT `name` AS city, SUM(1) AS `count`                                 
FROM world.city                                                                                
WHERE countrycode='USA'                                                              
GROUP BY `name`   
HAVING SUM(1) > 1) AS b ON  a.`name` = b.city 
WHERE a.countrycode='USA' 
ORDER BY a.`name`;

/* Removing Duplicates - By Aggregation & Key */
SELECT DISTINCT b.city, b.countrycode
FROM world.city AS a  INNER JOIN
(SELECT `name` AS city, countrycode, SUM(1) AS `count`                                 
FROM world.city                                                                                
WHERE countrycode='USA'                                                              
GROUP BY `name`, countrycode 
HAVING SUM(1) > 1) AS b ON  a.`name` = b.city 
WHERE a.countrycode='USA' 
ORDER BY a.`name`;

/* Numeric Examples */
SELECT FORMAT(12324.2573, 2), CAST('150' AS UNSIGNED), CAST('2020-07-09' AS DATE), IFNULL(NULL, 500), 
       ISNULL(NULL), COALESCE(3, NULL, NULL, 'W3Schools.com', NULL, 'Example.com'); 

/* String Examples */ 
SELECT CONCAT('Jeremy ','T. ', 'Bergmann') AS full_name, INSTR('myteststring','st'), TRIM(LEADING 'leading' FROM 'leadingtext' ), 
REPLACE('w3resource','ur','r'), LCASE('MYTESTSTRING'), LENGTH('Bergmann'), SUBSTRING('SQL Tutorial', 5, 3);

/* Date Examples */ 
SELECT CURDATE(), CURRENT_TIMESTAMP(), HOUR(CURRENT_TIMESTAMP()), DATEDIFF(CURDATE(), '1999-12-31'),
DAY('2008-05-15'),MONTH('2008-05-15'),YEAR('2008-05-15'), DAYOFWEEK(CURDATE()) ;

/* Numeric Functions */
# Convert Decimal to Integer 
SELECT `name` AS country, CONVERT(ROUND(gnpold,0),UNSIGNED) AS gnpold2                       
FROM world.country;
#World Query

#Coalesce "0" when null values exist in gnpold field
SELECT `name` AS country, COALESCE(gnpold,0) AS gnpold3                    
FROM world.country;

/*String Functions */
SELECT `name` AS city, district AS state,
CONCAT(`name`, ', ',  district) AS city_state_full, 
CASE WHEN district = 'New York' THEN 'NY'
WHEN INSTR(district,'Tex') then 'TX'
WHEN district = 'Arizona' THEN  REPLACE(district, 'Arizona', 'AZ')
WHEN TRIM(LEADING 'Penn' FROM district) = 'sylvania' THEN 'PA'
ELSE UPPER(LEFT(district,2)) END AS state_abbrev
FROM world.city AS a  
WHERE a.CountryCode='USA'; 

/*Date Functions*/
SELECT `name` AS country, YEAR(CURDATE()) AS curr_year, indepyear,
CASE WHEN indepyear IS NULL THEN 0
ELSE YEAR(CURDATE())-indepyear END AS years_ind
FROM world.country;

