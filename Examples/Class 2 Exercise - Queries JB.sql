-- 1. In world.city, What are the Cities & CountryCodes of all locations in the database (sorted alphabetically by code)? 
SELECT `Name` AS city, CountryCode
FROM world.city
ORDER BY CountryCode DESC, City ASC;

-- 2. Return the names of all cities contained in the world.city table that are in the united states.
SELECT `Name`, district
FROM world.city
Where CountryCode = 'USA'
ORDER BY District;

-- 3. Find the total population of all USA cities that are in the world.city table
SELECT SUM(population) AS USA_Population
FROM world.city
WHERE CountryCode = 'USA';

-- 4. Return the names of all cities contained in the world.city table that are in Nebraska (Region), using a subquery
SELECT subquery.city
FROM (select `name` as city from world.city where District = 'Nebraska' and CountryCode = 'USA') as subquery;

-- 5. In the world.country langage table, select all CountryCodes where the official language is ‘English’
SELECT CountryCode AS country_code, percentage
FROM world.countrylanguage
where `Language` = 'English'
and IsOfficial = 'T'
ORDER BY percentage DESC;

-- 6. In the world.country table, compare the average life expectancy of people, in a variety of ways. 
SELECT `code` AS country_code, `name` AS country, LifeExpectancy AS life_expectancy, GNP, Population, 
GNP/Population AS gnp_per_capita
FROM world.country
WHERE Continent = 'Europe'
ORDER BY gnp_per_capita DESC;