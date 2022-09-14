USE sakila;
-- Select all the actors with the first name ‘Scarlett’.
select * FROM sakila.actor WHERE first_name = 'Scarlett';

-- How many films (movies) are available for rent and how many films have been rented?
select  * from sakila.inventory;
select count(distinct inventory_id) from sakila.rental;
select count(distinct rental_id) from sakila.rental;

-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select min(length) as 'min_duration' , MAX(length) as 'max_duration' from sakila.film;

-- What's the average movie duration expressed in format (hours, minutes)?
select  * from sakila.film;
SELECT SEC_TO_TIME(ROUND(AVG(length)*60,0)) from sakila.film;

-- How many distinct (different) actors' last names are there?
select distinct last_name from sakila.actor;

-- Since how many days has the company been operating (check DATEDIFF() function)?
Select  datediff(max(payment_date), min(payment_date)) as Difference
  From sakila.payment;
select * from sakila.payment;  

SELECT MIN(payment_date) as oldest_date
FROM sakila.payment;

SELECT max(payment_date) as newest_date
FROM sakila.payment;

-- Show rental info with additional columns month and weekday. Get 20 results.
select  * from sakila.rental;
select *, substr(rental_date,6,2) as rental_month, substr(rental_date,9,2) as rental_day from sakila.rental;
SELECT *,DAYOFMONTH(substr(rental_date,1,10)) AS month, DAYOFWEEK(substr(rental_date,1,10)) AS weekday FROM rental;

SELECT *, substr(rental_date,6,2) AS month, DAYOFWEEK(rental_date) AS weekday FROM rental
LIMIT 20;


-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *, CASE
WHEN DAYOFWEEK(rental_date) in (1,2,3,4,5) then 'weekday'
WHEN DAYOFWEEK(rental_date) in (6,7) then 'weekend'
END AS day_type FROM rental;


-- Get release years
select release_year from sakila.film;

-- Get all films with ARMAGEDDON in the title.
select * from sakila.film;
select * from sakila.film where title like '%ARMAGEDDON%';

-- Get all films which title ends with APOLLO.
select * from sakila.film;
select * from sakila.film where title like '%APOLLO';

-- Get 10 the longest films.
select * from sakila.film;
SELECT *
FROM sakila.film
ORDER BY length DESC
LIMIT 10;

-- How many films include Behind the Scenes content?
select * from sakila.film;
select * FROM sakila.film where special_features like '%Behind the Scenes%';
select COUNT FROM sakila.film where special_features like '%Behind the Scenes%';
SELECT COUNT(special_features) from sakila.film where special_features like '%Behind the Scenes%';
