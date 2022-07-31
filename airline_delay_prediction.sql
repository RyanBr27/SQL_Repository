/* Airline Delays, Prediction Analysis by Ryan Breeden */

--The purpose of this project is to predict whether a given flight will be delayed.

--Identifying the total number of flight delays per day of the week for AA - American Airlines.
SELECT day_of_week, COUNT(delay) AS total_delays
FROM airlinedelay
WHERE delay = 1
GROUP BY day_of_week;

--Ordering the days of the week from greatest to least number of flight delays.
SELECT day_of_week, COUNT(delay = 1) AS total_flight_delays
FROM airlinedelay
GROUP BY day_of_week
ORDER BY total_flight_delays DESC;

--Determining top 10 airports with arriving flight delays.
SELECT airport_to, COUNT(delay) AS total_delays
FROM airlinedelay
WHERE delay = 1
GROUP BY airport_to
ORDER BY total_delays DESC LIMIT 10;

--Determining top 10 airports with departing flights that have experienced a delay.
SELECT airport_from, COUNT(delay) AS total_delays
FROM airlinedelay
WHERE delay = 1
GROUP BY airport_from
ORDER BY total_delays DESC LIMIT 10;

--Checking whether the length of flight has any effect on the delay.
SELECT DISTINCT length, COUNT(delay = 1) AS total_delays
FROM airlinedelay
GROUP BY length;