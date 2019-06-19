-- #1
SELECT COUNT(id)
FROM stops

-- #2
SELECT id
FROM stops
WHERE name = 'Craiglockhart'

-- #3
SELECT id, name
FROM stops JOIN route ON stops.id = route.stop
WHERE num = '4' AND company = 'LRT'

-- #4
SELECT company, num, COUNT(*)
FROM route
WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2

-- #5
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = 149

-- #6
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road'


-- #7
SELECT DISTINCT company, num
FROM route
WHERE num IN (SELECT a.num
  FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  WHERE a.stop=115 AND b.stop = 137)
  AND company IN (SELECT a.company
  FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  WHERE a.stop=115 AND b.stop = 137)

-- #8
SELECT DISTINCT company, num
FROM route
WHERE company IN (SELECT a.company
  FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
    JOIN stops stopa ON (a.stop=stopa.id)
    JOIN stops stopb ON (b.stop=stopb.id)
  WHERE stopa.name='Craiglockhart' AND stopb.name = 'Tollcross'
) AND
  num IN (SELECT a.num
  FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
    JOIN stops stopa ON (a.stop=stopa.id)
    JOIN stops stopb ON (b.stop=stopb.id)
  WHERE stopa.name='Craiglockhart' AND stopb.name = 'Tollcross'
)

-- #9
SELECT name, company, num
FROM route JOIN stops ON stop = id
WHERE company in (SELECT DISTINCT company
  FROM route JOIN stops on stop = id
  WHERE name = 'Craiglockhart'
) AND
  num in (SELECT DISTINCT num
  FROM route JOIN stops on stop = id
  WHERE name = 'Craiglockhart'
)

-- #10
SELECT a.num, a.company, stopb.name, c.num, c.company
FROM
  route a
  JOIN route b ON (a.company = b.company AND a.num = b.num)
  JOIN (route c JOIN route d ON (c.company = d.company AND c.num = d.num))
  JOIN stops stopa ON a.stop = stopa.id
  JOIN stops stopb ON b.stop = stopb.id
  JOIN stops stopc ON c.stop = stopc.id
  JOIN stops stopd ON d.stop = stopd.id 
WHERE stopa.name = 'Craiglockhart'
  AND stopd.name = 'Lochend'
  AND stopb.name = stopc.name
ORDER BY LENGTH(a.num), b.num, stopb.name, LENGTH(c.num), d.num;



