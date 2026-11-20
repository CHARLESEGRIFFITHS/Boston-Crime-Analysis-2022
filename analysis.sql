-- analysis.sql — questions about Boston crime incidents, 2022.
-- Each query is written under the question it answers, in plain words.
-- Table: incidents (73,852 rows, loaded from data/boston-crime-incidents-2022.csv)

-- 1. First look — what does a row look like?
SELECT * FROM incidents LIMIT 10;

-- 2. How many incidents are there in total?
SELECT COUNT(*) FROM incidents;

-- 3. What were the most common offenses?
SELECT offense_description, COUNT(*) AS n
FROM incidents
GROUP BY offense_description
ORDER BY n DESC
LIMIT 10;

-- 4. How many INVESTIGATE PERSON incidents were there on each day of the week?
SELECT day_of_week, COUNT(*) AS n
FROM incidents
WHERE offense_description = 'INVESTIGATE PERSON'
GROUP BY day_of_week;

-- 5. Which offense types had more than 1,500 incidents?
SELECT offense_description, COUNT(*) AS n
FROM incidents
GROUP BY offense_description
HAVING n > 1500
ORDER BY n DESC;

-- 6. Which offense types had fewer than 500 incidents?
SELECT offense_description, COUNT(*) AS n
FROM incidents
GROUP BY offense_description
HAVING n < 500
ORDER BY n DESC;

-- 7. Which streets had the most incidents?
SELECT street, COUNT(*) AS n
FROM incidents
GROUP BY street
ORDER BY n DESC
LIMIT 10;

-- 8. Which district had the most incidents?
SELECT district, COUNT(*) AS n
FROM incidents
GROUP BY district
ORDER BY n DESC;

-- 9. How many incidents happened in each hour of the day?
SELECT hour, COUNT(*) AS n
FROM incidents
GROUP BY hour
ORDER BY hour;

-- 10. What were the most common offenses at midnight (hour 0)?
SELECT offense_description, COUNT(*) AS n
FROM incidents
WHERE hour = 0
GROUP BY offense_description
ORDER BY n DESC
LIMIT 5;

--10. How many incidents involved a shooting — and how many did not?
SELECT 
  CASE WHEN shooting = 0 THEN 0 ELSE 1 END AS is_shooting,
  COUNT(*) 
FROM incidents
GROUP BY is_shooting;

--11. What is the busiest and least busy day?
WITH busiest_day AS (
  SELECT day_of_week, COUNT(*) AS busiest_day
  FROM incidents
  GROUP BY day_of_week
  Order BY COUNT(*) DESC
)
SELECT *
FROM busiest_day;
