-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 03: Implementation of different types of SQL functions.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: 
-- USN: 
-- SECTION: 
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
/*'root@localhost', 'RVU-PC-0022', '8.4.6', '2025-09-08 11:21:32'
*/

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- PreCoded Relational Schema and Instance.
-- -----------------------------------------------------------------------------------------------------------------------------------------
create database office;
use office;
-- 1. create a table named Employee with EmpID ,FirstName,LastName Salary BirthDate HireDate 
create table employee(
empID varchar(10) Primary key,
firstname varchar(15),
lastname varchar(15),
salary int,
birthdate date,
hiredate date);

-- 2. Insert 10 records to employee;
insert into employee values('2025001','Abhay','Biju',100000,'2025-01-10', '2024-08-01');
insert into employee values('2025002','Abinand','Biju',200000,'2025-04-01', '2024-07-01');
insert into employee values('2025003','Akshatha','B.S',300000,'2025-09-01', '2024-06-01');
insert into employee values('2025004','Jahnavi','Palya','400000','2025-10-01', '2024-05-01');
insert into employee values('2025005','Laxman','Bhatt',500000,'2025-07-01', '2024-04-01');
insert into employee values('2025006','Gaurav','Rao',700000,'2025-08-01', '2024-04-01');
insert into employee values('2025007','Neel','Choudary',800000,'2025-06-01', '2024-02-01');
insert into employee values('2025008','Prahlad','Bhat',900000,'2025-03-01', '2024-01-01');
insert into employee values('2025009','Varun','Mudaliar',1000000,'2025-05-01', '2024-05-01');
insert into employee values('2025010','Aryan','Biju',1000000,'2025-07-01', '2024-07-01');
-- 3. create a table named Orders with OrderID , OrderDate, totalAmount, EmpID(foreign key)  
create table orders(
orderID varchar(10) primary key,
orderdate date,
totalamt int,
empID varchar(10),
	FOREIGN KEY (empID) 
	 REFERENCES employee (empID)
);
-- 4. Insert 10 records to Orders
insert into orders values('O2501','2023-08-12','50000','2025009');
insert into orders values('O2502','2025-05-01','50000','2025010');
insert into orders values('O2503','2025-03-01','50000','2025004');
insert into orders values('O2504','2025-07-01','50000','2025007');
insert into orders values('O2505','2025-02-01','50000','2025005');
insert into orders values('O2506','2025-01-01','50000','2025003');
insert into orders values('O2507','2025-07-01','50000','2025008');
insert into orders values('O2508','2025-08-01','50000','2025001');
insert into orders values('O2509','2025-09-01','50000','2025002');
insert into orders values('O2510','2025-03-01','50000','2025006');

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Print the Information of the Employee and Order Table. [ Hint: SELECT * FROM TABLENAME ]
-- Write the SQL Query below this    
select * from employee;
select * from orders;

-- Output: 
/*	empID	firstname	lastname	salary	birthdate	hiredate
	2025001	Abhay	Biju	100000	2025-01-10	2024-08-01
	2025002	Abinand	Biju	200000	2025-04-01	2024-07-01
	2025003	Akshatha	B.S	300000	2025-09-01	2024-06-01
	2025004	Jahnavi	Palya	400000	2025-10-01	2024-05-01
	2025005	Laxman	Bhatt	500000	2025-07-01	2024-04-01
	2025006	Gaurav	Rao	700000	2025-08-01	2024-04-01
	2025007	Neel	Choudary	800000	2025-06-01	2024-02-01
	2025008	Prahlad	Bhat	900000	2025-03-01	2024-01-01
	2025009	Varun	Mudaliar	1000000	2025-05-01	2024-05-01
	2025010	Aryan	Biju	1000000	2025-07-01	2024-07-01
						*/
                        /*
	orderID	orderdate	totalamt	empID
	O2501	2023-08-12	50000	2025009
	O2502	2025-05-01	50000	2025010
	O2503	2025-03-01	50000	2025004
	O2504	2025-07-01	50000	2025007
	O2505	2025-02-01	50000	2025005
	O2506	2025-01-01	50000	2025003
	O2507	2025-07-01	50000	2025008
	O2508	2025-08-01	50000	2025001
	O2509	2025-09-01	50000	2025002
	O2510	2025-03-01	50000	2025006
				*/


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Number Functions Section
-- ------------------------------------------------------------
/* a. Round Salaries: Round employee salaries to nearest integer */
select round (salary) from employee;

