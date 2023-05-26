--Creating database
Create database EmployeeManagement

--Create Department Table in EmployeeManagement database
create table Department
(
  Dept_No int Primary Key not null,
  DName varchar(50) not null,
  City varchar(100) not null,  
)
--Insert data into Department Table
insert into department(Dept_No,DName,City) values(10,'HR','Pune')
insert into department(Dept_No,Dname,City) values(20,'Operations','Nagpur'),(30,'Developer','Bangaluru'),
(40,'Testing','Hyderabad'),(50,'Finance','Mumbai')

--Creating employee table
create table Employee
(
 Emp_Id int primary key not null,
 EName varchar(50) not null,
 Gender varchar(6),
 Age int ,
 Emp_email varchar(100) not null,
 Contact_No char(10),
 Dept_No int not null,
)

--alter table to make column not null
alter table employee
alter column Contact_No char(10) not null

--alter table to add foreign Key 
alter table employee 
add foreign key (Dept_No) references department(Dept_No)

alter table Employee
drop constraint [FK__Employee__Dept_N__3F466844]

alter table tablename
add columnName varchar(50)

--Inserting value into employee table

insert into Employee(Emp_Id,EName,Gender,Age,Emp_email,Contact_No,Dept_No)
values(101,'Anvesh Patil','Male',27,'anvesh.patil@gmail.com',7894561230,40),
(102,'Satish Akula','Male',26,'satishakula@gmail.com',9875468120,30),
(103,'Pavan Jawlekar','Male',23,'pavan123@gmail.com',7654891233,20),
(104,'Aniket Radke','Male',23,'aniket.rakde@gmail.com',7845691239,20),
(105,'Rushi Kumar','Male',24,'rushi.kumar123@gmail.com',7812345981,50),
(106,'Prashant Tulsigari','Male',24,'prashant09@gmail.com',9648756124,50),
(107,'Veda Shewalkar','Female',23,'vedashewalkar@gmail.com',8945761287,10),
(108,'Shruti Demana','Female',26,'shrutidemana96@gmail.com',8879445512,40),
(109,'Dinesh Allad','Male',24,'dineshallad43@gmail.com',7845997781,20),
(110,'Naveen Bhandari','Male',24,'naveen.bhandar@gmail.com',6547891235,10),
(111,'Naval Bhandari','Male',24,'naval.bhandari@gmail.com',8877994611,40),
(112,'Nagesh Neelam','Male',25,'neelamnagesh009@gmail.com',6547788112,30),
(113,'Aman Pawar','Male',24,'amanchakinarapu@gmail.com',7745864189,30),
(114,'Ganesh Bachalkura','Male',28,'ganesh89@gmail.com',9845617286,10),
(115,'Anusha Joshi','Female',23,'anusha.joshi@gmail.com',7844445697,10),
(116,'Shruti Tiwari','Female',25,'shruti.tiwari@gmail.com',9956233417,30),
(117,'Prithviraj Shivakumar','Male',30,'prithvi@gmail.com',8884446699,50),
(118,'Archana Gouda','Female',28,'archanagouda@gmail.com',7894567548,50),
(119,'Samiksha Singh','Female',25,'samiksha441@gmail.com',8866614286,40),
(120,'Daniel Shekar','Male',27,'shekardanny@gmail.com',6489751238,40),
(121,'Ajay Rathod','Male',26,'ajayrathod221@gmail.com',9856471247,20),
(122,'Vicky Chavan','Male',24,'vicky.chavan@gmail.com',9787654783,20),
(123,'Kiran Madavi','Female',24,'kiran.madavi@gmail.com',6547897898,40),
(124,'Sahithi Molguri','Female',24,'sahithi789@gmail.com',8975612877,50),
(125,'Akash Ghugal','Male',23,'akash.ghugal@gmail.com',9445876123,30);


alter table Employee
alter column Age varchar(2)

alter table employee
alter column Age int
 
--Creating table Payroll
create table Payroll
(
 Salary_Id int not null primary key,
 Emp_Id int not null foreign key references employee(Emp_Id),
 Dept_No int not null foreign key references Department(Dept_No),
 Salary money not null check(salary > 0 AND salary <= 300000)
)

--inserting values into payroll
insert into Payroll(Salary_Id,Emp_Id,Dept_No,Salary) 
values(1101,101,40,90000),(1102,102,30,120000),(1103,103,20,35000),(1104,104,20,30000),(1105,105,50,50000),
(1106,106,50,60000),(1107,107,10,30000),(1108,108,40,40000),(1109,109,20,35000),(1110,110,10,40000),
(1111,111,40,45000),(1112,112,30,80000),(1113,113,30,90000),(1114,114,10,60000),(1115,115,10,30000),
(1116,116,30,55000),(1117,117,50,150000),(1118,118,50,70000),(1119,119,40,40000),(1120,120,40,85000),
(1121,121,20,35000),(1122,122,20,40000),(1123,123,40,45000),(1124,124,50,50000),(1125,125,30,60000)

