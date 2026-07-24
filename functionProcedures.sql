SELECT * FROM employees;

CREATE Function emp_count()
RETURNS INT
LANGUAGE SQL 
AS

$$

SELECT COUNT(*) FROM employees
$$;



SELECT emp_count();


CREATE or REPLACE Function  del_emp_by_id(p_emp_id int)
RETURNS void
LANGUAGE SQL 
AS

$$

DELETE FROM employees WHERE employee_id = p_emp_id; 
$$;

SELECT * FROM employees;    

SELECT del_emp_by_id(40);