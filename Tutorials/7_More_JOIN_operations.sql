-- 1
SELECT id, title
  FROM movie
 WHERE yr = 1962;

--2
SELECT yr
  FROM movie
 WHERE title = 'Citizen Kane';

-- 3
SELECT id, title, yr
  FROM movie
 WHERE title LIKE '%Star Trek%'
 ORDER BY yr;

-- 4
SELECT id
  FROM actor
 WHERE name = 'Glenn Close';

-- 5
SELECT id
  FROM movie
 WHERE title = 'Casablanca';

-- 6
SELECT name
  FROM (
    movie LEFT OUTER JOIN casting
    ON movie.id = casting.movieid
    LEFT OUTER JOIN actor
    ON casting.actorid = actor.id
  )
 WHERE movie.id = 11768;

-- 7
SELECT name
  FROM (
    movie LEFT OUTER JOIN casting
    ON movie.id = casting.movieid
    LEFT OUTER JOIN actor
    ON casting.actorid = actor.id
  )
 WHERE movie.title = 'Alien';

-- 8
SELECT title
  FROM (
    movie LEFT OUTER JOIN casting
    ON movie.id = casting.movieid
    LEFT OUTER JOIN actor
    ON casting.actorid = actor.id
  )
 WHERE actor.name = 'Harrison Ford';

-- 9
SELECT title
  FROM (
    movie LEFT OUTER JOIN casting
    ON movie.id = casting.movieid
    LEFT OUTER JOIN actor
    ON casting.actorid = actor.id
  )
 WHERE actor.name = 'Harrison Ford'
   AND casting.ord <> 1;

-- 10
SELECT title, name
  FROM (
    movie LEFT OUTER JOIN casting
    ON movie.id = casting.movieid
    LEFT OUTER JOIN actor
    ON casting.actorid = actor.id
  )
 WHERE movie.yr = 1962
   AND casting.ord = 1;

-- 11
-- The year in which John Travolta made more than 2 movies
SELECT yr, COUNT(title) AS num_of_mv
  FROM (
    movie LEFT OUTER JOIN casting
    ON movie.id = casting.movieid
    LEFT OUTER JOIN actor
    ON casting.actorid = actor.id
  )
 WHERE actor.name = 'John Travolta'
 GROUP BY yr
HAVING COUNT(movie.title) > 2;

-- The busiest year for John Travolta
SELECT yr, COUNT(title) AS num_of_mv
  FROM (
    movie LEFT OUTER JOIN casting
    ON movie.id = casting.movieid
    LEFT OUTER JOIN actor
    ON casting.actorid = actor.id
  )
 WHERE actor.name = 'John Travolta'
 GROUP BY yr
HAVING COUNT(movie.title) = (
    SELECT MAX(num_of_mv)
      FROM (
        SELECT yr, COUNT(movie.title) AS num_of_mv
          FROM (
            movie LEFT OUTER JOIN casting
            ON movie.id = casting.movieid
            LEFT OUTER JOIN actor
            ON casting.actorid = actor.id
          )
         WHERE actor.name = 'John Travolta'
         GROUP BY yr
      ) AS X
);

-- 12
SELECT title, name
  FROM (
    movie LEFT OUTER JOIN casting
    ON movie.id = casting.movieid
    LEFT OUTER JOIN actor
    ON casting.actorid = actor.id
  )
 WHERE movie.id IN (
    SELECT movieid FROM casting
     WHERE actorid IN (
         SELECT id FROM actor
          WHERE name='Julie Andrews'
    )
 )
  AND casting.ord = 1;

-- 13
SELECT name
  FROM (
    movie LEFT OUTER JOIN casting
    ON movie.id = casting.movieid
    LEFT OUTER JOIN actor
    ON casting.actorid = actor.id
  )
 WHERE casting.ord = 1
 GROUP BY name
HAVING COUNT(title) >= 30
 ORDER BY name;

-- 14
SELECT title, COUNT(*) AS num_of_actor
  FROM (
    movie LEFT OUTER JOIN casting
    ON movie.id = casting.movieid
  )
 WHERE yr = 1978
 GROUP BY title
 ORDER BY num_of_actor DESC, title;

-- 15
SELECT name
  FROM (
    movie LEFT OUTER JOIN casting
    ON movie.id = casting.movieid
    LEFT OUTER JOIN actor
    ON casting.actorid = actor.id
  )
 WHERE movieid IN (
     SELECT movieid FROM casting
      WHERE actorid IN (
         SELECT id FROM actor
          WHERE name = 'Art Garfunkel'
      )
 )
  AND name <> 'Art Garfunkel';
