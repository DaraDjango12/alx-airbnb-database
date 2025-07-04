SELECT 
    b.booking_id,
    b.booking_date,
    b.check_in_date,
    b.check_out_date,

    -- User details
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,

    -- Property details
    p.property_id,
    p.property_name,
    p.location,
    p.price_per_night,

    -- Payment details
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method,
    pay.status

FROM bookings b

-- Join with users
INNER JOIN users u ON b.user_id = u.user_id

-- Join with properties
INNER JOIN properties p ON b.property_id = p.property_id

-- Join with payments
INNER JOIN payments pay ON b.booking_id = pay.booking_id;






SELECT 
    b.booking_id,
    b.booking_date,
    b.check_in_date,
    b.check_out_date,

    u.user_id,
    u.first_name,
    u.last_name,
    u.email,

    p.property_id,
    p.property_name,
    p.location,
    p.price_per_night,

    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method,
    pay.status

FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN properties p ON b.property_id = p.property_id
INNER JOIN payments pay ON b.booking_id = pay.booking_id

-- WHERE clause with AND condition
WHERE pay.status = 'completed'
AND b.check_out_date < CURRENT_DATE;



EXPLAIN
SELECT 
    b.booking_id,
    b.booking_date,
    b.check_in_date,
    b.check_out_date,

    u.user_id,
    u.first_name,
    u.last_name,
    u.email,

    p.property_id,
    p.property_name,
    p.location,
    p.price_per_night,

    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method,
    pay.status

FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN properties p ON b.property_id = p.property_id
INNER JOIN payments pay ON b.booking_id = pay.booking_id
WHERE pay.status = 'completed'
AND b.check_out_date < CURRENT_DATE;

