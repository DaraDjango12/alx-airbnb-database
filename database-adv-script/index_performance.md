users table:
user_id → used in JOINs with bookings

email → likely used in login or user search

bookings table:
user_id → used in JOINs and filters

property_id → used in JOINs with properties

booking_date → potential use in filtering/sorting

properties table:
property_id → used in JOINs and aggregations

property_name → possibly used in searches or ORDER BY



-- Indexes for users table
CREATE INDEX idx_users_user_id ON users(user_id);
CREATE INDEX idx_users_email ON users(email);

-- Indexes for bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);

-- Indexes for properties table
CREATE INDEX idx_properties_property_id ON properties(property_id);
CREATE INDEX idx_properties_name ON properties(property_name);


-- Example query
EXPLAIN ANALYZE
SELECT 
    u.first_name,
    u.last_name,
    COUNT(*) AS booking_count
FROM users u
JOIN bookings b ON u.user_id = b.user_id
GROUP BY u.user_id
HAVING COUNT(*) > 3;
