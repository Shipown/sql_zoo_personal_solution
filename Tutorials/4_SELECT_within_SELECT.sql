-- 1
SELECT name 
  FROM world
 WHERE population > (
       SELECT population
         FROM world
         WHERE name='Russia'
       );

-- 2
SELECT name
  FROM world
 WHERE GDP/population > (
       SELECT GDP/population
       FROM world
       WHERE name = 'United Kingdom'
       )
   AND continent = 'Europe';

-- 3 
SELECT name, continent
  FROM world
 WHERE continent IN (
       SELECT continent 
       FROM world
       WHERE name IN ('Argentina', 'Australia')
       )
 ORDER BY name;

-- 4
SELECT name, population
FROM world
WHERE population > (
    SELECT population
      FROM world
     WHERE name = 'Canada'
    )
AND population < (
    SELECT population
      FROM world
     WHERE name = 'Poland'
    );

-- 5
SELECT name, CONCAT(ROUND(population/(
                   SELECT population
                     FROM world
                    WHERE name = 'Germany'
                   )*100, 0), '%') AS population_rate
  FROM world
 WHERE continent = 'Europe';

-- 6
SELECT name
  FROM world
 WHERE GDP > ALL(SELECT GDP
                   FROM world
                  WHERE name = 'Europe'
                    AND GDP > 0)
   AND continent <> 'Europe';

-- 7
-- solution 1(the better)
SELECT continent, name, area
  FROM world X
 WHERE area >= ALL(SELECT area
                     FROM world Y
                    WHERE X.continent = Y.continent
                      AND area > 0);
-- solution 2
SELECT continent, name, area
  FROM world
 WHERE area IN (SELECT MAX(area)
                  FROM world
                 GROUP BY continent);

-- 8
-- solution 1(the better)
SELECT continent, name
  FROM world X
 WHERE name <= ALL(SELECT name
                     FROM world Y
                    WHERE X.continent = Y.continent);
-- solution 2
SELECT continent, name
  FROM world
 WHERE name IN (SELECT MIN(name)
                  FROM world
                 GROUP BY continent);

-- 9
SELECT name, continent, population
  FROM world X
 WHERE 25000000 >= ALL(SELECT population
                         FROM world Y
                        WHERE X.continent = Y.continent);

-- 10
SELECT name, continent
  FROM world X
 WHERE population/3 > ALL(SELECT population
                            FROM world Y
                           WHERE X.continent = Y.continent
                             AND population <> (SELECT MAX(population)
                                                  FROM world Z
                                                 WHERE X.continent = Z.continent));

