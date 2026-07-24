CREATE VIEW avg_salary
as SELECT department_name, avg(salary) FROM employees GROUP BY department_name;




SELECT * FROM avg_salary;