-- Output: 
/*
'100000'
'200000'
'300000'
'400000'
'500000'
'700000'
'800000'
'900000'
'1000000'
'1000000'
*/
/* b. Absolute Values: Show absolute values of salaries */
select abs (salary) from employee;
-- Output: 
/*'100000'
'200000'
'300000'
'400000'
'500000'
'700000'
'800000'
'900000'
'1000000'
'1000000'
*/

/* c. Ceiling Values: Get ceiling values of order amounts */
select ceil (totalamt) from orders;
-- Output: 
/*
'50000'
'50000'
'50000'
'50000'
'50000'
'50000'
'50000'
'50000'
'50000'
'50000'
*/
-- ------------------------------------------------------------
-- Aggregate Functions Section
-- ------------------------------------------------------------
/* a. Count of Employees: Find total number of employees */
select count(*) from employee;
-- Output: 

/* b. Sum of Salaries: Calculate total salary expense */
select sum(salary) from employee;
-- Output: 
/*
'10'
*/
/* c. Average Order Amount: Find average order value */
select avg (totalamt) from orders;
-- Output: 
/*
'50000.0000'
*/
/* d. Max/Min Salary: Find highest and lowest salaries */
select max(salary) from employee;
select min(salary) from employee;
-- Output: 
/*'1000000'
*/
/*'100000'
*/
-- ------------------------------------------------------------
-- Character Functions Section
-- ------------------------------------------------------------
/* a. Case Conversion: Show names in uppercase and lowercase */
select upper(firstname) from employee;
select lower(firstname) from employee;
-- Output: 
/*	upper(firstname)
	ABHAY
	ABINAND
	AKSHATHA
	JAHNAVI
	LAXMAN
	GAURAV
	NEEL
	PRAHLAD
	VARUN
	ARYAN*/
    /*'abhay'
'abinand'
'akshatha'
'jahnavi'
'laxman'
'gaurav'
'neel'
'prahlad'
'varun'
'aryan'
*/
/* b. Concatenate Names: Create full names */
select concat(firstname, lastname) as fullname from employee;
-- Output: 

/* c. Extract Substring: Get first 3 characters of first names */
select substring(firstname, 1, 3) as threecharacters from employee;
-- Output: 
/*	fullname
	AbhayBiju
	AbinandBiju
	AkshathaB.S
	JahnaviPalya
	LaxmanBhatt
	GauravRao
	NeelChoudary
	PrahladBhat
	VarunMudaliar
	AryanBiju*/
/*	threecharacters
	Abh
	Abi
	Aks
	Jah
	Lax
	Gau
	Nee
	Pra
	Var
	Ary*/
-- ------------------------------------------------------------
-- Conversion Functions Section
-- ------------------------------------------------------------
/* Convert String to Date: Convert text to DATE type */
select cast(orderdate as char) as convertdate from orders;
-- Output: 
/*	convertdate
	2023-08-12
	2025-05-01
	2025-03-01
	2025-07-01
	2025-02-01
	2025-01-01
	2025-07-01
	2025-08-01
	2025-09-01
	2025-03-01*/
-- ------------------------------------------------------------
-- Date Functions Section
-- ------------------------------------------------------------
/* a. Current Date/Time: Get current timestamp */
select curdate();
-- Output: 
/*'2025-09-08'
*/
/* b. Extract Year: Get year from order dates */
select extract(year from orderdate) as orderyear from orders;
-- Output: 
/*	orderyear
	2023
	2025
	2025
	2025
	2025
	2025
	2025
	2025
	2025
	2025*/
/* c. Add Months: Add 3 months to order dates */
select orderID, year(orderdate) as orderyear from orders;
-- Output: 
/*	orderID	orderyear
	O2501	2023
	O2502	2025
	O2503	2025
	O2504	2025
	O2505	2025
	O2506	2025
	O2507	2025
	O2508	2025
	O2509	2025
	O2510	2025*/
/* d. Days Since Order: Calculate days between order date and now */
select date_add(orderdate, interval 3 month) as finaldate from orders;
-- Output: 
/*	finaldate
	2023-11-12
	2025-08-01
	2025-06-01
	2025-10-01
	2025-05-01
	2025-04-01
	2025-10-01
	2025-11-01
	2025-12-01
	2025-06-01*/
-- END of the Task -- 