alter table payroll
drop column PF  

select * from Payroll

alter table payroll
add PF float  null

 update Payroll
 set PF= 5000
 where Emp_Id=124;

 alter table Payroll
 add Bonous float 

 update Payroll
 set Bonous=4000
 where Emp_ID=116

begin Tran
Update Payroll
set salary=100000
where Emp_Id=101

begin tran
EXEC SP_Rename 'Employee.Emp_Id','EmpID','Column'

rollback 

--create table Alloted Equipments 
create table Equipments
(
 Eq_ID int primary key not null,
 Dept_No int not null foreign key references Department(Dept_No),
 Laptop varchar(3) ,
 LaptopCharger varchar(3),
 Headset varchar(3),
 Mouse varchar(3),
 Pendrive varchar(3),
 Router varchar(3) 
)

--inserting data into Equipments table
insert into Equipments(Eq_ID,Dept_No,Laptop,LaptopCharger,Headset,Mouse,Pendrive,Router)
values(1,10,'Yes','Yes','Yes','No','No','No'),
(2,20,'Yes','Yes','Yes','Yes','Yes','No'),
(3,30,'Yes','Yes','Yes','Yes','No','Yes'),
(4,40,'Yes','Yes','Yes','yes','NO','Yes'),
(5,50,'Yes','Yes','Yes','yes','No','Yes')


--Creating table Employees working in Project1
Create table Project1
(
Id varchar(5) not null primary key,
Emp_Id int not null  foreign key (Emp_Id) references Employee(Emp_Id),
Dept_No int not null foreign Key (Dept_No) references Department(Dept_No),
)

--inserting values into Project1
insert into Project1(Id,Emp_Id,Dept_No) values('P-01',101,40),('P-02',102,30),('P-03',103,20),('P-04',104,20),('P-05',105,50),
('P-06',106,50),('P-07',107,10),('P-08',108,40),('P-09',110,10),('P-10',111,40)

--creating table employee working in Project2
Create table Project2
(
Id varchar(10) not null primary key,
Emp_Id int not null  foreign key (Emp_Id) references Employee(Emp_Id),
Dept_No int not null foreign Key (Dept_No) references Department(Dept_No),
)

--inserting values into Project2
insert into Project2(Id,Emp_Id,Dept_No) values('P2-01',109,20),('P2-02',112,30),('P2-03',113,30),('P2-04',120,40),('P2-05',118,50),
('P2-06',116,30),('P2-07',117,50),('P2-08',122,20),('P2-09',123,40),('P2-10',114,10)

select * from Department
select * from Employee
select * from Payroll
select * from Equipments
select * from Project1
select * from Project2

select * from Employee Right outer join Payroll
on Employee.Emp_Id=Payroll.Emp_Id


select count(*)
from Employee

select count(*)
from Employee
where Dept_No=40

select count(*)
from Payroll
where salary>30000 AND salary < 70000

select sum(Salary)
from Payroll

select sum(Salary),Dept_No
from Payroll
where salary>50000
Group By Dept_No

select Max(salary)
from payroll

select Max(salary)
from payroll
where Dept_No=40

select Avg(Salary),Dept_No
from Payroll
Group by Dept_No

Select UPPER(Emp_Email)
from Employee

Select LOWER(Ename)
from Employee

select Emp_Email,Len(Emp_Email)
from Employee

select Ename,Employee.Dept_No,GETDATE()
from Employee,Department

create function GetEmployee()
Returns table
As
Return (Select * from Employee)

create function UpdateDepartment()
Returns  @Department table
(Dept_No int,DName varchar(50),City varchar(50)) 
AS
Begin
insert into @Department
Select Department.Dept_No,Department.DName,Department.City From Department 
Update @Department Set Dept_No=100,DName='FullStack Developer',City='Hyderabad' where Dept_No=30
Return 
End

create function Addition(
@Num1 int,
@Num2 int
)
Returns int
As
Begin
return @Num1+@Num2
End
 
create function Concate(
@sentence varchar(50),
@sentence2 varchar(50)
)
Returns varchar(100)
As
Begin
return @sentence+@sentence2
End

select dbo.Addition(1000,2000) As Sum
select dbo.Concate('Hello World',' Welcome') As Concatination


select * from UpdateDepartment()
select * from Department
select * From GetEmployee()
drop function UpdateDepartment


select* From Employee


select Ename,Avg(salary),sum(12*salary) as annualSalary
from Employee,Payroll


select  difference('JoiningDate',getdate()) 
as experience from employee

select Ename,SUBSTRING(Ename,3,6)
from employee
where EName='Anvesh Patil'

select concat(Ename,Emp_Email) as fullName
from Employee

select  max(Len(EName)) as NameLength
from Employee

select Month(getdate()) as months
from Employee
select Year(getdate())
from Employee


create function Fn_NumberSquare(@Num int)
returns int
As
Begin
Return ( @Num*@Num)
End

