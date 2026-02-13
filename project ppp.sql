use employee_management_system;
# create 4 tables
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
    
# create trigger for Accounts table insert automatic data after insert in Employees table
DELIMITER //

CREATE TRIGGER create_employee_account
AFTER INSERT ON Employees
FOR EACH ROW
BEGIN
    INSERT INTO Accounts (Emp_ID, Balance) 
    VALUES (NEW.Emp_ID, NEW.New_Salary); 
END //

DELIMITER ;
# create trigger for Accounts table insert automatic data update Salary after update in  Employees table
DELIMITER //

CREATE TRIGGER update_employee_account
AFTER update ON Employees
FOR EACH ROW
BEGIN
    insert into Accounts(Emp_ID,Balance)
    values (New.Emp_ID,NEW.New_Salary); 
END //

DELIMITER ;
# create trigger for Salary_Log table insert automatic data after insert in Employees table
DELIMITER //

CREATE TRIGGER create_employee_salary_log
AFTER INSERT ON Employees
FOR EACH ROW
BEGIN
    INSERT INTO Salary_Log (Emp_ID, Old_Salary,New_Salary,Change_Date) 
    VALUES (NEW.Emp_ID, 0 ,NEW.New_Salary, curdate()); 
END //

DELIMITER ;
# create trigger for Department table insert automatic data after insert in Employees table
DELIMITER //

CREATE TRIGGER create_employee_Department
AFTER INSERT ON Employees
FOR EACH ROW
BEGIN
    INSERT INTO Department (Dept_Name) 
    VALUES (NEW.Department); 
END //

DELIMITER ;

use  employee_management_system;

insert into Employees (Name, Age, New_Salary, Department, Hire_Date)
values('Haji',22,34000,'IT','2024-01-01'),
	('Fouzia',25,55000,'Human Resources (HR)','2024-01-09'),
    ('Ahmed',23,45000,'Finance and Accounting','2024-01-17'),
    ('Hamza',27,78000,'Sales','2024-01-22'),
    ('kamil',30,66000,'Administration (Admin)','2024-01-29'),
    ('Mossa',45,67000,'Customer Service/Support','2024-02-02'),
	('Mahammad',45,67000,'Operations','2024-02-09'),
	('Faiza',35,50000,'Research and Development','2024-02-17'),
    ('Bilal',55,12000,'Legal','2024-02-19'),
    ('Momina',34,56000,'Customer Service/Support','2024-02-27'),
    ('Mossa',46,69000,'Customer Service/Support','2024-03-02'),
    ('Faizan',49,49000,'Legal','2024-03-09'),
    ('Noman',22,50000,'Supply Chain and Logistics','2024-03-15'),
    ('Ayesha',40,70000,'Project Management','2024-03-19'),
    ('Aiman',55,90000,'Business Development','2024-03-26'),
    ('Bushra',18,85000,'IT','2024-03-30'),
    ('Aina',56,56000,'Human Resources (HR)','2024-04-01'),
    ('Ambreen',43,34000,'Finance & Accounting','2024-04-08'),
    ('Sara',24,60000,'Marketing','2024-04-14'),
    ('Imran',20,32000,'Sales','2024-04-18'),
    ('Kiran',56,50000,'Information Technology (IT)','2024-04-25'),
    ('Dolly',19,59000,'Administration','2024-04-29'),
    ('Haniya',70,65000,'Customer Service/Support','2024-05-01'),
    ('Hiba',26,30000,'Operations','2024-05-17'),
    ('Rahim',46,56000,'Legal','2024-05-21'),
    ('Haniya',18,90000,'Research & Development','2024-05-28'),
	('Hadia',36,40000,'Logistics/Supply Chain','2024-06-02'),
    ('Fareeda',26,80000,'Production/Manufacturing','2024-06-16'),
    ('Kareena',76,60000,'Public Relations (PR)/Communications','2024-06-29'),
    ('Mehmood',27,28000,'IT','2024-08-04'),
	('Faiza',21,56000,'Human Resources (HR)','2024-08-18'),
    ('Nubaisha',29,66000,'Finance and Accounting','2024-07-17'),
    ('Nosheen',23,70000,'Sales','2024-08-22'),
    ('kossar',31,69000,'Administration (Admin)','2024-08-28'),
    ('Maryam',49,67000,'Customer Service/Support','2024-09-02'),
	('Kamran',25,37000,'Operations','2024-09-09'),
	('Ibrahim',55,51000,'Research and Development','2024-09-17'),
    ('Bilal',45,15000,'Legal','2024-10-19'),
    ('Mehren',30,58000,'Customer Service/Support','2024-10-27'),
    ('Khuram',36,63000,'Customer Service/Support','2024-11-02'),
    ('Hawama',37,49000,'Legal','2024-11-09'),
    ('Noman',24,51000,'Supply Chain and Logistics','2024-12-15'),
    ('Ayesha',40,71000,'Project Management','2024-12-19'),
    ('Zuleka',55,90000,'Business Development','2025-01-18'),
    ('Bisma',18,86000,'IT','2025-01-30'),
    ('Halima',51,96000,'Human Resources (HR)','2025-04-01'),
    ('Siddiq',43,39000,'Finance & Accounting','2025-05-08'),
    ('Sana',24,60000,'Marketing','2025-06-14'),
    ('Sara',23,32000,'Sales','2025-08-18'),
    ('Kaddu',56,53000,'Information Technology (IT)','2025-04-25'),
    ('Danish',19,59000,'Administration','2025-04-29'),
    ('Humayra',32,65000,'Customer Service/Support','2025-05-01'),
    ('Urosa',26,33000,'Operations','2025-05-17'),
    ('Hadiya',46,56000,'Legal','2025-05-21'),
    ('Haniya',18,90000,'Research & Development','2025-05-28'),
	('Hadia',36,40000,'Logistics/Supply Chain','2025-11-02'),
    ('Fareeda',26,80000,'Production/Manufacturing','2025-07-16'),
    ('Kareena',76,60000,'Public Relations (PR)/Communications','2025-12-29'),
	('Huda',28,50000,'Administration','2026-01-29'),
    ('Humayra',32,65000,'Customer Service/Support','2026-01-01'),
    ('Usama',21,33000,'Operations','2026-02-17'),
    ('Hadiya',46,56000,'Legal','2026-02-21'),
    ('Haniya',18,98000,'Research & Development','2026-01-21'),
	('Hadia',26,44000,'Logistics/Supply Chain','2026-02-02'),
    ('Fouzia',36,82000,'Production/Manufacturing','2026-01-16'),
    ('Farzana',76,61000,'Public Relations (PR)/Communications','2026-01-29');
select * from Salary_Log;
select * from Employees;
select * from Department;
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
