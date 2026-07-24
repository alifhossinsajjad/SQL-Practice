-- Active: 1783948992845@@127.0.0.1@5432@ph2
SELECT * FROM employees;

CREATE TABLE employee (
    employee_id SERIAL PRIMARY KEY,
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL
);

INSERT INTO employee (birth_date, first_name, last_name, hire_date)
SELECT
    DATE '1970-01-01' + (random() * 12000)::INT,
    (ARRAY[
        'John','Michael','David','James','Robert',
        'William','Daniel','Joseph','Thomas','Charles',
        'Jennifer','Jessica','Emily','Sarah','Sophia',
        'Emma','Olivia','Liam','Noah','Mason'
    ])[floor(random() * 20 + 1)],

    (ARRAY[
        'Smith','Johnson','Williams','Brown','Jones',
        'Garcia','Miller','Davis','Rodriguez','Martinez',
        'Wilson','Anderson','Taylor','Thomas','Moore',
        'Jackson','Martin','Lee','White','Harris'
    ])[floor(random() * 20 + 1)],

    DATE '2000-01-01' + (random() * 9000)::INT
FROM generate_series(1,100000);

SELECT * FROM employee;

ALTER TABLE employee
ADD COLUMN gender CHAR(1);

UPDATE employee
SET gender = CASE
    WHEN random() < 0.5 THEN 'M'
    ELSE 'F'
END;


UPDATE employee
SET gender = CASE
    WHEN first_name IN (
        'John','Michael','David','James','Robert',
        'William','Daniel','Joseph','Thomas','Charles',
        'Liam','Noah','Mason'
    ) THEN 'M'
    ELSE 'F'
END;





EXPLAIN ANALYSE
SELECT * FROM employee
WHERE first_name = 'Daniel'


CREATE INDEX index_employee
on employee(first_name)

SHOW data_directory;