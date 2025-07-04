User Table
  
-- Primary key (should already exist)
CREATE UNIQUE INDEX idx_users_user_id ON users(user_id);

-- Index on email (for login and lookup)
CREATE UNIQUE INDEX idx_users_email ON users(email);

-- Index on created_at (for sorting/filtering by signup date)
CREATE INDEX idx_users_created_at ON users(created_at);


BOOOKINGS table
-- Primary key (should already exist)
CREATE UNIQUE INDEX idx_bookings_booking_id ON bookings(booking_id);

-- Foreign key joins
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Filtering and sorting by date
CREATE INDEX idx_bookings_check_in_date ON bookings(check_in_date);
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);

-- Filtering by booking status
CREATE INDEX idx_bookings_status ON bookings(status);


PROPERTY TABLE
-- Primary key (should already exist)
CREATE UNIQUE INDEX idx_properties_property_id ON properties(property_id);

-- Index on searchable fields
CREATE INDEX idx_properties_name ON properties(property_name);
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_price ON properties(price_per_night);


--Measure the query performance before and after adding indexes using EXPLAIN or ANALYZE
SELECT 
    b.booking_id,
    u.first_name,
    p.property_name,
    b.check_in_date
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
WHERE b.check_in_date BETWEEN '2025-07-01' AND '2025-07-31'
ORDER BY b.check_in_date;
-- User and property IDs for join efficiency
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index for date filter
CREATE INDEX idx_bookings_check_in_date ON bookings(check_in_date);

-- Optional: indexes for sorting and lookup
CREATE INDEX idx_users_user_id ON users(user_id);
CREATE INDEX idx_properties_property_id ON properties(property_id);
