-- 1
SELECT name, continent, population 
  FROM world

-- 2
SELECT name 
  FROM world
 WHERE population = 64105700

-- 3
SELECT name, GDP/population AS per_capita_GDP
  FROM world
 WHERE population >= 200000000

-- 4
SELECT name, population/1000000 AS population_in_millions
  FROM world
 WHERE continent = 'South America'

-- 5
SELECT name, population
  FROM world
 WHERE name IN ('France', 'Germany', 'Italy')

-- 6
SELECT name
  FROM world
 WHERE name LIKE '%United%'

-- 7
SELECT name, population, area
  FROM world
 WHERE area > 3000000 OR population > 250000000

-- 8
SELECT name, population, area
  FROM world
 WHERE (area > 3000000 AND population < 250000000) OR
       (area < 3000000 AND population > 250000000)
-- 9
SELECT name, ROUND(population/1000000, 2) AS pop_in_millions,
       ROUND(GDP/1000000000, 2) AS gdp_in_billions
  FROM world
 WHERE continent = 'South America'

-- 10
SELECT name, ROUND(GDP/population, -3) AS per_capita_gdp
  FROM world
 WHERE GDP >= 1000000000000

-- 11
SELECT name, capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital)

-- 12
SELECT name, capital
  FROM world
 WHERE LEFT(name, 1) = LEFT(capital, 1) AND
       name <> capital

-- 13
SELECT name
  FROM world
 WHERE LOWER(name) LIKE '%a%' AND
       LOWER(name) LIKE '%e%' AND
       LOWER(name) LIKE '%i%' AND
       LOWER(name) LIKE '%o%' AND
       LOWER(name) LIKE '%u%' AND
       LOWER(name) NOT LIKE '%a%a%' AND
       LOWER(name) NOT LIKE '%e%e%' AND
       LOWER(name) NOT LIKE '%i%i%' AND
       LOWER(name) NOT LIKE '%o%o%' AND
       LOWER(name) NOT LIKE '%u%u%' AND
       LOWER(name) NOT LIKE '% %' 

