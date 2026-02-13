create database employee_management_system;
create table Accounts(
	ACC_ID INT primary  key auto_increment,
    Emp_ID INT ,
    foreign key (Emp_ID) REFERENCES Employees(Emp_ID) ,
    Balance int );
create table Salary_Log(
	Log_ID int primary key auto_increment,
    Emp_ID INT,
    foreign key (Emp_id) references Employees(Emp_ID),
	Old_Salary int ,
	New_Salary int ,
	Change_Date date );
create table Department(
	Dept_ID int primary key auto_increment,
	Dept_Name varchar (100)
);
create table Employees(
	Emp_ID int primary key auto_increment,
	Name varchar (100),
	Age int ,
	New_Salary int not null,
	Department varchar (50) not null,
	Hire_Date date );
select count(Emp_ID)  from Employees
where New_Salary >=90000;

select distinct Department, Balance from Employees as emp
INNER JOIN Accounts as sal
on emp.Emp_ID= sal.Emp_ID;

select Department,avg(New_Salary),count(Emp_ID),MAX(New_Salary),Min(New_Salary) from Employees
group by Department
Having Department ='IT' ; 
insert into Employees (Name,Age,New_Salary,Department,Hire_Date)
values('Fariyal',23,18000,'IT','2026-02-10');

select count(Emp_ID) from Employees
where month(Hire_Date)= '2' and year(Hire_Date)= '2026';

SHOW DATABASES;
USE Employee_Management_System;
SHOW TABLES;
DESC Employees;
DESC Department;
SELECT * FROM Employees ORDER BY New_Salary DESC;
update Employees
set New_Salary = 91000
where Emp_ID =82;
SELECT *  FROM Accounts where Emp_ID =82;
insert into Employees (Name,Age,New_Salary,Department,Hire_Date) values ('Faaz',75,64000,'Public Relations (PR)/Communications','2026-02-14');
select *  from Employees;
select * from Accounts;
update Employees
set New_Salary=61000
where Emp_ID = 135;
SELECT Name, New_Salary
FROM Employees
WHERE  New_Salary > (SELECT AVG( New_Salary) FROM Employees);
START TRANSACTION;

UPDATE Employees
SET New_Salary = New_Salary + 2000
WHERE Emp_ID = 68;

COMMIT;

SELECT * FROM Salary_Log WHERE  Emp_ID = 68;
