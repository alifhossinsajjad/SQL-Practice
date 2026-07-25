-- Active: 1783948992845@@127.0.0.1@5432@vehicle_rental_db
-- Step:01
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    role VARCHAR(20),
    CONSTRAINT chk_role CHECK (role IN ('Admin', 'Customer'))
);
DROP TABLE IF EXISTS users;
-- Step:02
CREATE TABLE vehicles(
    vehicle_id SERIAL PRIMARY KEY,
    vehicle_name VARCHAR(100) NOT NULL,
    vehicle_type VARCHAR(20),
    CHECK(vehicle_type IN ('Car', 'Bike', 'Truck')),
    model VARCHAR(100),
    registration_number VARCHAR(50) UNIQUE NOT NULL,
    rental_price_per_day DECIMAL(10, 2),
    availability_status VARCHAR(20),
    CHECK(
        availability_status IN ('Available', 'Rented', 'Maintenance')
    )
);
-- Step:03
CREATE TABLE bookings(
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    booking_status VARCHAR(20) CHECK(
        booking_status IN (
            'Pending',
            'Confirmed',
            'Completed',
            'Cancelled'
        )
    ),
    total_cost DECIMAL(10, 2),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(vehicle_id) REFERENCES vehicles(vehicle_id)
);
-- Step-04
CREATE TABLE bookings(
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    booking_status VARCHAR(20),
    CHECK(
        booking_status IN (
            'Pending',
            'Confirmed',
            'Completed',
            'Cancelled'
        )
    ),
    total_cost DECIMAL(10, 2),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(vehicle_id) REFERENCES vehicles(vehicle_id)
);
-- Step-05
INSERT INTO users (name, email, password, phone, role)
VALUES (
        'Alice Green',
        'alice@gmail.com',
        '123456',
        '01711111111',
        'Customer'
    ),
    (
        'Bob White',
        'bob@gmail.com',
        '123456',
        '01822222222',
        'Customer'
    ),
    (
        'Carol King',
        'carol@gmail.com',
        '123456',
        '01933333333',
        'Customer'
    ),
    (
        'David Admin',
        'admin@gmail.com',
        '123456',
        '01644444444',
        'Admin'
    );
--Insert Vehicles 
INSERT INTO vehicles (
        vehicle_name,
        vehicle_type,
        model,
        registration_number,
        rental_price_per_day,
        availability_status
    )
VALUES (
        'Toyota Corolla',
        'Car',
        '2022',
        'DHK-1111',
        2500,
        'Available'
    ),
    (
        'Honda Civic',
        'Car',
        '2021',
        'DHK-2222',
        2200,
        'Rented'
    ),
    (
        'Yamaha R15',
        'Bike',
        '2023',
        'DHK-3333',
        1200,
        'Available'
    ),
    (
        'Isuzu Truck',
        'Truck',
        '2020',
        'DHK-4444',
        5000,
        'Maintenance'
    ),
    (
        'Suzuki Gixxer',
        'Bike',
        '2024',
        'DHK-5555',
        1400,
        'Available'
    );
--Bookings
INSERT INTO bookings (
        user_id,
        vehicle_id,
        start_date,
        end_date,
        booking_status,
        total_cost
    )
VALUES (
        1,
        2,
        '2025-01-10',
        '2025-01-15',
        'Completed',
        11000
    ),
    (
        2,
        1,
        '2025-02-05',
        '2025-02-07',
        'Confirmed',
        5000
    ),
    (
        3,
        2,
        '2025-03-01',
        '2025-03-03',
        'Completed',
        4400
    ),
    (
        1,
        2,
        '2025-04-01',
        '2025-04-04',
        'Pending',
        6600
    ),
    (
        2,
        5,
        '2025-04-10',
        '2025-04-12',
        'Completed',
        4200
    );
--Query -01
SELECT u.name,
    v.vehicle_name
FROM bookings b
    JOIN users u ON b.user_id = u.user_id
    JOIN vehicles v ON b.vehicle_id = v.vehicle_id;
--Query-02
SELECT *
FROM vehicles v
WHERE NOT EXISTS(
        SELECT *
        FROM bookings b
        WHERE b.vehicle_id = v.vehicle_id
    );
--query-03
SELECT *
FROM vehicles
WHERE vehicle_type = 'Car'
    AND availability_status = 'Available';
--query-04
SELECT v.vehicle_name,
    COUNT(b.booking_id) AS total_booking
FROM vehicles v
    JOIN bookings b ON v.vehicle_id = b.vehicle_id
GROUP BY v.vehicle_name
HAVING COUNT(b.booking_id) > 2;