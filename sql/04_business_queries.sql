-- =====================================================
-- Swiggy Restaurant Business Analysis
-- Database: swiggy_analysis
-- Author: Rahul Khati
-- =====================================================

USE swiggy_analysis;

-- 1. Overall dataset coverage
SELECT
    COUNT(id) AS total_restaurants,
    COUNT(DISTINCT city) AS total_cities
FROM restaurants;

-- 2. Top 3 cities by restaurant count
SELECT
    city,
    COUNT(id) AS restaurant_count
FROM restaurants
GROUP BY city
ORDER BY restaurant_count DESC
LIMIT 3;

-- 3. Average cost comparison (metro cities)
SELECT
    city,
    ROUND(AVG(cost), 0) AS avg_cost
FROM restaurants
WHERE city IN ('Bangalore', 'Delhi', 'Mumbai')
GROUP BY city
ORDER BY avg_cost DESC;

-- 4. Most popular cuisines by customer engagement
SELECT
    cuisine,
    SUM(rating_count) AS total_votes
FROM restaurants
GROUP BY cuisine
ORDER BY total_votes DESC
LIMIT 3;

-- 5. Average rating comparison across cuisines
SELECT
    cuisine,
    ROUND(AVG(rating), 2) AS avg_rating
FROM restaurants
WHERE cuisine IN ('North Indian', 'Chinese', 'Biryani')
GROUP BY cuisine
ORDER BY avg_rating DESC;

-- 6. Biryani demand–supply gap analysis
SELECT
    city,
    COUNT(id) AS supply,
    SUM(rating_count) AS demand
FROM restaurants
WHERE TRIM(LOWER(cuisine)) = 'biryani'
GROUP BY city
HAVING supply < 50
   AND demand > 5000
ORDER BY demand DESC
LIMIT 3;