create function Fn_Division(@Num1 int,@Num2 int,@Num3 int)
returns float
As 
Begin
Return ((@Num1 / @Num2 )/@Num3)
End

select dbo.Fn_Division(100,10,5) as AfterDivision
Select dbo.Fn_NumberSquare(25) as SquareValue

create function Fn_CheckVotersEligibility(@Num int)
returns varchar(100)
As 
Begin
 declare @str varchar(100)
 if @num >= 18
 Begin
     set @str='You Are eligible for voting' 
 End
 else
 Begin
    set @str='Candidate is not eligible for voting'
 End
 return @str
End

select dbo.Fn_CheckVotersEligibility(52)
select dbo.Fn_CheckVotersEligibility(15)



select * from Employee left outer join Payroll
on Employee.Emp_Id=Payroll.Emp_Id

select * from Department Left outer join Payroll
on Department.Dept_No=Payroll.Dept_No

select * from Employee full outer join Equipments
on Employee.Dept_No=Equipments.Dept_No

select * from Department full outer join Equipments
on Department.Dept_No=Equipments.Dept_No

select * from Employee left outer join Project1
on Employee.Emp_Id=Project1.Emp_Id

select * from Employee right outer join Project1
on Employee.Emp_Id=Project1.Emp_Id

select * from Employee left outer join Project2
on Employee.Emp_Id=Project2.Emp_Id

select * from Employee inner join Project1
on Employee.Emp_Id=Project1.Emp_Id

create index In_NumberIndex
on Payroll(salary asc)

select * from Payroll
where salary > 40000 and salary<100000

drop index In_NOIndex on Payroll

create index IN_dpetNo
on Employee(Dept_no asc)

select * from Employee
where Dept_no >=40


stored procedure, views and CTE



select Employee.Dept_No,count(Emp_Id) 
from Employee INNER jOIN Department
on Department.Dept_No=Employee.Dept_No
group by Employee.dept_No

select Ename,min(hiredate) as earlisthiredate,department 
from employee left outer join Departments
on Department.DepartmentID=Employee.DepartmentID

select 

--Stored Procedure

Create PROCEDURE spEmployeeDepartment
@City varchar(50),@Dept_No int
As
Begin
select * From Department 
where City= @City AND Dept_No=@Dept_No 
End

Create PROCEDURE spEmployeeDetails
@Dept_No int
As
Begin
select * From Employee 
where  Dept_No=@Dept_No 
End

EXEC spEmployeeDetails @Dept_No=30
EXEC spEmployeeDepartment @City=Nagpur,@Dept_No=20

Drop procedure spEmployeeDetails
Drop procedure spEmployeeDepartment

create Procedure spTableDetails
As
Begin
select * From Employee
Select * from Department
select * from Payroll
End
Exec spTableDetails

--stored procedure with try catch block
create procedure spDivision
(@num1 decimal,@num2 decimal,@num3 decimal,@sum decimal output)
As
Begin 
 Begin try
    set @sum=(@num1/@num2)/@num3 
 end try
 Begin Catch
      Select 
	    ERROR_LINE() as ErrorLine, --returns the line number on which exception occured
		ERROR_Number() as ErrorNumber, --return the number of the error that occured
		ERROR_MESSAGE() as ErrorMessage, --return the complete text of the generated error message
		ERROR_PROCEDURE() as ErrorProcedure, --returns the stored procedure or trigger where the error occured
		ERROR_SEVERITY() as ErrorSeverity,  --returns the severity level of the error that occured
		ERROR_STATE() as ErrorState --returns the state number of the error that occured

 End Catch
End

Declare @result decimal
Exec spDivision 130,65,0, @result output;
Print @result

drop procedure spDivision

--creating views

create view EmployeeDeptNo
As
select Ename,Dept_No
from Employee
where Dept_No<30

create view EmpPayroll
As
Select Employee.Emp_Id,ename,salary
from Payroll inner join Employee
on payroll.Emp_Id=Employee.Emp_Id and salary < 50000

drop view EmpPayroll
select * from EmpPayroll
select *  from EmployeeDeptNo

--creating CTE
 
 with New_CTE
 as
 (
   select * from Employee where gender='Male' --CTE Defination
 ) 
 select * from New_CTE  --use insert,delete,select,update immediately after creating CTE if not used CTE will be destroyed

 drop with New_CTE

  with New_CTE
 as
 (
   select * from Employee where gender='Male'
 ) 
 select * from New_CTE where age >=26

  with New_CTE(Emp_Id,EName,Gender,Age,DeptNo)
 as
 (
   select Emp_Id,Ename,Gender,Age,Dept_No from Employee where gender='Male'
 ) 
 select Emp_Id,Ename,Gender,Age,DeptNo from New_CTE


 with New_CTE
 as
 (
   select * from Employee 
 ) 
 insert New_CTE values(126,'Naresh J','Male',23,'naresh123@gmail.com',6547891234,20)
 select * from New_CTE


 select * from Employee