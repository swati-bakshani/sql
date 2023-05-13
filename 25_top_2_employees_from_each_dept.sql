Create table Emp_Detail
(
EmpName Varchar(25),
Age int,
Salary Bigint,
Department Varchar(20)
);

Insert into Emp_Detail Values('James',25,25000,'Admin');
Insert into Emp_Detail Values('Robert',33,39000,'Admin');
Insert into Emp_Detail Values('Richard',41,48000,'Admin');
Insert into Emp_Detail Values('Thomas',28,30000,'Admin');
Insert into Emp_Detail Values('Tom',40,55000,'Finance');
Insert into Emp_Detail Values('Donald',35,38000,'Finance');
Insert into Emp_Detail Values('Sara',32,44000,'Finance');
Insert into Emp_Detail Values('Mike',28,25000,'HR');
Insert into Emp_Detail Values('John',35,45000,'HR');
Insert into Emp_Detail Values('Mary',23,30000,'HR');
Insert into Emp_Detail Values('David',32,43000,'HR');

--EmpName,Age,Salary,Department
--Donald,35,38000,Finance
--Richard,41,48000,Admin
--Sara,32,44000,Finance
--Robert,33,39000,Admin
--Thomas,28,30000,Admin
--James,25,25000,Admin
--Tom,40,55000,Finance
--David,32,43000,HR
--John,35,45000,HR
--Mary,23,30000,HR
--Mike,28,25000,HR

WITH top_two AS
(
select empname,salary,age,department,
-- dense_rank is the perfect match as it could have dup records.
dense_rank() over (partition by department order by salary desc) As dense_ranking,
rank() over (partition by department order by salary desc) As ranking,
row_number() over (partition by department order by salary desc) As row_num
from emp_detail
)
select * From top_two
where ranking <=2;
