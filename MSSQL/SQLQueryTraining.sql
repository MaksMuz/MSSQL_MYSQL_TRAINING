--create table EmployeeDemographics
--(
--EmployeeID int,
--FirstName varchar(50),
--LastName varchar(50),
--Age int,
--Gender varchar(50)
--)

--create table EmployeeSalary
--(
--EmployeeID int,
--JobTitle varchar(50),
--Salary int
--)

--insert into EmployeeDemographics values
--(1, 'Harry', 'Potter', 15, 'Male'),
--(2, 'Lord', 'Voldemort', 32,'Male'),
--(3, 'Hermione', 'Granger', 15, 'Female'),
--(4, 'Ron', 'Weasley', 15, 'Male'),
--(5, 'Albus', 'Dumbledore', 115, 'Male'),
--(6, 'Severus', 'Snape', 38, 'Male'),
--(7, 'Sirius', 'Black', 35, 'Male'),
--(8, 'Rubeus', 'Hagrid', 60, 'Male'),
--(9, 'Draco', 'Malfoy', 15, 'Male'),
--(10, 'Minerva', 'McGonagall', 70, 'Female'),
--(11, 'Luna', 'Lovegood', 14, 'Female'),
--(12, 'Ginny', 'Weasley', 14, 'Female'),
--(13, 'Neville', 'Longbottom', 15, 'Male'),
--(14, 'Remus', 'Lupin', 36, 'Male'),
--(15, 'Bellatrix', 'Lestrange', 47, 'Female')

--insert into EmployeeSalary values
--(1, 'sorcerer', 4000),
--(2, 'wizard', 24000),
--(3, 'junior sorcerer', 2000),
--(4, 'junior sorcerer', 1500),
--(5, 'director', 52000),
--(6, 'teacher', 6200),
--(7, 'master sorcerer', 8300),
--(8, 'forester', 6100),
--(9, 'junior wizard', 1000),
--(10, 'professor', 12300)

--select * from EmployeeDemographics

--select FirstName from EmployeeDemographics

--select FirstName, Age from EmployeeDemographics

--select top 3 * from EmployeeDemographics

--select distinct(Age) from EmployeeDemographics --show the unique values

--select distinct(EmployeeID) from EmployeeDemographics --show the unique values

--select distinct(Salary) from EmployeeSalary

--select count(LastName) from EmployeeDemographics

--select count(LastName) as LastNameCount from EmployeeDemographics

--select min(Salary) as LowestSalary from EmployeeSalary

--select max(Salary) as HighestSalary from EmployeeSalary

--select avg(Salary) as AverageSalary from EmployeeSalary

--select * from SQLTutorial.dbo.EmployeeSalary

--
--Where statement =, <>, <, >,And, Or, Like, Null, Not Null, In --
--

--select * from EmployeeDemographics
--where FirstName <> 'Harry'

--select * from EmployeeDemographics
--where FirstName = 'Harry'

--select * from EmployeeDemographics
--where Age < 30

--select * from EmployeeDemographics
--where Age <= 15

--select * from EmployeeDemographics
--where Age <= 15 and Gender = 'Male'

--select * from EmployeeDemographics
--where Age <= 14 OR Gender = 'Male'

--select * from EmployeeDemographics
--where FirstName like 'Harry'

--select * from EmployeeDemographics
--where FirstName like 'H%'

--select * from EmployeeDemographics
--where FirstName like '%N%'

--select * from EmployeeDemographics
--where FirstName like 'S%'

--select * from EmployeeDemographics
--where FirstName like 'S%v%'

--select * from EmployeeDemographics
--where FirstName is not null

--select * from EmployeeDemographics
--where FirstName is null

--select * from EmployeeDemographics
--where FirstName in ('Harry', 'Sirius')

--
-- GROUP BY, ORDER BY --
--

--select Gender from EmployeeDemographics
--group by Gender

--select Gender, count(Gender) as GenderCount from EmployeeDemographics
--group by Gender

--select Gender, Age, count(Gender) as GenderCount from EmployeeDemographics
--group by Gender, Age -- we get the count of male or female into group ages.Example. 1 female into age 15 and 4 male into age 15

--select Gender, count(Gender) as GenderCount from EmployeeDemographics
--where Age < 20
--group by Gender

--select Gender, count(Gender) as GenderCount from EmployeeDemographics
--where Age < 20
--group by Gender
--order by GenderCount -- default ASC

