-- Load CSV data into restaurants table

LOAD DATA LOCAL INFILE '/home/rahulkhati/swiggy-mariadb-analysis/data/restaurants.csv'
INTO TABLE restaurants
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, name, city, rating, rating_count, cuisine, cost);
