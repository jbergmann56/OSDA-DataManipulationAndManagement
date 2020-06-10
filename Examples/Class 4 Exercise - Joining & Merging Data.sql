-- 1. Using a UNION ON the world.country table, combine all countries (repeating) with a life expectancy of > 80 years or a GNP > 1000000, with no repeats.   
SELECT a.`Name` AS country
FROM world.country AS a
WHERE lifeexpectancy > 80

UNION 

SELECT a.`Name` AS country
FROM world.country AS a  
WHERE GNP > 1000000;

-- 2.  List all official languages spoken in the 'Southeast Asia' region
SELECT DISTINCT b.`language`
FROM world.country AS a  
INNER JOIN  world.countrylanguage AS b ON a.`code` = b.countrycode AND b.isofficial = 'T'
WHERE a.region = 'Southeast Asia';

-- 3.  List all the countries in North America, then match (LEFT JOIN)  the “percentage” of the population that speaks English.
SELECT DISTINCT a.`name` AS country, b.`language`, b.Percentage
FROM world.country AS a  
LEFT JOIN  world.countrylanguage AS b ON a.`code` = b.countrycode AND b.`language` = 'English' /* AND b.Percentage >= 20.0 */
WHERE a.continent = 'North America'
order by b.percentage desc;

-- 4.  In the “world” schema, obtain the name of all cities in North America that have a population over 1M, WHERE the primary language is English or Spanish (with repeats). 
SELECT a.continent, a.`name` AS Country, b.`Language` AS official_language, c.`name` AS City, c.population
FROM world.country AS a 
INNER JOIN world.countrylanguage AS b ON a.`code` = b.countrycode AND b.`language` = 'English' AND b.isofficial = 'T' 
INNER JOIN world.city AS c ON a.`code` = c.countrycode AND c.population > 1000000
WHERE a.continent = 'North America'

UNION ALL

SELECT a.continent, a.`name` AS country, b.`Language`as official_language,  c.`name` AS city, c.population
FROM world.country AS a 
INNER JOIN world.countrylanguage AS b ON a.`code` = b.countrycode AND b.`language` = 'Spanish' AND b.isofficial = 'T' 
INNER JOIN world.city AS c ON a.`code` = c.countrycode AND c.population > 1000000
WHERE a.continent = 'North America'
;