--select Gender, count(Gender) as GenderCount from EmployeeDemographics
--where Age < 20
--group by Gender
--order by GenderCount DESC -- from highest to lowest

--select * from EmployeeDemographics
--order by Age

--select * from EmployeeDemographics
--order by Age DESC

--select * from EmployeeDemographics
--order by 4 DESC

--
-- inner joins, full/left/right outer joins --
--

--inner join - czesc wspolna
-- left outer join -czesc wspolna i lewy zbior czyli tak naprawde zbior A
-- right outer join - czesc wspolna i prawy zbior czyli tak naprawde zbior B
-- full outer join - zbior A lub B

--insert into EmployeeDemographics values
--(75, 'Obi-wan', NULL, 40, 'Male'),
--(NULL, 'Anakin', 'Skywalker', NULL, NULL),
--(77, 'Leia', 'Organa', NULL, 'Female'),
--(NULL, 'Kylo', 'Ren', NULL, 'Male')

--insert into EmployeeSalary values
--(502, 'jedi', NULL),
--(NULL, 'master jedi', 24000),
--(321, NULL, 2000)

--select * from EmployeeDemographics

--select * from EmployeeSalary

--select * from EmployeeDemographics
--inner join EmployeeSalary
--	on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--select * from EmployeeDemographics
--full outer join EmployeeSalary
--	on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--select * from EmployeeDemographics
--left outer join EmployeeSalary
--	on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--select EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary from EmployeeDemographics -- without EmployeeDemographics or EmployeeSalary behind the id it doesnt work
--right outer join EmployeeSalary
--	on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--select EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary from EmployeeDemographics
--inner join EmployeeSalary
--	on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--where FirstName <> 'Lord'
--order by Salary DESC

--select JobTitle, avg(Salary) from EmployeeDemographics
--inner join EmployeeSalary
--	on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--where JobTitle = 'junior sorcerer'
--group by JobTitle

--
-- union, union all --
--

--create table WareHouseEmployeeDemographics
--(
--EmployeeID int,
--FirstName varchar(50),
--LastName varchar(50),
--Age int,
--Gender varchar(50)
--)

--insert into WareHouseEmployeeDemographics values
--(1, 'Harry','Potter', 15, 'Male'),
--(2, 'Lord', 'Voldemort', 32, 'Male'),
--(98, 'Darth', 'Maul', NULL, 'Male'),
--(99, 'Han', 'Solo', 55, 'Male')

--select * from EmployeeDemographics
--full outer join WareHouseEmployeeDemographics
--	on EmployeeDemographics.EmployeeID = WareHouseEmployeeDemographics.EmployeeID

--select * from EmployeeDemographics
--union
--select * from WareHouseEmployeeDemographics

--select * from EmployeeDemographics
--union all
--select * from WareHouseEmployeeDemographics
--order by EmployeeID

--
-- CASE STATEMENT --
--

--select FirstName, LastName, Age,
--case
--	when Age > 40 then 'old'
--	when Age between 30 and 40 then 'middle'
--	else 'young'
--end
--from EmployeeDemographics
--where Age is not null
--order by Age

--select FirstName, LastName, Age, -- wrong
--case
--	when Age > 40 then 'old'
--	when Age between 30 and 40 then 'middle'
--	when Age = 40 then 'jedi'
--	else 'young'
--end
--from EmployeeDemographics
--where Age is not null
--order by Age

--select FirstName, LastName, Age, -- good
--case
--	when Age = 40 then 'jedi'
--	when Age > 40 then 'old'
--	when Age between 30 and 40 then 'middle'
--	else 'young'
--end
--from EmployeeDemographics
--where Age is not null
--order by Age

--select FirstName, LastName, JobTitle, Salary,
--case
--	when JobTitle = 'director' then Salary + (Salary * .25)
--	when JobTitle = 'teacher' then Salary + (Salary * .20)
--	when JobTitle = 'professor' then Salary + (Salary * .20)
--	when JobTitle = 'junior wizard' then Salary + (Salary * .15)
--	else Salary + (Salary * .10)
--end as AnnualBonus
--from EmployeeDemographics
--join EmployeeSalary
--	on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--
-- having clause --
--

--select JobTitle, count(JobTitle) from EmployeeDemographics
--join EmployeeSalary
--	on EmployeeDemographics.employeeID = EmployeeSalary.employeeID
--group by JobTitle
--having count(JobTitle) > 1

