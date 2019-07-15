-- 1. In world.city, What are the Names & CountryCodes of all locations in the database (sorted alphabetically by code)? 
SELECT `Name`, CountryCode
FROM world.city
order by CountryCode;

-- 2. Return the names of all cities contained in the world.city table that are in the united states.
SELECT `Name`, District
FROM world.city
Where CountryCode = 'USA';

-- 3. Find the total population of all USA cities that are in the world.city table
SELECT sum(population) as USA_Population
FROM world.city
Where CountryCode = 'USA';

-- 4. Return the names of all cities contained in the world.city table that are in Nebraska (Region), using a subquery
SELECT subquery.city
FROM (select name as city from world.city where District = 'Nebraska' and CountryCode = 'USA') as subquery;

-- 5. In the world.country langage table, select all CountryCodes where the official language is ‘English’
SELECT CountryCode 
FROM world.countrylanguage
where Language = 'English'
and IsOfficial = 'T';

-- 6. In the world.country table, compare the average life expectancy of people, in a variety of ways. 
SELECT CountryCode 
FROM world.countrylanguage
where Language = 'English'
and IsOfficial = 'T';