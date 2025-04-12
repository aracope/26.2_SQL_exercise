-- SQL Basics: Simple WHERE and ORDER BY
-- For this challenge you need to create a simple SELECT statement that will return all columns from the people table WHERE their age is over 50
-- people table schema
-- id
-- name
-- age
-- You should return all people fields where their age is over 50 and order by the age descending
SELECT *
FROM people
WHERE age > 50
ORDER BY age DESC

-- SQL Basics: Simple SUMSQL Basics: Simple SUM
-- Description:
-- For this challenge you need to create a simple SUM statement that will sum all the ages.
-- people table schema
-- id
-- name
-- age
-- select table schema
-- age_sum (sum of ages)
-- NOTE2: You need to use ALIAS for creating age_sum
SELECT SUM(age) as age_sum
FROM people;

-- SQL Basics: Simple MIN / MAX
-- For this challenge you need to create a simple MIN / MAX statement that will return the Minimum and Maximum ages out of all the people.
-- people table schema
-- id
-- name
-- age
-- select table schema
-- age_min (minimum of ages)
-- age_max (maximum of ages)
SELECT 
  MIN(age) AS age_min,
  MAX(age) AS age_max
FROM people;

-- Find all active students
-- Create a simple SELECT query to display student information of all ACTIVE students.
-- TABLE STRUCTURE:
-- students
-- Id (integer)	FirstName (text)	LastName (text)	IsActive (boolean)
-- Note:
-- IsActive (true = 1 or false = 0)
SELECT *
FROM students
WHERE IsActive = 1;

-- SQL Basics: Simple GROUP BY
-- For this challenge you need to create a simple GROUP BY statement, you want to group all the people by their age and count the people who have the same age.
-- people table schema
-- id
-- name
-- age
-- select table schema
-- age [group by]
-- people_count (people count)
SELECT 
  age, 
  COUNT(*) AS people_count
FROM people
GROUP BY age;

-- SQL Basics: Simple HAVING
-- For this challenge you need to create a simple HAVING statement, you want to count how many people have the same age and return the groups with 10 or more people who have that age.
-- people table schema
-- id
-- name
-- age
-- return table schema
-- age
-- total_people
SELECT 
  age, 
  COUNT(*) AS total_people
FROM people
GROUP BY age
HAVING COUNT(*) >= 10;