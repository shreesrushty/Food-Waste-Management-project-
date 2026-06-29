CREATE TABLE claims_data(
Claim_ID int,
Food_ID int,
Receiver_ID int,
Status varchar,
Timestamp_id timestamp
);

CREATE TABLE food_listing_data(
Food_ID int,
Food_Name varchar,
Quantity int,
Expiry_Date date,
rovider_ID int,
Provider_Type varchar,
Location_place varchar,
Food_Type varchar,
Meal_Type varchar
);

CREATE TABLE providers_data(
Provider_ID int,
Name_n varchar,
Type_t varchar,
Address varchar,
City varchar,
Contact varchar
);


CREATE TABLE receiver_data(
Receiver_ID int,
Name_n varchar,
Type_t varchar,
City varchar,
Contact VARCHAR
);

SELECT * FROM providers_data;

SELECT * FROM receiver_data;

SELECT * FROM food_listing_data;

SELECT * FROM claims_data;



SELECT COUNT(*) FROM providers_data;

SELECT COUNT(*) FROM receiver_data;

SELECT COUNT(*) FROM food_listing_data;

SELECT COUNT(*) FROM claims_data;



SELECT *
FROM providers_data
WHERE contact IS NULL;


SELECT *
FROM receiver_data
WHERE contact IS NULL;


SELECT *
FROM food_listing_data
WHERE expiry_date IS NULL
OR quantity IS NULL;

SELECT *
FROM claims_data
WHERE status IS NULL
OR timestamp_id IS NULL;


SELECT COUNT(*) AS total_providers
FROM providers_data;

SELECT COUNT(*) AS total_receivers
FROM receiver_data;

SELECT city,
COUNT(*) AS total_providers
FROM providers_data
GROUP BY city
ORDER BY total_providers DESC
LIMIT 10;


SELECT city,
COUNT(*) AS total_receivers
FROM receiver_data
GROUP BY city
ORDER BY total_receivers DESC
LIMIT 10;

SELECT SUM(quantity) AS total_food_quantity
FROM food_listing_data;


SELECT food_type,
COUNT(*) AS total
FROM food_listing_data
GROUP BY food_type
ORDER BY total DESC
LIMIT 10;


SELECT meal_type,
COUNT(*) AS total
FROM food_listing_data
GROUP BY meal_type
ORDER BY total DESC
LIMIT 10;


SELECT provider_type,
COUNT(*) AS total
FROM food_listing_data
GROUP BY provider_type
ORDER BY total DESC
LIMIT 10;

SELECT status,
COUNT(*) AS total
FROM claims_data
GROUP BY status
ORDER BY total DESC
LIMIT 10;


SELECT Location_place,
COUNT(*) AS total
FROM food_listing_data
GROUP BY Location_place
ORDER BY total DESC
LIMIT 10;


SELECT food_name,
quantity
FROM food_listing_data
ORDER BY quantity DESC
LIMIT 10;


SELECT food_name,
expiry_date
FROM food_listing_data
ORDER BY expiry_date
LIMIT 10;


SELECT
    p.name_n,
    f.food_name
FROM providers_data p
JOIN food_listing_data f
    ON p.provider_id = f.rovider_id
LIMIT 10;


SELECT
    p.name_n,
    SUM(f.quantity) AS total_donated
FROM providers_data p
JOIN food_listing_data f
    ON p.provider_id = f.rovider_id
GROUP BY p.name_n
ORDER BY total_donated DESC
LIMIT 10;

SELECT
    r.name_n,
    COUNT(c.claim_id) AS total_claims
FROM receiver_data r
JOIN claims_data c
    ON r.receiver_id = c.receiver_id
GROUP BY r.name_n
ORDER BY total_claims DESC
LIMIT 10;


SELECT
    f.food_name,
    COUNT(c.claim_id) AS total_claims
FROM food_listing_data f
JOIN claims_data c
    ON f.food_id = c.food_id
GROUP BY f.food_name
ORDER BY total_claims DESC
LIMIT 10;


SELECT
    p.name_n,
    COUNT(c.claim_id) AS total_claims
FROM providers_data p
JOIN food_listing_data f
    ON p.provider_id = f.rovider_id
JOIN claims_data c
    ON f.food_id = c.food_id
GROUP BY p.name_n
ORDER BY total_claims DESC
LIMIT 10;


SELECT
    r.name_n,
    r.city,
    COUNT(c.claim_id) AS total_claims
FROM receiver_data r
JOIN claims_data c
    ON r.receiver_id = c.receiver_id
GROUP BY r.name_n, r.city
ORDER BY total_claims DESC
LIMIT 10;


SELECT
    r.city,
    COUNT(c.claim_id) AS total_claims
FROM receiver_data r
JOIN claims_data c
    ON r.receiver_id = c.receiver_id
GROUP BY r.city
ORDER BY total_claims DESC
LIMIT 10;



SELECT
    p.city,
    SUM(f.quantity) AS total_quantity
FROM providers_data p
JOIN food_listing_data f
    ON p.provider_id = f.rovider_id
GROUP BY p.city
ORDER BY total_quantity DESC
LIMIT 10;



SELECT
    f.food_type,
    COUNT(c.claim_id) AS total_claims
FROM food_listing_data f
JOIN claims_data c
    ON f.food_id = c.food_id
GROUP BY f.food_type
ORDER BY total_claims DESC
LIMIT 10;


SELECT
    f.meal_type,
    COUNT(c.claim_id) AS total_claims
FROM food_listing_data f
JOIN claims_data c
    ON f.food_id = c.food_id
GROUP BY f.meal_type
ORDER BY total_claims DESC
LIMIT 10;


SELECT food_name,
       expiry_date,
       quantity
FROM food_listing_data
WHERE expiry_date < CURRENT_DATE
LIMIT 10;

SELECT AVG(quantity) AS average_quantity
FROM food_listing_data;

SELECT p.name_n,
       AVG(f.quantity) AS avg_quantity
FROM providers_data p
JOIN food_listing_data f
    ON p.provider_id = f.rovider_id
GROUP BY p.name_n
ORDER BY avg_quantity DESC
LIMIT 10;

SELECT datname
FROM pg_database;

SELECT status, COUNT(*) FROM claims_data GROUP BY status;

SELECT food_type, COUNT(*) FROM food_listing_data GROUP BY food_type;

SELECT meal_type, COUNT(*) FROM food_listing_data GROUP BY meal_type;

SELECT city, COUNT(*) 
FROM providers_data
GROUP BY city
ORDER BY COUNT(*) DESC
LIMIT 10;

SELECT f.food_name, COUNT(c.claim_id) AS total_claims
FROM food_listing_data f
JOIN claims_data c
ON f.food_id = c.food_id
GROUP BY f.food_name
ORDER BY total_claims DESC
LIMIT 10;

SELECT f.food_name, COUNT(c.claim_id) AS total_claims
FROM food_listing_data f
JOIN claims_data c
ON f.food_id = c.food_id
GROUP BY f.food_name
ORDER BY total_claims DESC
LIMIT 10;

SELECT p.name_n, SUM(f.quantity) AS total_donated
FROM providers_data p
JOIN food_listing_data f
ON p.provider_id = f.rovider_id
GROUP BY p.name_n
ORDER BY total_donated DESC
LIMIT 10;