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
('Amara', 'Okonkwo', 20, 'A+', 'Data Science', 'amara.okonkwo@example.com', '2006-03-15', 'O+', 'Nigeria'),
('Mateo', 'Fernandez', 21, 'A', 'Computer Science', 'mateo.f@example.com', '2005-08-22', 'A+', 'Argentina'),
('Elena', 'Petrova', 19, 'A-', 'Mathematics', 'elena.p@example.com', '2007-01-11', 'B+', 'Russia'),
('Aarav', 'Sharma', 22, 'A+', 'Physics', 'aarav.sharma@example.com', '2004-11-30', 'O-', 'India'),
('Lucas', 'Martin', 20, 'A', 'Mechanical Engineering', 'lucas.m@example.com', '2006-05-14', 'AB+', 'France'),
('Zara', 'Ali', 21, 'A-', 'Biochemistry', 'zara.ali@example.com', '2005-09-09', 'A-', 'Pakistan'),
('Diego', 'Gomez', 23, 'B+', 'Economics', 'diego.g@example.com', '2003-04-18', 'O+', 'Mexico'),
('Ji-Woo', 'Kim', 19, 'B', 'Literature', 'jiwoo.kim@example.com', '2007-07-07', 'B-', 'South Korea'),
('Fatima', 'Al-Mansoor', 20, 'B-', 'Art History', 'fatima.am@example.com', '2006-02-25', 'A+', 'Qatar'),
('Oliver', 'Jones', 22, 'B+', 'History', 'oliver.j@example.com', '2004-10-12', 'O-', 'UK'),
('Sofia', 'Bianchi', 21, 'B', 'Data Science', 'sofia.b@example.com', '2005-12-05', 'AB-', 'Italy'),
('Noah', 'Hansen', 20, 'B-', 'Computer Science', 'noah.h@example.com', '2006-06-19', 'O+', 'Denmark'),
('Kofi', 'Mensah', 22, 'C+', 'Mathematics', 'kofi.m@example.com', '2004-02-28', 'B+', 'Ghana'),
('Camila', 'Torres', 24, 'C', 'Physics', 'camila.t@example.com', '2002-09-14', 'A-', 'Colombia'),
('Arjun', 'Patel', 21, 'C-', 'Mechanical Engineering', 'arjun.p@example.com', '2005-04-03', 'O+', 'India'),
('Chloe', 'Wang', 19, 'C+', 'Biochemistry', 'chloe.w@example.com', '2007-11-21', 'AB+', 'China'),
('Leo', 'Virtanen', 23, 'C', 'Economics', 'leo.v@example.com', '2003-08-30', 'B-', 'Finland'),
('Youssef', 'El-Amin', 20, 'D+', 'History', 'youssef.ea@example.com', '2006-10-05', 'O-', 'Egypt'),
('Isabella', 'Rossi', 22, 'D', 'Literature', 'isabella.r@example.com', '2004-01-17', 'A+', 'Italy'),
('Santiago', 'Lopez', 21, 'A+', 'Computer Science', 'santiago.l@example.com', '2005-05-29', 'O+', 'Spain'),
('Freja', 'Nielsen', 20, 'B+', 'Data Science', 'freja.n@example.com', '2006-11-12', 'A-', 'Norway'),
('Hans', 'Gruber', 22, 'C', 'Physics', 'hans.g@example.com', '2004-07-04', 'B+', 'Austria'),
('Mei-Ling', 'Chen', 19, 'A', 'Mathematics', 'meiling.c@example.com', '2007-03-24', 'O-', 'Taiwan'),
('Alexander', 'Volkov', 23, 'F', 'Mechanical Engineering', 'alex.v@example.com', '2003-12-15', 'AB+', 'Russia'),
('Layla', 'Haddad', 21, 'B-', 'Biochemistry', 'layla.h@example.com', '2005-02-10', 'B+', 'Lebanon'),
('William', 'Smith', 20, 'B', 'Economics', 'william.s@example.com', '2006-08-01', 'O+', 'Australia'),
('Ananya', 'Rao', 22, 'A-', 'Literature', 'ananya.rao@example.com', '2004-06-18', 'A+', 'India'),
('Takahiro', 'Tanaka', 21, 'B+', 'Art History', 'takahiro.t@example.com', '2005-10-31', 'O-', 'Japan'),
('Sonia', 'Dubois', 20, 'C+', 'History', 'sonia.d@example.com', '2006-04-20', 'AB-', 'Belgium'),
('Gabriel', 'Barbosa', 22, 'A', 'Data Science', 'gabriel.b@example.com', '2004-09-02', 'O+', 'Brazil'),
('Min-Ho', 'Lee', 19, 'F', 'Computer Science', 'minho.lee@example.com', '2007-05-13', 'A+', 'South Korea'),
('Emma', 'Johnson', 21, 'B', 'Mathematics', 'emma.j@example.com', '2005-11-07', 'B-', 'New Zealand'),
('Dmitry', 'Ivanov', 24, 'C-', 'Physics', 'dmitry.i@example.com', '2002-01-22', 'O+', 'Russia'),
('Zainab', 'Musa', 20, 'A+', 'Biochemistry', 'zainab.m@example.com', '2006-12-28', 'A-', 'Nigeria'),
('Ali', 'Hassan', 22, 'B+', 'Mechanical Engineering', 'ali.hassan@example.com', '2004-03-19', 'AB+', 'Saudi Arabia');

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


--Here we are using LIMIT operator to limit the number of rows returned by the query 
select * from students LIMIT 5;


--Here we are using LIMIT and OFFSET operator to limit the number of rows returned by the query and skip the first 5 rows 
select * from students LIMIT 5 OFFSET 5 * 0;
select * from students LIMIT 5 OFFSET 5 * 1;
select * from students LIMIT 5 OFFSET 5 * 2;
select * from students LIMIT 5 OFFSET 5 * 3;


--Here we are using DELETE operator to delete the data from the table based on condition
Delete from students 
where grade = 'B';

select * from students;

    update students
    set course = 'Cyber Security'
    where student_id = 10; 
select * from students;