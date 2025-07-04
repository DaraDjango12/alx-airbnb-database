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
