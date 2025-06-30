INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('11111111-1111-1111-1111-111111111111', 'Alice', 'Smith', 'alice@example.com', 'hashed_pw1', '1234567890', 'host'),
('22222222-2222-2222-2222-222222222222', 'Bob', 'Johnson', 'bob@example.com', 'hashed_pw2', '0987654321', 'guest'),
('33333333-3333-3333-3333-333333333333', 'Charlie', 'Lee', 'charlie@example.com', 'hashed_pw3', NULL, 'host'),
('44444444-4444-4444-4444-444444444444', 'Diana', 'Moore', 'diana@example.com', 'hashed_pw4', '1122334455', 'admin');