--select JobTitle, avg(Salary) from EmployeeDemographics
--join EmployeeSalary
--	on EmployeeDemographics.employeeID = EmployeeSalary.employeeID
--group by JobTitle
--having avg(Salary) > 10000
--order by avg(Salary)

--
-- UPDATING/DELETING DATA --
--

--select * from EmployeeDemographics

--update EmployeeDemographics
--set EmployeeID = 16, LastName = 'Kenobi'
--where FirstName = 'Obi-wan' and Age = 40

--update EmployeeDemographics
--set EmployeeID = 17, Age = 20, Gender = 'Male'
--where FirstName = 'Anakin' and LastName = 'Skywalker'

--insert into EmployeeDemographics values
--(20, 'Fake Kylo', 'Fake Ren', 30, 'Male')

--delete from EmployeeDemographics
--where FirstName = 'Fake Kylo'

--
-- Aliasing --
--

--select FirstName as Name from EmployeeDemographics

--select FirstName + ' ' + LastName as FullName from EmployeeDemographics

--select Demo.FirstName as Name from EmployeeDemographics as Demo
--join EmployeeSalary as Sal
--	on Demo.EmployeeID = Sal.EmployeeID

--select Demo.EmployeeID, Sal.Salary from EmployeeDemographics as Demo
--join EmployeeSalary as Sal
--	on Demo.EmployeeID = Sal.EmployeeID

--select Demo.EmployeeID, Demo.FirstName + ' ' + Demo.LastName as FullName, Sal.JobTitle, Sal.Salary, Ware.Age from EmployeeDemographics as Demo
--left join EmployeeSalary as Sal
--	on Demo.EmployeeID = Sal.EmployeeID
--left join WareHouseEmployeeDemographics as Ware
--	on Demo.EmployeeID = Ware.EmployeeID

--
-- Partition By -> podzial wedlug --
--

--select * from EmployeeDemographics

--select * from EmployeeSalary

-- this makes these two queries into one
--select FirstName, LastName, Gender, Salary, count(Gender) over (partition by Gender) as TotalGender from EmployeeDemographics dem
--join EmployeeSalary sal
--	on dem.EmployeeID = sal.EmployeeID

---- these two queries below
--select Gender, count(Gender) from EmployeeDemographics dem
--join EmployeeSalary sal
--	on dem.EmployeeID = sal.EmployeeID
--group by Gender

--select Customercity, count(Customercity) from Orders
--group by Customercity

--select Customercity,
--	min(Orderamount) as MinimumAmount,
--	max(Orderamount) as MaximumAmount,
--	avg(Orderamount) as AverageAmount,
--	sum(Orderamount) as TotalOrderAmount
--from Orders 
--group by Customercity

--select Customercity, CustomerName, OrderAmount, -- wrong idea
--	min(Orderamount) as MinimumAmount,
--	max(Orderamount) as MaximumAmount,
--	avg(Orderamount) as AverageAmount,
--	sum(Orderamount) as TotalOrderAmount
--from Orders 
--group by Customercity

--select Customercity, CustomerName, Orderamount, -- good idea
--	min(Orderamount) OVER(PARTITION BY Customercity) AS MinimumAmount,
--	max(Orderamount) OVER(PARTITION BY Customercity) AS MaximumAmount,
--	avg(Orderamount) OVER(PARTITION BY Customercity) AS AverageAmount,
--	sum(Orderamount) OVER(PARTITION BY Customercity) AS TotalOrderAmount
--from Orders

--
-- Common table expression --
--

--with cte_employee as
--(
--select FirstName, LastName, Gender, JobTitle, Salary,
--count(Gender) over (partition by Gender) as TotalGender,
--avg(Salary) over (partition by Gender) as AvgSalary
--from EmployeeDemographics demo 
--join EmployeeSalary sal
--	on demo.EmployeeID = sal.EmployeeID
--)
--select * from cte_employee

-- 
-- Temp Tables --
--

--create table #temp_Employee (
--EmployeeID int,
--JobTitle varchar(100),
--Salary int
--)

--select * from #temp_Employee

--insert into #temp_Employee values
--(1001, 'HR', 4500)

--insert into #temp_Employee
--select * from EmployeeSalary

--drop table if exists #temp_eployee2
--create table #temp_eployee2(
--JobTitle varchar(50),
--EmployeesPerJob int,
--AvgAge int,
--AvgSalary int
--)

