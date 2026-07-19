CREATE TABLE students(
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT,
    grade VARCHAR(2),
    course VARCHAR(100),
email VARCHAR(100) UNIQUE,
dob DATE,
blood_group VARCHAR(3),
 

    country VARCHAR(50)
);


INSERT INTO students (first_name, last_name, age, grade, course, email, dob, blood_group, country)
VALUES
('Alice', 'Smith', 20, 'A', 'Mathematics', 'alice.smith@example.com', '2006-04-12', 'A+', 'USA'),
('Ethan', 'Carter', 21, 'B+', 'Computer Science', 'ethan.carter@example.com', '2005-09-18', 'O-', 'Canada'),
('Sophia', 'Patel', 19, 'A-', 'Biochemistry', 'sophia.patel@example.com', '2007-01-30', 'B+', 'UK'),
('Liam', 'Nguyen', 22, 'B', 'Mechanical Engineering', 'liam.nguyen@example.com', '2004-11-05', 'AB+', 'Australia'),
('Emma', 'Müller', 20, 'A', 'Physics', 'emma.mueller@example.com', '2006-07-22', 'A-', 'Germany'),
('Jackson', 'Davis', 23, 'C', 'History', 'jackson.davis@example.com', '2003-03-14', 'O+', 'USA'),
('Mia', 'Silva', 18, 'A+', 'Literature', 'mia.silva@example.com', '2008-05-09', 'B-', 'Brazil'),
('Yusuf', 'Al-Farsi', 21, 'B-', 'Economics', 'yusuf.alfarsi@example.com', '2005-12-01', 'O+', 'UAE'),
('Chloe', 'Dubois', 20, 'A', 'Art History', 'chloe.dubois@example.com', '2006-02-17', 'A+', 'France'),
('Kenji', 'Sato', 22, 'B+', 'Data Science', 'kenji.sato@example.com', '2004-08-25', 'AB-', 'Japan');


select * from students;

select * from students where age > 20;

SELECT course FROM students ;
SELECT email, blood_group FROM students ;


SELECT email as "Student Email" , age FROM students;


--show all data ascending order by name

select * from students ORDER BY first_name ASC;



select country from students;

select DISTINCT country from students;


select * from students where country = 'Brazil';


select * from students 
where grade = 'A' AND course = 'Physics';


select * from students 
where blood_group = 'A+';


select * from students 
where course = 'Computer Science' OR course = 'Data Science';

select * from students 
where course = 'Computer Science' OR course = 'Data Science' and age > 18;



select * from students 
where age != 20 ;

select upper(first_name) as "Uppercase First Name" from students;


select * from students 
where not (country = 'USA' );

--if you see the email is not null then it will show the data otherwise it will show the data where email is null
select * from students 
where email is not NULL;


--if you see the email is null then it will show the data otherwise it will show the data where email is not null
select * from students 
where email is NULL;


--if you see the email is null then it will show the data otherwise it will show the data where email is not null
select coalesce(email, 'No Email') as "Email Address" from students;


select * from students 
where country = 'USA' or country = 'canada' ;

--Here we are using IN operator to filter the data based on multiple countries
select * from students 
where country IN ('USA', 'Canada', 'UK');

--here we are using NOT IN operator to filter the data based on multiple countries
select * from students 
where country NOT IN ('USA', 'Canada', 'UK');


--Here we are using BETWEEN operator to filter the data based on age range
select * from students 
where age BETWEEN 20 AND 22;


--Here we are using BETWEEN operator to filter the data based on date of birth range
select * from students 
where dob BETWEEN '2005-01-01' AND '2006-12-31' ORDER BY dob;


--Here we are using LIKE operator to filter the data based on first name starting with 'A'
select * from students 
where first_name LIKE 'A%';

select * from students 
where first_name LIKE '%am';


--Here we are using LIKE operator to filter the data based on first name ending with 'a'
select * from students 
where first_name LIKE '__a%';