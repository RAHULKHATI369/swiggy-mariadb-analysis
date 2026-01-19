-- Restaurants master table

CREATE TABLE IF NOT EXISTS restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(150),
    city VARCHAR(50),
    rating DECIMAL(2,1),
    rating_count INT,
    cuisine VARCHAR(100),
    cost INT
);
