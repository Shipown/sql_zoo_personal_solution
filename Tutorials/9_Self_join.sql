-- 1
SELECT COUNT(*) AS num_of_stops
  FROM stops;

-- 2
SELECT id
  FROM stops
 WHERE name = 'Craiglockhart';

-- 3
SELECT id, name
  FROM stops LEFT OUTER JOIN route
               ON (stops.id = route.stop)
 WHERE num = 4
   AND company = 'LRT';

-- 4
SELECT company, num, COUNT(*)
  FROM route
 WHERE stop = 149
    OR stop = 53
 GROUP BY company, num
HAVING COUNT(stop) = 2;

-- 5
SELECT X.company, X.num, X.stop, Y.stop
  FROM route X LEFT OUTER JOIN route Y
                 ON (X.company = Y.company AND X.num = Y.num)
 WHERE X.stop = 53
   AND Y.stop = 149;

-- 6
SELECT X.company, X.num, SX.name, SY.name
  FROM route X LEFT OUTER JOIN route Y
                 ON (X.company = Y.company AND X.num = Y.num)
               LEFT OUTER JOIN stops SX
                 ON (X.stop = SX.id)
               LEFT OUTER JOIN stops SY
                 ON (Y.stop = SY.id)
 WHERE SX.name = 'Craiglockhart'
   AND SY.name = 'London Road';

-- 7
SELECT DISTINCT X.company, X.num
  FROM route X LEFT OUTER JOIN route Y
                 ON (X.company = Y.company AND X.num = Y.num)
 WHERE X.stop = 115
   AND Y.stop = 137;

-- 8
SELECT DISTINCT X.company, X.num
  FROM route X LEFT OUTER JOIN route Y
                 ON (X.company = Y.company AND X.num = Y.num)
               LEFT OUTER JOIN stops SX
                 ON (X.stop = SX.id)
               LEFT OUTER JOIN stops SY
                 ON (Y.stop = SY.id)
 WHERE SX.name = 'Craiglockhart'
   AND SY.name = 'Tollcross';

-- 9
SELECT DISTINCT SY.name, X.company, Y.num
  FROM route X LEFT OUTER JOIN route Y
                 ON (X.company = Y.company AND X.num = Y.num)
               LEFT OUTER JOIN stops SX
                 ON (X.stop = SX.id)
               LEFT OUTER JOIN stops SY
                 ON (Y.stop = SY.id)
 WHERE SX.name = 'Craiglockhart'
   AND X.company = 'LRT';

-- 10
SELECT A.num, A.company, A.name, B.num, B.company
  FROM
    (SELECT X.num, SY.name, X.company
       FROM route X LEFT OUTER JOIN route Y
                     ON (X.company = Y.company AND X.num = Y.num)
                   LEFT OUTER JOIN stops SX
                     ON (X.stop = SX.id)
                   LEFT OUTER JOIN stops SY
                     ON (Y.stop = SY.id)
     WHERE SX.name = 'Craiglockhart'
    ) A
    INNER JOIN
    (SELECT Y.num, SX.name, Y.company
       FROM route X LEFT OUTER JOIN route Y
                      ON (X.company = Y.company AND X.num = Y.num)
                    LEFT OUTER JOIN stops SX
                      ON (X.stop = SX.id)
                    LEFT OUTER JOIN stops SY
                      ON (Y.stop = SY.id)
      WHERE SY.name = 'Lochend'
    ) B
       ON (A.name = B.name);









