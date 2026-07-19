-- Active: 1783948992845@@127.0.0.1@5432@ph
SELECT * FROM  person;



ALTER TABLE person 
DROP COLUMN email;



INSERT INTO person 
VALUES (DEFAULT, 'John', 'Doe', 30, TRUE, '1999-04-06');