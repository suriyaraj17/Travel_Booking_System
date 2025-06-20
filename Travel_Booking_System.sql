create database travel_booking_system;

use travel_booking_system;

create table users(
 user_id int auto_increment primary key,
 user_name varchar(100) not null,
 ph_no bigint unique not null,
 email varchar(200) unique not null,
 password varchar(100) not null,
 created_at datetime default current_timestamp,
 updated_at datetime default current_timestamp ON update current_timestamp
 );
 
create table flight(
 flight_id int auto_increment primary key,
 seat_availability int,
 departure varchar(100),
 arrival varchar(100),
 departure_time time,
 arrival_time time,
 price int
 );
 
 CREATE TABLE Hotels(
Hotel_Id INT AUTO_INCREMENT PRIMARY KEY,
Hotel_Name VARCHAR(50),
Location VARCHAR(50),
Room_Type VARCHAR(50),
Room_Availability int,
Price_Per_Day INT
);

CREATE TABLE CarRentals (
    car_id INT PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(100),
    location VARCHAR(100),
    car_type VARCHAR(50),
    price_per_day INT
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    flight_id INT,
    hotel_id INT,
    car_id INT,
    booking_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_cost INT,
    
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (flight_id) REFERENCES Flight(flight_id),
    FOREIGN KEY (Hotel_id) REFERENCES Hotels(Hotel_id),
    FOREIGN KEY (car_id) REFERENCES CarRentals(car_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    amount_paid INT,
    payment_method VARCHAR(50),  
    payment_status VARCHAR(20),  
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

CREATE TABLE Cancellations (
    cancellation_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    cancel_reason TEXT,
    cancelled_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    refund_amount INT,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

INSERT INTO users (user_name, ph_no, email, password)
VALUES 
('Arjun Kumar', 9876543210, 'arjun.kumar@example.com', 'arjun@123'),
('Priya Sharma', 9123456789, 'priya.sharma@example.com', 'priya@456'),
('Ravi Varma', 9988776655, 'ravi.varma@example.com', 'ravi@789'),
('Sneha Roy', 9012345678, 'sneha.roy@example.com', 'sneha@321'),
('Karan Mehta', 8899001122, 'karan.mehta@example.com', 'karan@654'),
('Arjun reddy', 9876553212, 'arjun.reddy@example.com', 'reddy@123'),
('shashank singh', 9976503110, 'shashank.singh@example.com', 'shashank@123'),
('messi', 9076503210, 'messi@example.com', 'messi@123'),
('preeti zinta', 9872553215, 'preeti.zinta@example.com', 'preeti@123'),
('suryakumar yadav', 9872593217, 'surya.yadav@example.com', 'surya@123');

INSERT INTO flight (seat_availability, departure, arrival, departure_time, arrival_time, price)
VALUES 
(120, 'Chennai', 'Delhi', '08:00:00', '11:30:00', 4500),
(80, 'Mumbai', 'Kolkata', '14:15:00', '17:45:00', 5200),
(150, 'Bangalore', 'Hyderabad', '09:30:00', '11:00:00', 2100),
(60, 'Delhi', 'Goa', '06:00:00', '09:00:00', 6100),
(87, 'hyderabad', 'Mumbai', '12:45:00', '15:30:00', 4000),
(92, 'Chennai', 'madurai', '12:00:00', '15:00:00', 2000),
(143, 'mumabi', 'punjab', '10:45:00', '15:30:00', 4500),
(69, 'lucknow', 'kolkata', '08:45:00', '10:30:00', 2500),
(75, 'gujarat', 'delhi', '12:45:00', '15:30:00', 4200),
(108, 'delhi', 'chennai', '10:45:00', '08:30:00', 5200);

INSERT INTO Hotels (Hotel_Name, Location, Room_Type, Room_Availability, Price_Per_Day) VALUES
('Grand Palace', 'Delhi', 'Deluxe', 5, 3000),
('Sea View Resort', 'Kolkata', 'Suite', 2, 4500),
('City Comfort', 'Hyderabad', 'Standard', 8, 2000),
('Hilltop Inn', 'Goa', 'Luxury', 4, 3500),
('Royal Stay', 'Mumbai', 'Suite', 0, 5000),
('Urban Nest', 'Madurai', 'Standard', 7, 2500),
('Palm Retreat', 'Punjab', 'Deluxe', 3, 3200),
('Desert Pearl', 'Kolkata', 'Luxury', 6, 4000),
('Riverfront Hotel', 'Delhi', 'Standard', 1, 2700),
('Mountain View', 'Chennai', 'Suite', 9, 4200);

INSERT INTO CarRentals (company_name, location, car_type, available_cars, price_per_day) VALUES
('ZoomCar', 'Delhi', 'SUV', 5, 2500),
('Drivezy', 'Kolkata', 'Hatchback', 3, 1500),
('Revv', 'Hyderabad', 'Sedan', 7, 1800),
('Myles', 'Goa', 'SUV', 2, 2700),
('Royal Drive', 'Mumbai', 'Luxury', 2, 5000),
('IndusGo', 'madurai', 'Compact', 4, 1200),
('Savaari', 'punjab', 'Sedan', 6, 1700),
('ZoomCar', 'kolkata', 'Hatchback', 2, 1400),
('Drivezy', 'delhi', 'SUV', 3, 2600),
('Revv', 'Chennai', 'Compact', 5, 1300);

INSERT INTO Bookings (user_id, flight_id, hotel_id, car_id, booking_date, total_cost) VALUES
(11, 1, 21, 1, NOW(), 10000),
(12, 2, 22, 2, NOW(), 11200),
(13, 3, 23, 3, NOW(), 5900),
(14, 4, 24, 4, NOW(), 12300),
(15, 5, 25, 5, NOW(), 14000),
(16, 6, 26, 6, NOW(), 5700),
(17, 7, 27, 7, NOW(), 9400),
(18, 8, 28, 8, NOW(), 7900),
(19, 9, 29, 9, NOW(), 9500),
(20, 10,30,10, NOW(),10700);

INSERT INTO Payments (booking_id, amount_paid, payment_method, payment_status)
VALUES
(1, 10000, 'Credit Card', 'Paid'),
(2, 11200, 'UPI', 'Paid'),
(3, 5900, 'NetBanking', 'Paid'),
(4, 12300, 'Credit Card', 'Paid'),
(5, 14000, 'UPI', 'Paid'),
(6, 5700, 'Debit Card', 'Paid'),
(7, 9400, 'Credit Card', 'Paid'),
(8, 7900, 'NetBanking', 'paid'),
(9, 9500, 'UPI', 'Paid'),
(10, 10700, 'Debit Card', 'Paid');

INSERT INTO Cancellations (booking_id, cancel_reason, cancelled_at, refund_amount)
VALUES
(2, 'Change in travel plans', '2025-06-01 10:15:00', 11200),
(4, 'Medical emergency', '2025-06-02 15:30:00', 12300),
(6, 'Flight was delayed beyond acceptable limits', '2025-06-03 08:45:00', 5700),
(8, 'Destination unavailable due to weather', '2025-06-04 18:00:00', 7900),
(10, 'Personal reasons', '2025-06-05 13:20:00', 10700);

select * from users;
select * from flight;
select * from hotels;
select * from CarRentals;
select * from Bookings;
select * from payments;
select * from cancellations;

-- average price per day for all hotels 
SELECT AVG(Price_Per_Day) AS avg_hotel_price FROM Hotels;

-- most expensive and the cheapest flight 
SELECT MAX(price) AS max_price, MIN(price) AS min_price FROM Flight;

-- total amount refunded due to booking cancellations.
SELECT SUM(refund_amount) AS total_refund FROM Cancellations;

-- Total Revenue Earned from Each Payment Method
SELECT payment_method, SUM(amount_paid) AS total_revenue 
FROM Payments 
GROUP BY payment_method;

-- Canceled Bookings with Reason
SELECT c.booking_id, u.user_name, c.cancel_reason, c.refund_amount
FROM Cancellations c
JOIN Bookings b ON c.booking_id = b.booking_id
JOIN Users u ON b.user_id = u.user_id;

-- Top 3 Most Expensive Flights
SELECT * 
FROM Flight 
ORDER BY price DESC 
LIMIT 3;

-- Users who booked the costliest booking
SELECT * FROM Users 
WHERE user_id IN (
  SELECT user_id 
  FROM Bookings 
  WHERE total_cost = (SELECT MAX(total_cost) FROM Bookings)
);

-- Find Flights Cheaper Than ₹3000
SELECT * 
FROM Flight 
WHERE price < 3000;


-- Hotels with price per day above average
SELECT * FROM Hotels 
WHERE Price_Per_Day > (SELECT AVG(Price_Per_Day) FROM Hotels);

-- Flights that have been booked
SELECT * FROM Flight 
WHERE flight_id IN (SELECT flight_id FROM Bookings);

-- Procedure to display all booking details made by a specific user.
DELIMITER $$
CREATE PROCEDURE GetBookingsByUser(IN user_id_input INT)
BEGIN
    SELECT b.booking_id, f.departure, f.arrival, h.hotel_name, c.company_name, b.total_cost, b.booking_date
    FROM Bookings b
    JOIN Flight f ON b.flight_id = f.flight_id
    JOIN Hotels h ON b.hotel_id = h.hotel_id
    JOIN CarRentals c ON b.car_id = c.car_id
    WHERE b.user_id = user_id_input;
END$$
DELIMITER ;

-- Procedure to calculate total revenue excluding refunded amounts.
DELIMITER $$
CREATE PROCEDURE GetTotalRevenue()
BEGIN
    SELECT 
        SUM(b.total_cost) - IFNULL(SUM(c.refund_amount), 0) AS total_revenue_excluding_refunds
    FROM 
        Bookings b
    LEFT JOIN 
        Cancellations c ON b.booking_id = c.booking_id;
END$$
DELIMITER ;

-- Procedure to generate a report of all payments with user details and payment status.
DELIMITER $$
CREATE PROCEDURE GetPaymentsStatusReport()
BEGIN
    SELECT p.payment_id, u.user_name, p.amount_paid, p.payment_method, p.payment_status, p.payment_date
    FROM Payments p
    JOIN Bookings b ON p.booking_id = b.booking_id
    JOIN Users u ON b.user_id = u.user_id;
END$$
DELIMITER ;

DELIMITER $$

-- Procedure to list all cancellations with user info, flight route, reason, and refund.
CREATE PROCEDURE GetCancellationsReport()
BEGIN
    SELECT 
        c.cancellation_id,
        c.booking_id,
        u.user_name,
        f.departure,
        f.arrival,
        c.cancelled_at,
        c.cancel_reason,
        c.refund_amount
    FROM Cancellations c
    JOIN Bookings b ON c.booking_id = b.booking_id
    JOIN Users u ON b.user_id = u.user_id
    JOIN Flight f ON b.flight_id = f.flight_id;
END$$

DELIMITER ;

-- Procedure to find the top 5 most frequently booked flights.
DELIMITER $$
CREATE PROCEDURE GetMostBookedFlights()
BEGIN
    SELECT f.flight_id, f.departure, f.arrival, COUNT(*) AS times_booked
    FROM Bookings b
    JOIN Flight f ON b.flight_id = f.flight_id
    GROUP BY b.flight_id
    ORDER BY times_booked DESC
    LIMIT 5;
END$$
DELIMITER ;

CALL GetTotalRevenue();
CALL GetBookingsByUser(15);
CALL GetCancellationsReport();
CALL GetMostBookedFlights();
CALL GetPaymentsStatusReport();

-- View combining booking, user, flight, hotel, and car rental info into one summary.
CREATE OR REPLACE VIEW BookingSummary AS
SELECT 
    b.booking_id,
    u.user_name,
    f.departure,
    f.arrival,
    h.Hotel_Name,
    c.company_name,
    b.booking_date,
    b.total_cost
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Flight f ON b.flight_id = f.flight_id
JOIN Hotels h ON b.hotel_id = h.Hotel_Id
JOIN CarRentals c ON b.car_id = c.car_id;

SELECT * FROM BookingSummary;

