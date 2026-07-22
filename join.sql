SELECT *
FROM users;
select *
from posts;
select *
from posts
    right join users on posts.user_id = users.user_id
select *
from posts
    LEFT join users on posts.user_id = users.user_id
select *
from posts
    full join users on posts.user_id = users.user_id;


select * from employees
natural join departments;