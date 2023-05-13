Create Table Employee_1(
EmployeeID Varchar(20),
EmployeeName Varchar(20),
ManagerID varchar(20));

Insert Into Employee_1 Values(100,'Mark',103);
Insert Into Employee_1 Values(101,'John',104);
Insert Into Employee_1 Values(102,'Maria',103);
Insert Into Employee_1 Values(103,'Tom',NULL);
Insert Into Employee_1 Values(104, 'David',103);

select Emp.employeename, Mng.employeename As manager_name from employee_1 as Emp
inner join employee_1 as Mng
ON emp.managerID = Mng.employeeID;