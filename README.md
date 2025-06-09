# Travel Booking System (SQL Project)

## 📌 Description
This project is a **database-driven Travel Booking System** built using **MySQL**. It manages users, flight bookings, hotel reservations, car rentals, payments, and cancellations. The goal is to simulate a backend database for a real-world travel portal.

---

## 🛠️ Features

- 📋 Manage user information, bookings, and travel services (flights, hotels, cars)
- 💳 Track payment status and handle cancellations
- 📊 Generate reports using stored procedures and views
- 🔍 Perform advanced data retrieval using JOINs and custom queries

---

## 🧱 Database Schema

### 🗃️ Tables:
- `users` – Stores user information
- `flights` – Stores flight details
- `hotels` – Stores hotel data
- `carrentals` – Stores car rental information
- `bookings` – Central table linking users to travel services
- `payments` – Tracks payment status for each booking
- `cancellations` – Records cancelled bookings

### 🔗 Relationships:
- `bookings` table links to `users`, `flights`, `hotels`, and `carrentals`
- `payments` and `cancellations` are linked to `bookings`
- All foreign keys ensure referential integrity

---

## 🧠 SQL Concepts Used

- **DDL**: CREATE TABLE with primary and foreign keys
- **DML**: INSERT, SELECT, UPDATE, DELETE
- **JOINS**: Multi-table queries using INNER JOIN
- **Stored Procedures**:
  - `GetTotalRevenue` – Calculates total revenue from payments
  - `GetBookingsByUser` – Lists all bookings made by a specific user
  - `GetCancellationsReport` – Returns report of all cancellations
  - `GetMostBookedFlights` – Shows most frequently booked flights
  - `GetPaymentsStatusReport` – Summarizes payment statuses
- **Views**:
  - `BookingSummary` – Summarizes booking details with user and service info

---

## 💾 How to Use

1. Open MySQL Workbench or any MySQL client
2. Run the `booking_database.sql` file to create the database
3. Test the stored procedures and views using `CALL` and `SELECT` statements
4. Extend the database for web integration or admin dashboard if needed

---

## 📚 Sample Query

```sql
-- Get booking summary with user name and payment status
SELECT u.username, b.booking_id, f.flight_name, p.status
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN flights f ON b.flight_id = f.flight_id
JOIN payments p ON b.booking_id = p.booking_id;
