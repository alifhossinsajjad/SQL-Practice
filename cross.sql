-- Department টেবিল
CREATE TABLE departments (dept_id INT, dept_name VARCHAR(50));
INSERT INTO departments
VALUES (1, 'IT'),
    (2, 'HR'),
    (3, 'Finance'),
    (4, 'Marketing');
-- Employee টেবিল
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    designation VARCHAR(50)
);
INSERT INTO employees
VALUES (1, 'Rahim Uddin', 'Developer'),
    (2, 'Karim Mia', 'Designer'),
    (3, 'Sumaiya Akter', 'Analyst');
-- CROSS JOIN
SELECT e.emp_id,
    -- Employee ID
    e.emp_name,
    e.designation,
    d.dept_id,
    -- Department ID
    d.dept_name
FROM employees e
    CROSS JOIN departments d
ORDER BY e.emp_id,
    d.dept_id;