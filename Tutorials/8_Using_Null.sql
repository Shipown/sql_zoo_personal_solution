-- 1
SELECT name
  FROM teacher
 WHERE dept IS NULL;

-- 2
SELECT teache.name, dept.name
  FROM teacher
 INNER JOIN dept
    ON (teacher.dept = dept.id);

-- 3
SELECT teacher.name, dept.name
  FROM teacher
  LEFT OUTER JOIN dept
    ON (teacher.dept = dept.id);

-- 4
SELECT teacher.name, dept.name
  FROM dept
  LEFT OUTER JOIN teacher
    ON (dept.id = teacher.dept);

-- 5
SELECT name, COALESCE(mobile, '07986 444 2266') AS mobile
  FROM teacher;

-- 6
SELECT teacher.name, COALESCE(dept.name, 'None') AS dept
  FROM teacher
  LEFT OUTER JOIN dept
    ON (teacher.dept = dept.id);

-- 7
SELECT COUNT(name) AS num_of_teachers, COUNT(mobile) AS num_of_mobiles
  FROM teacher;

-- 8
SELECT dept.name, COUNT(teacher.name) AS num_of_teachers
  FROM teacher RIGHT OUTER JOIN dept
    ON (teacher.dept = dept.id)
 GROUP BY dept.name;

-- 9
SELECT name, (CASE WHEN dept IN (1, 2) THEN 'Sci'
                   ELSE 'Art' END) AS alias
  FROM teacher;

-- 10
SELECT name, (CASE WHEN dept IN (1, 2) THEN 'Sci'
                   WHEN dept = 3 THEN 'Art'
                   ELSE 'None' END)
  FROM teacher;
