-- Optional: rename existing bookings table for backup
ALTER TABLE bookings RENAME TO bookings_old;
CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- Add other columns as needed
    PARTITION BY RANGE (check_in_date)
);
-- Partition for bookings in Q1 2025
CREATE TABLE bookings_2025_q1 PARTITION OF bookings
FOR VALUES FROM ('2025-01-01') TO ('2025-04-01');

-- Partition for bookings in Q2 2025
CREATE TABLE bookings_2025_q2 PARTITION OF bookings
FOR VALUES FROM ('2025-04-01') TO ('2025-07-01');

-- Partition for bookings in Q3 2025
CREATE TABLE bookings_2025_q3 PARTITION OF bookings
FOR VALUES FROM ('2025-07-01') TO ('2025-10-01');

-- Add more partitions as needed
INSERT INTO bookings
SELECT * FROM bookings_old;
CREATE INDEX idx_bookings_2025_q1_user_id ON bookings_2025_q1(user_id);
CREATE INDEX idx_bookings_2025_q1_property_id ON bookings_2025_q1(property_id);
EXPLAIN
SELECT *
FROM bookings
WHERE check_in_date BETWEEN '2025-04-01' AND '2025-06-30';





---------------------------------
EXPLAIN ANALYZE
SELECT 
    booking_id,
    user_id,
    property_id,
    check_in_date,
    check_out_date
FROM bookings
WHERE check_in_date BETWEEN '2025-04-01' AND '2025-06-30';




EXPLAIN ANALYZE
SELECT 
    booking_id,
    user_id,
    property_id,
    check_in_date,
    check_out_date
FROM bookings_old
WHERE check_in_date BETWEEN '2025-04-01' AND '2025-06-30';

SELECT * FROM pg_stat_statements
WHERE query LIKE '%FROM bookings%';
