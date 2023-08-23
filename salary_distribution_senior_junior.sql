drop table candidates;
create table if not exists candidates(
id int primary key,
positions varchar(10) not null,
salary int not null);

--test case 1:
insert into candidates values(1,'junior',5000);
insert into candidates values(2,'junior',7000);
insert into candidates values(3,'junior',7000);
insert into candidates values(4,'senior',10000);
insert into candidates values(5,'senior',30000);
insert into candidates values(6,'senior',20000);

select * from candidates c

with running_total_cte as(
select *, sum(salary) over (partition by positions order by salary,id) as running_total
from candidates
),
-- null handling using coalesce
senior_cte as(
select count(*) as senior, coalesce(sum(salary),0) as s_salary
from running_total_cte
where positions = 'senior'
and running_total<= 50000
),
--select * from senior_cte

junior_cte as(
select count(*) as junior
from running_total_cte
where positions = 'junior'
and running_total<= 50000-(select s_salary from senior_cte)
)
--select * from Junior_cte

select junior,senior
from junior_cte,senior_cte

--test case 2:
delete from candidates;
insert into candidates values(20,'junior',10000);
insert into candidates values(30,'senior',15000);
insert into candidates values(40,'senior',30000);

select * from candidates

--test case 3:
delete from candidates;

insert into candidates values(1,'junior',15000);
insert into candidates values(2,'junior',15000);
insert into candidates values(3,'junior',20000);
insert into candidates values(4,'senior',60000);

select * from candidates

--test case 4:
delete from candidates;
	select * from candidates
insert into candidates values(10,'junior',10000);
insert into candidates values(40,'junior',10000);
insert into candidates values(20,'senior',15000);
insert into candidates values(30,'senior',30000);
insert into candidates values(50,'senior',15000);

