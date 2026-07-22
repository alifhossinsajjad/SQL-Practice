SHOW timezone;
select now();
create table timeZone (
    ts TIMESTAMP WITHOUT time zone,
    tsz TIMESTAMP WITH time zone
);
insert into timeZone
values (now(), now());
select *
from timeZone;
select CURRENT_DATE;
select now()::date;
select now()::time;
select to_char(now(), 'DDD');
--how many days in a year
select CURRENT_DATE - INTERVAL '1 year' AS yesterday,
    CURRENT_DATE + INTERVAL '1 year 2 months 5 days' AS tomorrow;
--How many days in a year
select age(current_date, '2005-02-17');
select *
from students;
select *,
    age(current_date, dob) as age
from students;
select extract(
        year
        from age(dob)
    ) as years,
    extract(
        month
        from age(current_date, dob)
    ) as months,
    extract(
        day
        from age(current_date, dob)
    ) as days
from students;