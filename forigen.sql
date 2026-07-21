create table users(user_id SERIAL PRIMARY KEY, user_name VARCHAR(100));

insert into users(user_name) values ('Alice'), ('Bob'), ('Charlie'), ('David'), ('Eve');


SELECT * FROM users;

CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY,
     user_id INT REFERENCES users(user_id) on delete CASCADE, 
     content TEXT
     );

INSERT INTO posts (user_id, content) VALUES
(1, 'Learning advanced SQL queries today! Joined queries are fun.'),
(2, 'Just grabbed a large cup of hot coffee and started coding.'),
(3, 'Building a REST API using Node.js and PostgreSQL.'),
(4, 'Does anyone know the best way to optimize database indexes?'),
(5, 'Weekend mode ON! Time to relax and enjoy the evening.'),
(1, 'Git commit, push, and go home. Successfully wrapped up for today!'),
(2, 'Solving complex algorithm challenges on LeetCode.'),
(3, 'Databases are the core backbone of modern web applications.'),
(4, 'Finally fixed that annoying bug that bothered me all week!'),
(5, 'Excited to start learning React and frontend design soon.');

drop table posts;
drop table users; 

select * from posts;


SELECT * FROM posts
WHERE user_id = 1;

SELECT posts.post_id, users.user_name, posts.content 
FROM posts
JOIN users ON posts.user_id = users.user_id
WHERE users.user_name = 'Alice';



delete from users
where user_id = 5;