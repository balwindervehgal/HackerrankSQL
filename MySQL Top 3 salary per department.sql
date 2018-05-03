Create table If Not Exists Employee (Id int, Name varchar(255), Salary int, DepartmentId int);
Create table If Not Exists Department (Id int, Name varchar(255));
Truncate table Employee;
insert into Employee (Id, Name, Salary, DepartmentId) values ('1', 'Joe', '70000', '1');
insert into Employee (Id, Name, Salary, DepartmentId) values ('2', 'Henry', '80000', '2');
insert into Employee (Id, Name, Salary, DepartmentId) values ('3', 'Sam', '60000', '2');
insert into Employee (Id, Name, Salary, DepartmentId) values ('4', 'Max', '90000', '1');
insert into Employee (Id, Name, Salary, DepartmentId) values ('6', 'Singh', '160000', '2');
insert into Employee (Id, Name, Salary, DepartmentId) values ('5', 'Andy', '190000', '1');
Truncate table Department;
insert into Department (Id, Name) values ('1', 'IT');
insert into Department (Id, Name) values ('2', 'Sales');



select b.Name Department, a.Name Employee, a.Salary
from Employee a inner join Department b
on a.departmentid = b.id
where (a.departmentid, a.salary)
in
(select departmentid, salary
from employee e
where 3 > (select count(distinct salary) from employee e1 where e.departmentid = e1.departmentid and e1.salary>e.salary)
group by departmentid, salary
order by salary desc )
order by b.Name,a.salary desc



