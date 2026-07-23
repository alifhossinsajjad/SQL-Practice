create table employees(
    employee_id serial primary key,
    employee_name varchar(100),
    department_id int references departments(dept_id),
    salary decimal(10, 2),
    hire_date date
);



INSERT INTO employees (employee_name, department_id, salary, hire_date) VALUES
('Rahim Uddin', 1, 55000.00, '2020-01-15'),
('Karim Mia', 1, 48000.00, '2021-03-20'),
('Sumaiya Akter', 1, 62000.00, '2019-07-10'),
('Tanvir Hasan', 1, 45000.00, '2022-05-25'),
('Fatima Begum', 2, 42000.00, '2020-09-01'),
('Jamal Hossain', 2, 38000.00, '2021-11-15'),
('Nusrat Jahan', 2, 51000.00, '2018-04-30'),
('Rafiq Islam', 3, 65000.00, '2017-02-28'),
('Sakib Ahmed', 3, 47000.00, '2021-08-12'),
('Mitu Roy', 3, 53000.00, '2019-12-01'),
('Anik Khan', 4, 44000.00, '2022-01-10'),
('Priya Das', 4, 49000.00, '2020-06-15'),
('Sohan Rahman', 4, 40000.00, '2023-03-05'),
('Rifat Ahmed', 5, 46000.00, '2021-04-20'),
('Tania Akter', 5, 52000.00, '2019-09-15'),
('Arif Hossain', 5, 41000.00, '2022-07-30'),
('Nadia Sultana', 6, 43000.00, '2020-10-10'),
('Kabir Uddin', 6, 50000.00, '2018-06-25'),
('Rina Chowdhury', 6, 39000.00, '2023-01-20');



create table departments(
    dept_id serial primary key,
    dept_name varchar(100)
);



INSERT INTO departments (dept_name) VALUES 
('IT'),
('HR'),
('Finance'),
('Marketing'),
('Sales'),
('Operations');



drop table if exists employees;
drop table if exists departments;


select * from employees;

select * from employees
join departments on employees.department_id = departments.dept_id;



select * from departments;
select * FROM employees;

-- rename column
ALTER TABLE departments 
RENAME COLUMN dept_id TO department_id;

-- using natural join
SELECT * FROM employees
JOIN departments USING(department_id);



select dept_name , round(avg(salary)) as avg_salary from employees
join departments using (department_id)
GROUP BY dept_name ;



select dept_name, round(avg(salary)) as avg_salary FROM employees 
JOIN departments USING (department_id)
GROUP BY dept_name
ORDER BY avg_salary DESC
LIMIT 1; 

SELECT * from employees;

SELECT extract (YEAR FROM hire_date) as hired_year, count(*) FROM employees
GROUP BY hired_year




CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);



INSERT INTO orders (customer_id, order_date, total_amount)
VALUES
(101, '2026-01-05', 250.50),
(101, '2026-01-10', 450.00),
(101, '2026-01-15', 899.99),
(101, '2026-02-02', 1200.00),
(102, '2026-01-08', 1200.00),
(102, '2026-01-22', 980.00),
(102, '2026-02-05', 560.75),
(102, '2026-02-18', 1500.00),
(103, '2026-01-10', 799.99),
(103, '2026-02-01', 299.99),
(103, '2026-02-10', 1800.50),
(103, '2026-02-25', 430.00),
(104, '2026-01-18', 150.00),
(104, '2026-02-10', 670.20),
(104, '2026-02-15', 1250.75),
(104, '2026-03-01', 980.00),
(105, '2026-01-20', 3200.40),
(105, '2026-02-12', 2100.00),
(105, '2026-02-20', 500.50),
(105, '2026-03-05', 850.75),
(105, '2026-03-10', 1750.00),
(106, '2026-01-25', 550.25),
(106, '2026-02-14', 780.00),
(106, '2026-03-08', 920.00),
(107, '2026-01-28', 1750.60),
(107, '2026-02-16', 1250.00),
(107, '2026-03-12', 2100.50),
(108, '2026-02-03', 899.50),
(108, '2026-02-22', 450.75),
(108, '2026-03-15', 999.99),
(109, '2026-02-05', 430.00),
(109, '2026-02-25', 780.80),
(109, '2026-03-18', 1500.25),
(110, '2026-02-08', 1250.75),
(110, '2026-02-28', 990.50),
(110, '2026-03-20', 1800.00);

DROP table orders;





select customer_id , count(order_id),sum(total_amount) as total_spent FROM orders
GROUP BY customer_id
HAVING count(order_id) >2;


SELECT to_char(order_date, 'Month') as month_name , sum(total_amount) as Total_Amount FROM orders
WHERE EXTRACT(YEAR FROM order_date) =2026
GROUP BY to_char(order_date , 'Month') , EXTRACT (MONTH FROM order_date)
ORDER BY EXTRACT(MONTH from order_date);