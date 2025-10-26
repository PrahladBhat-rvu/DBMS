-- Lab Experiment 04: Implement arithmetic, logical, comparison, special, and set operators in SQL using the Employees and Departments tables.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Prahlad Bhat
-- USN: 1RUA24BCA0066
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Write your code below this line along with the output 
create database employee;
use employee;

CREATE TABLE Employees (  
    EmployeeID INT PRIMARY KEY,  
    Name VARCHAR(100),  
    Age INT,  
    Salary DECIMAL(10,2),  
    DepartmentID INT,  
    HireDate DATE,  
    Address VARCHAR(255)  
);  

INSERT INTO Employees VALUES  
(1, 'Alice Johnson', 30, 60000, 1, '2020-03-15', '123 Main St, City A'),  
(2, 'Bob Smith', 28, 55000, 2, '2021-06-20', '456 Oak St, City B'),  
(3, 'Charlie Brown', 35, 75000, 3, '2019-01-10', '789 Pine St, City C'),  
(4, 'David Wilson', 40, 90000, 3, '2018-07-25', '101 Maple St, City D'),  
(5, 'Emma Davis', 27, 50000, 4, '2022-09-30', '202 Birch St, City E'),  
(6, 'Frank Miller', 32, 70000, 5, '2020-11-18', '303 Cedar St, City F'),  
(7, 'Grace Lee', 29, 58000, 1, '2021-04-05', '404 Walnut St, City G'),  
(8, 'Hank Adams', 45, 98000, 2, '2017-12-12', '505 Spruce St, City H'),  
(9, 'Ivy Green', 31, 64000, 4, '2023-02-14', '606 Redwood St, City I'),  
(10, 'Jack White', 38, 85000, 5, '2019-08-08', '707 Elm St, City J');  

-- TABLE:02 Department Table

CREATE TABLE Departments (  
    DepartmentID INT PRIMARY KEY,  
    DepartmentName VARCHAR(50)  
);  

INSERT INTO Departments VALUES  
(1, 'HR'),  
(2, 'Finance'),  
(3, 'Engineering'),  
(4, 'Marketing'),  
(5, 'Sales');  


-- TASK FOR STUDENTS 

/* 
Exercise 1: Arithmetic Operators
Addition, Subtraction, Multiplication, Division
Q1 - Add a bonus (10% of Salary) to each employee’s salary.


Q2 - Subtract tax (15% of Salary) from each employee’s salary.

Q3 - Calculate the yearly salary from the monthly salary.

-- Modulus Operator
Q4 - Find the remainder when employees’ ages are divided by 5.*/

-- Write your code below this line along with the output 

  select Name, Salary +(salary *0.10)as NewSalary from Employees;
  /*Alice Johnson	66000.0000
Bob Smith	60500.0000
Charlie Brown	82500.0000
David Wilson	99000.0000
Emma Davis	55000.0000
Frank Miller	77000.0000
Grace Lee	63800.0000
Hank Adams	107800.0000
Ivy Green	70400.0000
Jack White	93500.0000*/

select Name, Salary - (Salary *0.15) as NetSalary from Employees;
/*Alice Johnson	51000.0000
Bob Smith	46750.0000
Charlie Brown	63750.0000
David Wilson	76500.0000
Emma Davis	42500.0000
Frank Miller	59500.0000
Grace Lee	49300.0000
Hank Adams	83300.0000
Ivy Green	54400.0000
Jack White	72250.0000*/

select Name,Salary *12 as YearlySalary from Employees;
/*Alice Johnson	720000.00
Bob Smith	660000.00
Charlie Brown	900000.00
David Wilson	1080000.00
Emma Davis	600000.00
Frank Miller	840000.00
Grace Lee	696000.00
Hank Adams	1176000.00
Ivy Green	768000.00
Jack White	1020000.00*/

select Name, Age, Age % 5 as Remainder from Employees;
/*Alice Johnson	30	0
Bob Smith	28	3
Charlie Brown	35	0
David Wilson	40	0
Emma Davis	27	2
Frank Miller	32	2
Grace Lee	29	4
Hank Adams	45	0
Ivy Green	31	1
Jack White	38	3*/
  


/* Exercise 2: Logical Operators: AND, OR, NOT

Q5 - Retrieve employees older than 30 AND with salary > 50000.

Q6 - Retrieve employees in the HR department (ID=1) OR earning > 70000.

Q7 - Retrieve employees NOT living in City G.*/

SELECT * FROM Employees WHERE Age > 30 AND Salary > 50000;
/*3	Charlie Brown	35	75000.00	3	2019-01-10	789 Pine St, City C
4	David Wilson	40	90000.00	3	2018-07-25	101 Maple St, City D
6	Frank Miller	32	70000.00	5	2020-11-18	303 Cedar St, City F
8	Hank Adams	45	98000.00	2	2017-12-12	505 Spruce St, City H
9	Ivy Green	31	64000.00	4	2023-02-14	606 Redwood St, City I
10	Jack White	38	85000.00	5	2019-08-08	707 Elm St, City J*/

