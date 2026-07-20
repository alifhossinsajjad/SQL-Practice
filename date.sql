SHOW timezone;

select now();

create table timeZone (ts TIMESTAMP WITHOUT time zone , tsz TIMESTAMP WITH time zone);



insert into timeZone values (now(), now());


select * from timeZone;

select CURRENT_DATE;

select now() :: date;
select now() :: time;

select to_char(now(), 'DDD');