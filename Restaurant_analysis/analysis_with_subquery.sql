use swiggy;


-- 1. Which restaurant of abohar is visited by least number of people?
SELECT * FROM restaurants
WHERE city='ABOHAR' AND rating_count=(
SELECT MIN(rating_count) 
FROM restaurants WHERE city='ABOHAR');

-- 2. Which restaurant has generated maximum revenue all over india?
SELECT name, (cost*rating_count) AS revenue
FROM restaurants
WHERE (cost*rating_count)=(SELECT MAX(cost*rating_count) FROM restaurants);

-- 3. How many restaurants are having rating more than the average rating?
SELECT * FROM restaurants WHERE rating>(SELECT AVG(rating) FROM restaurants);

-- 4. Which restaurant of Delhi has generated most revenue?
SELECT name, city, (cost*rating_count) AS revenue
FROM restaurants
WHERE city='DELHI' AND (cost*rating_count)=(
SELECT MAX(cost*rating_count) 
FROM restaurants WHERE city='DELHI');

-- 5. Which restaurant chain has maximum number of restaurants?
SELECT name, count(*) AS No_of_restaurants FROM restaurants
GROUP BY name
ORDER BY count(*) DESC 
LIMIT 1;

-- Using CTE
WITH t1 as (
SELECT name, count(*) AS chains
FROM restaurants GROUP BY name
)
SELECT name, chains FROM t1 where chains=(SELECT MAX(chains) FROM t1);

-- 6. Which restaurant chain has generated maximum revenue?
SELECT name, SUM(cost*rating_count) AS Total_Revenue
FROM restaurants
GROUP BY name
ORDER BY SUM(cost*rating_count) DESC LIMIT 1;

-- Using CTE
WITH q1 as (
SELECT name, SUM(cost*rating_count) as revenue
FROM restaurants
GROUP BY name
)
SELECT name, revenue FROM q1 WHERE revenue=(SELECT MAX(revenue) FROM q1);

-- 7. Which city has maximum number of restaurants?
SELECT city, count(*) AS Total_no_restaurants 
FROM restaurants 
GROUP BY city
ORDER BY count(*) DESC LIMIT 1;

-- 8. Which city has generated maximum revenue all over india?
SELECT city, SUM(cost*rating_count) AS Total_Revenue
FROM restaurants
GROUP BY city
ORDER BY SUM(cost*rating_count) DESC LIMIT 1;

-- 9. List 10 least expensive cuisines?
SELECT cuisine, AVG(cost)
FROM restaurants
GROUP BY cuisine
ORDER BY AVG(cost) ASC 
LIMIT 10;

-- 10. List 10 most expensive cuisines?
SELECT cuisine, AVG(cost)
FROM restaurants
GROUP BY cuisine
ORDER BY AVG(cost) DESC 
LIMIT 10;

-- 11. What is the city is having Biryani as most popular cuisine
SELECT city 
FROM restaurants WHERE cuisine='Biryani'
GROUP BY city
ORDER BY SUM(rating_count) DESC LIMIT 1;


-- 12. List top 10 unique restaurants with unique name only throughout the dataset as per generate maximum revenue (Single restaurant with that name)
SELECT name,SUM(cost*rating_count) AS revenue
FROM restaurants
GROUP BY name
HAVING count(name)=1
ORDER BY revenue DESC LIMIT 10;