SELECT * FROM Employees WHERE DepartmentID = 1 OR Salary > 70000;
/*1	Alice Johnson	30	60000.00	1	2020-03-15	123 Main St, City A
3	Charlie Brown	35	75000.00	3	2019-01-10	789 Pine St, City C
4	David Wilson	40	90000.00	3	2018-07-25	101 Maple St, City D
7	Grace Lee	29	58000.00	1	2021-04-05	404 Walnut St, City G
8	Hank Adams	45	98000.00	2	2017-12-12	505 Spruce St, City H
10	Jack White	38	85000.00	5	2019-08-08	707 Elm St, City J*/

SELECT * FROM Employees WHERE address not in ('404 Walnut St, City G');

SELECT * FROM Employees WHERE address not like('%City G');
/*1	Alice Johnson	30	60000.00	1	2020-03-15	123 Main St, City A
2	Bob Smith	28	55000.00	2	2021-06-20	456 Oak St, City B
3	Charlie Brown	35	75000.00	3	2019-01-10	789 Pine St, City C
4	David Wilson	40	90000.00	3	2018-07-25	101 Maple St, City D
5	Emma Davis	27	50000.00	4	2022-09-30	202 Birch St, City E
6	Frank Miller	32	70000.00	5	2020-11-18	303 Cedar St, City F
8	Hank Adams	45	98000.00	2	2017-12-12	505 Spruce St, City H
9	Ivy Green	31	64000.00	4	2023-02-14	606 Redwood St, City I*/



-- Write your code below this line along with the output 

 
/* Exercise 3: Comparison Operators

Q8 - Equality, Inequality, Greater Than, Less Than

Q9 - Find employees with salary = 60000.

Q10 - List employees not in the IT department (no IT department exists; returns all).

Q11 - Retrieve employees younger than 25 with salary > 50000 

Q12 - List employees aged 25–35.

Q13 - Find employees in HR, Finance, or Engineering (IDs 1, 2, 3).

Q14 - Find employees with names starting with A.

Q15 - List employees with no address.

*/

-- Write your code below this line along with the output 
SELECT * FROM Employees WHERE Salary = 60000;
/*1	Alice Johnson	30	60000.00	1	2020-03-15	123 Main St, City A*/

SELECT * FROM Employees WHERE DepartmentID not in ('IT');
/*1	Alice Johnson	30	60000.00	1	2020-03-15	123 Main St, City A
2	Bob Smith	28	55000.00	2	2021-06-20	456 Oak St, City B
3	Charlie Brown	35	75000.00	3	2019-01-10	789 Pine St, City C
4	David Wilson	40	90000.00	3	2018-07-25	101 Maple St, City D
5	Emma Davis	27	50000.00	4	2022-09-30	202 Birch St, City E
6	Frank Miller	32	70000.00	5	2020-11-18	303 Cedar St, City F
7	Grace Lee	29	58000.00	1	2021-04-05	404 Walnut St, City G
8	Hank Adams	45	98000.00	2	2017-12-12	505 Spruce St, City H
9	Ivy Green	31	64000.00	4	2023-02-14	606 Redwood St, City I
10	Jack White	38	85000.00	5	2019-08-08	707 Elm St, City J*/

SELECT * FROM Employees WHERE Age < 25 AND Salary > 50000;

SELECT * FROM Employees WHERE Age BETWEEN 25 AND 35;
/*1	Alice Johnson	30	60000.00	1	2020-03-15	123 Main St, City A
2	Bob Smith	28	55000.00	2	2021-06-20	456 Oak St, City B
3	Charlie Brown	35	75000.00	3	2019-01-10	789 Pine St, City C
5	Emma Davis	27	50000.00	4	2022-09-30	202 Birch St, City E
6	Frank Miller	32	70000.00	5	2020-11-18	303 Cedar St, City F
7	Grace Lee	29	58000.00	1	2021-04-05	404 Walnut St, City G
9	Ivy Green	31	64000.00	4	2023-02-14	606 Redwood St, City I*/

SELECT * FROM Employees WHERE DepartmentID IN (1, 2, 3);
/*1	Alice Johnson	30	60000.00	1	2020-03-15	123 Main St, City A
2	Bob Smith	28	55000.00	2	2021-06-20	456 Oak St, City B
3	Charlie Brown	35	75000.00	3	2019-01-10	789 Pine St, City C
4	David Wilson	40	90000.00	3	2018-07-25	101 Maple St, City D
7	Grace Lee	29	58000.00	1	2021-04-05	404 Walnut St, City G
8	Hank Adams	45	98000.00	2	2017-12-12	505 Spruce St, City H*/

SELECT * FROM Employees WHERE Name LIKE 'A%';
/*1	Alice Johnson	30	60000.00	1	2020-03-15	123 Main St, City A*/

SELECT * FROM Employees WHERE Address IS NULL;

/* 

Exercise 5: Set Operators: UNION.

Q16 - Retrieve names from the HR department hired in 2022 OR 2023.

Q17 - Find common employees in the Engineering department (ID=3) hired before and after 2020.

Q18 - Find employees hired in 2023 but not in 2022.

/*