--insert into #temp_eployee2
--select JobTitle, count(JobTitle), avg(Age), avg(Salary) from EmployeeDemographics emp
--join EmployeeSalary sal
--	on emp.EmployeeID = sal.EmployeeID
--group by JobTitle

--select * from #temp_eployee2

--create table CheckEmployee (
--JobTitle varchar(50),
--EmployeesPerJob int,
--AvgAge int,
--AvgSalary int
--)

--insert into CheckEmployee
--select * from #temp_eployee2

--select * from CheckEmployee

--drop table if exists CheckEmployee

--
-- String Functions - TRIM, LTRIM, RTRIM, REPLACE, SUBSTRING, UPPER, LOWER --
--

--drop table if exists EmployeeErrors;

--create table EmployeeErrors (
--EmployeeID varchar(50),
--FirstName varchar(50),
--LastName varchar(50)
--)

--Insert into EmployeeErrors values
--('1001  ', 'Jimbo', 'Dimbo'),
--('   1002', 'Bimbo', 'Limbo'),
--('1005', 'TrEmEnDoLuS', 'Wikodinus - Mefedroniusz')

--select * from EmployeeErrors

--select EmployeeID, trim(EmployeeID) as IDTRIM 
--from EmployeeErrors

--select EmployeeID, ltrim(EmployeeID) as IDLTRIM 
--from EmployeeErrors

--select EmployeeID, rtrim(EmployeeID) as IDRTRIM 
--from EmployeeErrors

--select LastName, replace(LastName, ' - Mefedroniusz', '') as LastNameFixed
--from EmployeeErrors

--select substring(FirstName,4,2) from EmployeeErrors

--select * 
--from EmployeeErrors err
--join EmployeeDemographics dem
--	on err.FirstName = dem.FirstName

--select err.FirstName, substring(err.FirstName,1,3), dem.FirstName, substring(dem.FirstName,1,3)
--from EmployeeErrors err
--join EmployeeDemographics dem
--	on substring(err.FirstName,1,3) = substring(dem.FirstName,1,3)

--select FirstName, lower(FirstName) as lowercaseNames
--from EmployeeErrors


--select FirstName, upper(FirstName) as uppercaseNames
--from EmployeeErrors

--
--
-- STORED PROCEDURES --
--
--

--create procedure test
--as
--select * from EmployeeDemographics

--exec test

--create procedure Temp_Employee
--as
--create table #temp_employee (
--JobTitle varchar(100),
--EmployeesPerJob int,
--AvgAge int,
--AvgSalary int
--)

--Insert into #temp_employee
--select JobTitle, count(JobTitle), avg(Age), avg(Salary)
--from EmployeeDemographics emp
--join EmployeeSalary sal
--	on emp.EmployeeID = sal.EmployeeID
--group by JobTitle

--Select * 
--from #temp_employee

--EXEC Temp_Employee

--create procedure Temp_Employee2
--@JobTitle nvarchar(100)
--as
--create table #temp_employee (
--JobTitle varchar(100),
--EmployeesPerJob int,
--AvgAge int,
--AvgSalary int
--)

--Insert into #temp_employee
--select JobTitle, count(JobTitle), avg(Age), avg(Salary)
--from EmployeeDemographics emp
--join EmployeeSalary sal
--	on emp.EmployeeID = sal.EmployeeID
--where JobTitle = @JobTitle
--group by JobTitle

--Select * 
--from #temp_employee

--EXEC Temp_Employee2 @JobTitle = 'junior wizard'

--
--
-- subqueries ( in the select, from, and where statement )
--
--

-- subquery in the select

--select EmployeeID, Salary, (select avg(Salary) from EmployeeSalary) as AllAvgSalary from EmployeeSalary

-- how to do it with partition by

--select EmployeeID, Salary, avg(Salary) over () from EmployeeSalary

--why group by doesnt work

--select EmployeeID, Salary, avg(Salary) from EmployeeSalary
--group by EmployeeID, Salary
--order by 1,2

--subquery in From

--select a.employeeID, AllAvgSalary
--from (select EmployeeID, Salary, avg(Salary) over () as AllAvgSalary from EmployeeSalary) a

-- subquery in Where

--select EmployeeID, JobTitle, Salary
--from EmployeeSalary
--where EmployeeID in (
--	select EmployeeID
--	from EmployeeDemographics
--	where Age > 15)