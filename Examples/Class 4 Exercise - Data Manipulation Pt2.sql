-- 1. Using a union on the world.country table, combine all countries (repeating) with a life expectancy of > 80 years or a GNP > 1000000, with no repeats.   
select a.`Name` as Country
from world.country as a
where LifeExpectancy > 80

union 

select a.`Name` as Country
from world.country as a  
where GNP > 1000000;

-- 2.  List all official languages spoken in the 'Southeast Asia' region
select distinct b.`language`
from world.country as a  
inner join  world.countrylanguage as b on a.`code` = b.countrycode and b.isofficial = 'T'
where a.region = 'Southeast Asia';

-- 3.  List all the countries in North America, then match (left join)  the “percentage” of the population that speaks English.
select distinct a.`name` as country, b.`language`, b.Percentage
from world.country as a  
Left join  world.countrylanguage as b on a.`code` = b.countrycode and b.`language` = 'English' /* and b.Percentage >= 20.0 */
where a.Continent = 'North America'
order by b.Percentage desc;

-- 4.  In the “world” schema, obtain the name of all cities in North America that have a population over 1M, where the primary language is English or Spanish (with repeats). 
select a.continent, a.`name` as Country, b.`Language` as Official_Language, c.`name` as City, c.population
from world.country as a 
inner join world.countrylanguage as b on a.`code` = b.countrycode and b.`language` = 'English' and b.isofficial = 'T' 
inner join world.city as c on a.`code` = c.countrycode and c.population > 1000000
where a.Continent = 'North America'

union all 

select a.continent, a.`name` as Country, b.`Language`as Official_Language,  c.`name` as City, c.population
from world.country as a 
inner join world.countrylanguage as b on a.`code` = b.countrycode and b.`language` = 'Spanish' and b.isofficial = 'T' 
inner join world.city as c on a.`code` = c.countrycode and c.population > 1000000
where a.Continent = 'North America'
;








