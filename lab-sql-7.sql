-- Lab | SQL Queries 7: In this lab, you will be using the Sakila database of movie rentals. 
-- You have been using this database for a couple labs already, but if you need to get the data again, refer to the official installation link.

-- The database is structured as follows: DB schema

-- Instructions:

-- 1. In the table actor, which are the actors whose last names are not repeated? 
-- For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
-- These three actors have the same last name. So we do not want to include this last name in our output. 
-- Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.

USE sakila;
SELECT * FROM sakila.actor;

SELECT last_name AS 'last names not repeated'
FROM sakila.actor 
GROUP BY last_name 
HAVING count(last_name) = 1;

-- 2. Which last names appear more than once? 
-- We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once.

SELECT last_name AS 'last names repeated' 
FROM sakila.actor 
GROUP BY last_name
HAVING count(last_name) > 1;

-- 3. Using the rental table, find out how many rentals were processed by each employee.

SELECT staff_id, count(customer_id) FROM sakila.rental GROUP BY staff_id; 				-- staff_id 1 = 8041, staff_id 2 = 8004.

-- 4. Using the film table, find out how many films were released each year.

SELECT release_year, count(release_year) FROM sakila.film GROUP BY release_year;		-- 1000 films were released in 2006.

-- 5. Using the film table, find out for each rating how many films were there.

SELECT rating, count(rating) FROM sakila.film GROUP BY rating;							-- PG = 194, G = 178, NC-17 = 210, PG-13 = 223, R = 195.

-- 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places

SELECT rating, round(AVG(length), 2) FROM sakila.film GROUP BY rating;					-- PG = 112.01, G = 111.05, NC-17 = 113.23, PG-13 = 120.44, R = 118.66.

-- 7. Which kind of movies (rating) have a mean duration of more than two hours?	

SELECT rating, round(AVG(length), 2) FROM sakila.film GROUP BY rating HAVING round(AVG(length),2) > 120;	-- PG-13 = 120.44 minutes.
