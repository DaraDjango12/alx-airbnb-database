INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('11111111-1111-1111-1111-111111111111', 'Alice', 'Smith', 'alice@example.com', 'hashed_pw1', '1234567890', 'host'),
('22222222-2222-2222-2222-222222222222', 'Bob', 'Johnson', 'bob@example.com', 'hashed_pw2', '0987654321', 'guest'),
('33333333-3333-3333-3333-333333333333', 'Charlie', 'Lee', 'charlie@example.com', 'hashed_pw3', NULL, 'host'),
('44444444-4444-4444-4444-444444444444', 'Diana', 'Moore', 'diana@example.com', 'hashed_pw4', '1122334455', 'admin');

INSERT INTO Properties (property_id, user_id, title, description, address, city, state, country, price_per_night, max_guests)
VALUES
('aaaa1111-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111',
 'Cozy Apartment Downtown', 'A quiet place near city center.', '123 Main St', 'Amsterdam', 'North Holland', 'Netherlands', 85.00, 2),
('bbbb2222-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '33333333-3333-3333-3333-333333333333',
 'Beachside Bungalow', 'Steps from the beach with great views.', '456 Ocean Blvd', 'Barcelona', 'Catalonia', 'Spain', 120.00, 4);

INSERT INTO Bookings (booking_id, property_id, guest_id, start_date, end_date, total_price, status)
VALUES
('bkg-0011-1111-1111-1111-111111111111', 'aaaa1111-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222',
 '2025-07-10', '2025-07-15', 425.00, 'confirmed'),

('bkg-0022-2222-2222-2222-222222222222', 'bbbb2222-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '22222222-2222-2222-2222-222222222222',
 '2025-08-01', '2025-08-05', 480.00, 'pending');


INSERT INTO Reviews (review_id, booking_id, rating, comment)
VALUES
('rvw-aaaa-bbbb-cccc-dddd-eeeeeeeeeeee', 'bkg-0011-1111-1111-1111-111111111111', 5, 'Amazing stay! Very clean and close to everything.');


INSERT INTO PropertyImages (image_id, property_id, image_url)
VALUES
('img-1111-aaaa-cccc-aaaa-000000000001', 'aaaa1111-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'https://example.com/images/apartment1.jpg'),
('img-2222-bbbb-dddd-bbbb-000000000002', 'bbbb2222-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'https://example.com/images/beach1.jpg');


CREATE TABLE Payments (
    payment_id UUID PRIMARY KEY,
    booking_id UUID NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_method VARCHAR(50),
    status VARCHAR(20) CHECK (status IN ('paid', 'failed', 'pending')),
    paid_at TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id) ON DELETE CASCADE
);

INSERT INTO Payments (payment_id, booking_id, amount, payment_method, status, paid_at)
VALUES
('pay-0001-0001-0001-0001-000000000001', 'bkg-0011-1111-1111-1111-111111111111', 425.00, 'credit_card', 'paid', '2025-06-01 14:00:00');
