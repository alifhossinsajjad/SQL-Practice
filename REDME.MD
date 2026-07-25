# Vehicle Rental System – Theory Questions

## Question 1: What is a Foreign Key and why is it important in relational databases?

A **Foreign Key (FK)** is a column (or a set of columns) in one table that references the **Primary Key (PK)** of another table. It creates a relationship between two tables and ensures that the referenced data exists.

### Why is it important?

- Maintains relationships between tables.
- Prevents invalid or orphan records.
- Ensures data integrity and consistency.
- Reduces duplicate and inconsistent data.
- Makes JOIN operations possible.

**Example:**

In the `bookings` table, `user_id` is a foreign key that references `users(user_id)`, and `vehicle_id` is a foreign key that references `vehicles(vehicle_id)`.

---

## Question 2: What is the difference between `WHERE` and `HAVING` clauses in SQL?

Both `WHERE` and `HAVING` are used to filter data, but they work at different stages of a query.

| WHERE | HAVING |
|--------|---------|
| Filters rows before grouping. | Filters groups after `GROUP BY`. |
| Cannot use aggregate functions like `COUNT()` directly. | Can use aggregate functions such as `COUNT()`, `SUM()`, `AVG()`, etc. |
| Used with `SELECT`, `UPDATE`, and `DELETE`. | Used mainly with `GROUP BY`. |

### Example using `WHERE`

```sql
SELECT *
FROM vehicles
WHERE availability_status = 'Available';
```

### Example using `HAVING`

```sql
SELECT vehicle_id, COUNT(*) AS total_bookings
FROM bookings
GROUP BY vehicle_id
HAVING COUNT(*) > 2;
```

---

## Question 3: What is a Primary Key and what are its characteristics?

A **Primary Key (PK)** is a column (or a combination of columns) that uniquely identifies each row in a table.

### Characteristics of a Primary Key

- Must contain unique values.
- Cannot contain `NULL`.
- Each table should have only one primary key.
- Automatically creates a unique index.
- Helps establish relationships with other tables through foreign keys.

**Example:**

```sql
user_id SERIAL PRIMARY KEY
```

Here, every user receives a unique `user_id`.

---

## Question 4: What is the difference between `INNER JOIN` and `LEFT JOIN` in SQL?

Both joins are used to combine data from multiple tables, but they return different results.

### INNER JOIN

- Returns only the rows that have matching values in both tables.
- Non-matching rows are excluded.

**Example:**

```sql
SELECT u.name, v.vehicle_name
FROM bookings b
INNER JOIN users u
ON b.user_id = u.user_id
INNER JOIN vehicles v
ON b.vehicle_id = v.vehicle_id;
```

---

### LEFT JOIN

- Returns all rows from the left table.
- Returns matching rows from the right table.
- If there is no match, the columns from the right table contain `NULL`.

**Example:**

```sql
SELECT v.vehicle_name, b.booking_id
FROM vehicles v
LEFT JOIN bookings b
ON v.vehicle_id = b.vehicle_id;
```

---

## Summary

- **Primary Key** uniquely identifies each record.
- **Foreign Key** connects tables and maintains data integrity.
- **WHERE** filters individual rows before grouping.
- **HAVING** filters grouped data after `GROUP BY`.
- **INNER JOIN** returns only matching records.
- **LEFT JOIN** returns all records from the left table and matching records from the right table.