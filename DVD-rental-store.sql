/* DVD Rental Store by Ryan Breeden */

--Fetching the full name of all inactive customers.
SELECT first_name, last_name, active FROM customer WHERE active = 0;

--Changing the column name actor_id to identity_num.
SELECT actor_id AS identity_num, first_name, last_name FROM actor;

--Fetching all the unique first and last names to find out how mane actors share the same name.
SELECT DISTINCT first_name, last_name FROM actor;

--Create new column called new_rental_rate; increasing the rental rate of each film by 10 percent of each current price.
SELECT title, rental_rate, rental_rate * 1.10 AS "new_rental_rate" FROM film;

--Selecting all payments made before 02/15/2007 and amounts greater than equal to 5.99.
SELECT * FROM payment WHERE payment_date < '2007-02-15' AND amount >= 5.99;

--Selecting all payments made before 02/15/2007 or greater than equal to 5.99 in amount.
SELECT * FROM payment WHERE payment_date < '2007-02-15' OR amount >= 5.99;

--Fecthing the country_id of three countries using the IN Operator.
SELECT * FROM country WHERE country IN ('United States', 'Spain', 'Romania');

--Fecthing the country_id of all countries other than Romania, Spain, and United States.
SELECT * FROM country WHERE country NOT IN ('United States', 'Spain', 'Romania');

--Fetching all film results with rental rates between 0.99 and 2.99.
SELECT * FROM film WHERE rental_rate BETWEEN 0.99 AND 2.99;

--Finding all films with descriptions with contain DENTIST.
SELECT * FROM film WHERE description LIKE '%Dentist%';

--IS NULL Operator
SELECT * FROM address WHERE phone ISNULL;

SELECT * FROM payment;

--The Limit Clause
SELECT * FROM actor LIMIT 25;

--Inner Join
SELECT *
FROM customer c
JOIN rental r
	ON c.customer_id = r.customer_id;

--(Inner JOIN): Joining the customer and address tables by address ID. Identiftying customers by first, last names to their associated street address.
SELECT 
	c.first_name,
	c.last_name,
	a.address
FROM customer c
JOIN address a
	ON c.address_id = a.address_id;

--Finding the total number of actors that do not share a first or last name; 200 actors total.
SELECT COUNT(DISTINCT first_name || last_name)
FROM actor;

--Display the top 5 customers with the highest total payments amounts.
SELECT customer_id, first_name, last_name, SUM(amount) AS total_purchases
FROM payment p
JOIN customer c
USING (customer_id)
GROUP BY customer_id
ORDER BY total_purchases DESC LIMIT 5;

--What are the top 5 most rented movies.
SELECT DISTINCT film_id, title AS movie_name, COUNT(film_id) AS total_rented
FROM film
JOIN inventory
USING (film_id)
JOIN rental
USING (inventory_id)
GROUP BY film_id
ORDER BY total_rented DESC LIMIT 5;