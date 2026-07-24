drop table if exists employees;
drop table if exists departments;




CREATE Table employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2),
    hire_date DATE
); 


INSERT INTO employees (employee_name, department_name, salary, hire_date)
VALUES
('Alif Mia', 'IT', 65000.00, '2022-01-15'),
('Sajjad Hossain', 'IT', 72000.00, '2022-05-10'),
('Nusrat Jahan', 'IT', 81000.00, '2023-02-20'),
('Rakib Hasan', 'IT', 59000.00, '2024-03-18'),
('Farhan Ahmed', 'IT', 93000.00, '2021-11-25'),
('Ayesha Khan', 'IT', 78000.00, '2022-08-11'),
('Shuvo Das', 'IT', 68000.00, '2023-09-17'),
('Nafis Rahman', 'IT', 99000.00, '2020-07-04'),
('Tanvir Islam', 'HR', 45000.00, '2022-04-12'),
('Mim Akter', 'HR', 48000.00, '2023-01-09'),
('Shamim Reza', 'HR', 53000.00, '2021-08-14'),
('Jannatul Ferdous', 'HR', 57000.00, '2024-02-22'),
('Rifat Karim', 'HR', 62000.00, '2020-12-01'),
('Asif Mahmud', 'HR', 51000.00, '2022-11-05'),
('Sumaiya Islam', 'HR', 67000.00, '2021-06-15'),
('Fahim Hasan', 'HR', 72000.00, '2023-10-09'),
('Nayeem Hasan', 'Sales', 55000.00, '2022-06-17'),
('Mahin Rahman', 'Sales', 61000.00, '2023-03-08'),
('Rasel Ahmed', 'Sales', 68000.00, '2021-10-19'),
('Sabbir Khan', 'Sales', 72000.00, '2024-01-30'),
('Sharmin Akter', 'Sales', 79000.00, '2020-09-15'),
('Imtiaz Hossain', 'Sales', 85000.00, '2022-12-21'),
('Tania Sultana', 'Sales', 91000.00, '2023-07-18'),
('Jahidul Islam', 'Sales', 98000.00, '2021-02-28'),
('Hasib Chowdhury', 'Finance', 70000.00, '2022-02-05'),
('Tanjila Islam', 'Finance', 76000.00, '2023-07-12'),
('Arif Hossain', 'Finance', 83000.00, '2021-04-28'),
('Faria Sultana', 'Finance', 91000.00, '2024-05-16'),
('Imran Kabir', 'Finance', 98000.00, '2020-11-20'),
('Nadia Rahman', 'Finance', 87000.00, '2022-09-13'),
('Saiful Islam', 'Finance', 105000.00, '2021-03-25'),
('Rumana Akter', 'Finance', 112000.00, '2023-08-01'),
('Mehedi Hasan', 'Marketing', 52000.00, '2022-03-14'),
('Sadia Islam', 'Marketing', 58000.00, '2023-06-21'),
('Omar Faruk', 'Marketing', 64000.00, '2021-09-11'),
('Nabila Rahman', 'Marketing', 71000.00, '2024-04-25'),
('Jahid Hasan', 'Marketing', 85000.00, '2020-10-08'),
('Shakib Ahmed', 'Marketing', 92000.00, '2022-05-30'),
('Tasnia Noor', 'Marketing', 76000.00, '2023-01-18'),
('Rezaul Karim', 'Marketing', 101000.00, '2021-12-12');

SELECT * FROM employees;

SELECT MAX(salary)
FROM employees
WHERE department_name = 'HR';

select * from employees
WHERE salary > (
    select Max (salary)
    FROM employees 
    WHERE department_name='HR'
);


SELECT * , (SELECT sum(salary) FROM employees) FROM employees;