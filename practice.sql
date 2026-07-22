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