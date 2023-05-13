Create Table studentinfo(
studentname Varchar(20),
english int,
maths int,
science int);

insert into studentinfo values ('David',85,90,88);
insert into studentinfo values ('John',75,85,80);
insert into studentinfo values ('Tom',83,80,92);

-- table

--studentname,english,maths,science
--David,85,90,88
--John,75,85,80
--Tom,83,80,92

--answer
SELECT studentname,'english' AS 'subjects',english as 'marks' FROM studentinfo
UNION ALL
SELECT studentname,'maths',maths FROM studentinfo
UNION ALL
SELECT studentname,'science',science FROM studentinfo
order by studentname;

