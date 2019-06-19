SELECT name
FROM world
WHERE population >
     (SELECT population
FROM world
WHERE name='Russia')

SELECT name
FROM world
WHERE gdp/population  >
     (SELECT gdp/population as GDP
  FROM world
  WHERE name='United Kingdom' )
  AND continent = 'Europe'

SELECT name, continent
FROM world
WHERE continent IN (SELECT continent
FROM world
WHERE name='Argentina' or name='Australia')
ORDER BY name

SELECT name, population
FROM world
WHERE population > (SELECT population
  FROM world
  WHERE name ='Canada')
  AND population < (SELECT population
  FROM world
  WHERE name ='Poland')

SELECT name, CONCAT(ROUND(population/(SELECT population
  FROM world
  WHERE name='Germany')*100),'%')
FROM world
WHERE continent = 'Europe'

SELECT name
FROM world
WHERE gdp > (SELECT MAX(gdp)
FROM world
WHERE continent = 'Europe')

SELECT continent, name, area
FROM world x
WHERE area >= ALL
    (SELECT area
FROM world y
WHERE y.continent=x.continent
  AND area>0)

--  #8 First Country of each continent
SELECT continent, name
FROM world x
WHERE name <= ALL(SELECT name
FROM world y
WHERE x.continent = y.continent);


-- #9 

SELECT name, continent, population
FROM world
WHERE continent IN (SELECT continent
FROM world  x
WHERE 25000000 >= (SELECT MAX(population)
FROM world y
WHERE x.continent = y.continent));


-- #10
SELECT name, continent
FROM world x
WHERE population/3 > ALL(SELECT population
FROM world y
WHERE y.continent = x.continent and x.name <> y.name)



