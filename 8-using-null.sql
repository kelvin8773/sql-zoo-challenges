-- #1
SELECT name
FROM teacher
WHERE dept IS NULL

-- #2
SELECT teacher.name, dept.name
FROM teacher INNER JOIN dept
  ON (teacher.dept=dept.id)

-- #3
SELECT teacher.name, dept.name
FROM teacher LEFT JOIN dept
  ON (teacher.dept=dept.id)

-- #4
SELECT teacher.name, dept.name
FROM teacher RIGHT JOIN dept
  ON (teacher.dept=dept.id)

-- #5
SELECT name, COALESCE(mobile, '07986 444 2266') as mobile
FROM teacher


-- #6
SELECT t.name, COALESCE(d.name, 'None')
FROM teacher t LEFT JOIN dept d
  ON t.dept = d.id

-- #7
SELECT COUNT(name), COUNT(mobile)
FROM teacher

-- #8
SELECT d.name, COUNT(t.name)
FROM teacher t RIGHT JOIN dept d ON t.dept = d.id
GROUP BY d.name

-- #9
SELECT
  name,
  CASE 
    WHEN dept = 1 or dept =2 THEN 'Sci'
    ELSE 'Art'
  END
FROM teacher


-- #10
SELECT
  name,
  CASE 
    WHEN dept = 1 or dept =2 THEN 'Sci'
    WHEN dept = 3 THEN 'Art'
    ELSE 'None'
  END
FROM teacher

