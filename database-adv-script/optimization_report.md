Nested Loop  (cost=0.85..1250.23 rows=100 width=... )
  -> Seq Scan on bookings b ...
  -> Index Scan using idx_users_user_id on users u ...


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
INNER JOIN payments pay ON b.booking_id = pay.booking_id;
