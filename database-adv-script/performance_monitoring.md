SET PROFILING = 1;
SELECT 
    b.booking_id,
    u.first_name,
    p.property_name
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
WHERE b.check_in_date BETWEEN '2025-07-01' AND '2025-07-31';
SHOW PROFILE FOR QUERY 1;
SELECT 
    query,
    calls,
    total_time,
    mean_time,
    rows
FROM pg_stat_statements
WHERE query LIKE '%bookings%'
ORDER BY total_time DESC
LIMIT 5;
