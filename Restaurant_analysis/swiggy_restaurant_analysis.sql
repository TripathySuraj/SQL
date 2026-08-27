CREATE DATABASE swiggy;

use swiggy;
show tables;
select count(*) from restaurants;
select * from restaurants order by id limit 5;

## SQL Practice Questions – Restaurant Dataset

-- 1. Select all columns from the restaurant table.
SELECT * FROM restaurants;

-- 2. Display the names and cities of all restaurants.
SELECT name,city FROM restaurants;

-- 3. -- Find all restaurants located in Bangalore.
SELECT * FROM restaurants WHERE city LIKE 'Bangalore';

-- 4. List the names and ratings of restaurants with a rating greater than 4.0.
SELECT name,rating FROM restaurants WHERE rating>4.0;

-- 5. Find restaurants where the cost is less than or equal to 300.
SELECT * FROM restaurants WHERE cost<=300;

-- 6. Display all distinct cuisine types available in the dataset.
SELECT DISTINCT cuisine FROM restaurants;

-- 7. Find all restaurants serving Biryani cuisine.
SELECT * FROM restaurants WHERE cuisine='Biryani';

-- 8. Show the top 5 restaurants with the highest ratings.
SELECT name,rating FROM restaurants ORDER BY rating DESC LIMIT 5;

-- 9. List restaurants with a rating count greater than 1000.
SELECT name,rating_count FROM restaurants WHERE rating_count>1000;

-- 10. Count the total number of restaurants in the dataset.
SELECT COUNT(*) AS Total_no_of_restaurants FROM restaurants;

-- 11. Find the average cost of all restaurants.
SELECT ROUND(AVG(cost),2) AS Average_cost FROM restaurants;

-- 12. Display restaurant names and costs ordered by cost in ascending order.
SELECT name,cost FROM restaurants ORDER BY cost ASC;

-- 13. Find the average rating of restaurants for each city.
SELECT city,AVG(rating) AS Average_Rating FROM restaurants GROUP BY city;

-- 14. Count the number of restaurants available in each city.
SELECT city,COUNT(*) AS Total_no_of_restaurants FROM restaurants GROUP BY city;

-- 15. Find the maximum and minimum cost of restaurants for each cuisine.
SELECT cuisine, MAX(cost) AS Max_Cost, MIN(cost) AS Min_Cost FROM restaurants GROUP BY cuisine;

-- 16. List cuisines that have more than 10 restaurants.
SELECT cuisine, count(*) AS No_of_restaurants FROM restaurants GROUP BY cuisine HAVING count(*)>10;

-- 17. Find the top 3 cities with the highest number of restaurants.
SELECT city, COUNT(*) AS No_of_restaurants FROM restaurants 
GROUP BY city 
ORDER BY COUNT(*) DESC LIMIT 3;

-- 18. Display the average cost of restaurants for each cuisine.
SELECT cuisine, AVG(cost) AS Average_Cost FROM restaurants GROUP BY cuisine;

-- 19. Find cities where the average restaurant rating is greater than 4.0.
SELECT city, AVG(rating) AS Average_rating FROM restaurants
GROUP BY city HAVING Average_rating>4.0;

-- 20. List restaurants whose cost is higher than the average cost of all restaurants.
SELECT * FROM restaurants WHERE cost>(SELECT AVG(cost) FROM restaurants);

-- 21. Find the total number of ratings (rating_count) for each city.
SELECT city, SUM(rating_count) AS Total_no_of_ratings FROM restaurants GROUP BY city;


-- 22. Display cuisines ordered by their average rating in descending order.
SELECT cuisine, AVG(rating) AS Average_rating FROM restaurants 
GROUP BY cuisine ORDER BY Average_rating DESC;

-- 23. Find restaurants that have the highest rating within their city.
-- SELECT name,city,rating FROM restaurants r where rating=(
-- SELECT MAX(rating) FROM restaurants where city=r.city); ---> give timeout error due to large dataset
-- Corrected code :-
SELECT DISTINCT r.name , r.city, r.rating
FROM restaurants r
JOIN (
    SELECT city, MAX(rating) AS max_rating
    FROM restaurants
    GROUP BY city
) m 
ON r.city = m.city AND r.rating = m.max_rating;

-- 24. List cities that have more than one cuisine type available.
SELECT city, COUNT(DISTINCT cuisine) AS No_of_cuisines FROM restaurants GROUP BY city
HAVING No_of_cuisines>1;

-- 25. Find the restaurant(s) with the maximum rating_count in the dataset.
SELECT * FROM restaurants where rating_count=(SELECT MAX(rating_count) FROM restaurants);

-- 26. How many total cities in dataset.
SELECT count(DISTINCT city) AS 'Total_unique_city' FROM restaurants;

-- 27. Restaurants in Banglore, Mumbai, Delhi, Goa
SELECT name,city FROM restaurants WHERE city IN ('Banglore','Mumbai','Delhi','Goa'); 