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



MOst frequently used columns
| Column       | Usage Type      | Reason / Example Use Case                 |
| ------------ | --------------- | ----------------------------------------- |
| `user_id`    | `JOIN`, `WHERE` | Primary key, used to join with `bookings` |
| `email`      | `WHERE`         | Used for login/authentication filters     |
| `created_at` | `ORDER BY`      | Sorting users by registration date        |


| Column          | Usage Type          | Reason / Example Use Case                  |
| --------------- | ------------------- | ------------------------------------------ |
| `booking_id`    | `WHERE`             | Fetch/edit specific booking                |
| `user_id`       | `JOIN`, `WHERE`     | Connects to `users` table                  |
| `property_id`   | `JOIN`, `WHERE`     | Connects to `properties` table             |
| `check_in_date` | `WHERE`, `ORDER BY` | Frequently filtered in date-range searches |
| `booking_date`  | `ORDER BY`          | Sort recent bookings                       |
| `status`        | `WHERE`             | Used to filter active/cancelled bookings   |


| Column            | Usage Type          | Reason / Example Use Case                            |
| ----------------- | ------------------- | ---------------------------------------------------- |
| `property_id`     | `JOIN`, `WHERE`     | Primary key; used to join with `bookings`, `reviews` |
| `property_name`   | `WHERE`, `ORDER BY` | Searching or sorting by name                         |
| `location`        | `WHERE`             | Filter by city, country, etc.                        |
| `price_per_night` | `WHERE`, `ORDER BY` | Sort/filter affordable properties                    |
