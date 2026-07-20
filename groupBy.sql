select * from students ;



select country , count(*) , avg(age)from students
 group by country ;


 select country, avg(age) from students 
 group by country 
 having avg(age) > 21;

 --count student born in each year
select extract(year from dob) as year, count(*) from students
 group by year
 order by year asc;