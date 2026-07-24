CREATE Table my_users(
    user_name VARCHAR(50),
    email VARCHAR(100)
);


INSERT INTO my_users (user_name, email) VALUES
('John Smith', 'john.smith@gmail.com'),
('Emma Watson', 'emma.watson@gmail.com'),
('Michael Brown', 'michael.brown@gmail.com'),
('Sophia Davis', 'sophia.davis@gmail.com'),
('William Johnson', 'william.johnson@gmail.com'),
('Olivia Wilson', 'olivia.wilson@gmail.com'),
('James Miller', 'james.miller@gmail.com'),
('Charlotte Moore', 'charlotte.moore@gmail.com'),
('Benjamin Taylor', 'benjamin.taylor@gmail.com'),
('Amelia Anderson', 'amelia.anderson@gmail.com'),
('Lucas Thomas', 'lucas.thomas@gmail.com'),
('Mia Jackson', 'mia.jackson@gmail.com'),
('Henry White', 'henry.white@gmail.com'),
('Evelyn Harris', 'evelyn.harris@gmail.com'),
('Alexander Martin', 'alexander.martin@gmail.com'),
('Harper Thompson', 'harper.thompson@gmail.com'),
('Daniel Garcia', 'daniel.garcia@gmail.com'),
('Abigail Martinez', 'abigail.martinez@gmail.com'),
('Matthew Robinson', 'matthew.robinson@gmail.com'),
('Emily Clark', 'emily.clark@gmail.com'),
('David Lewis', 'david.lewis@gmail.com'),
('Ella Lee', 'ella.lee@gmail.com'),
('Joseph Walker', 'joseph.walker@gmail.com'),
('Grace Hall', 'grace.hall@gmail.com'),
('Samuel Allen', 'samuel.allen@gmail.com'),
('Lily Young', 'lily.young@gmail.com'),
('Christopher King', 'christopher.king@gmail.com'),
('Avery Wright', 'avery.wright@gmail.com'),
('Andrew Scott', 'andrew.scott@gmail.com'),
('Victoria Green', 'victoria.green@gmail.com');



CREATE table deletes_users_audit(
    deleted_user_name VARCHAR,
    deletedAt TIMESTAMP
)


-- This is TRIGGER function 

CREATE OR REPLACE FUNCTION save_del_user()
RETURNS TRIGGER
LANGUAGE plpgsql
as
$$

    BEGIN
            INSERT INTO deletes_users_audit VALUES(OLD.user_name, now());
            RAISE NOTICE 'Save Deleted user Successfully';

            RETURN OLD;
    END

$$



CREATE Trigger save_del_user_trigger
BEFORE DELETE 
ON my_users
FOR EACH ROW
EXECUTE FUNCTION save_del_user();




DELETE FROM my_users
WHERE user_name = 'John Smith';


SELECT * FROM deletes_users_audit;