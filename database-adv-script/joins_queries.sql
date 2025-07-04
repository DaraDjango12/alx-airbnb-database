-- INNER JOIN for MySQL
SELECT 
    bookings.booking_id,
    bookings.property_id,
    bookings.booking_date,
    users.user_id,
    users.first_name,
    users.last_name,
    users.email
FROM bookings
INNER JOIN users ON bookings.user_id = users.user_id;



-- LEFT JOIN for MySQL
-- Sample data
INSERT INTO properties (property_id, property_name) VALUES (1, 'Villa Sunset'), (2, 'Ocean View'), (3, 'Forest Cabin');

INSERT INTO reviews (review_id, property_id, rating, comment) VALUES (101, 1, 5, 'Perfect!'), (102, 1, 4, 'Nice place'), (103, 2, 3, 'Okay');

-- Run the query
SELECT 
    properties.property_id,
    properties.property_name,
    reviews.review_id,
    reviews.rating,
    reviews.comment
FROM properties
LEFT JOIN reviews ON properties.property_id = reviews.property_id;


-- FULL OUTER JOIN for MySQL

SELECT 
    users.user_id,
    users.first_name,
    users.last_name,
    bookings.booking_id,
    bookings.property_id,
    bookings.booking_date
FROM users
FULL OUTER JOIN bookings ON users.user_id = bookings.user_id;


-- FULL OUTER JOIN for MySQL
SELECT 
    users.user_id,
    users.first_name,
    users.last_name,
    bookings.booking_id,
    bookings.property_id,
    bookings.booking_date
FROM users
LEFT JOIN bookings ON users.user_id = bookings.user_id

UNION

SELECT 
    users.user_id,
    users.first_name,
    users.last_name,
    bookings.booking_id,
    bookings.property_id,
    bookings.booking_date
FROM bookings
LEFT JOIN users ON bookings.user_id = users.user_id;
