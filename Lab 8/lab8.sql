-- Lab Experiment 08: Implementation of Procedure ( insert, update and delete)
-- STUDENT NAME: Prahlad Bhat 
-- USN: 1RUA24BCA0066
-- SECTION: A

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- Scenario: Employee Management System
-- CREATE AND LOAD THE database DBLab008
-- Write your SQL query below Codespace:

CREATE DATABASE WORK;
USE WORK;

-- Task 1: Create the Employee Table
-- Create a table to store information about Employee.
-- Include the following columns:
 --   empid INT PRIMARY KEY,
   -- empname VARCHAR(50),
   -- age INT,
   -- salary DECIMAL(10,2),
   -- designation VARCHAR(30),
   -- address VARCHAR(100),
   -- date_of_join DATE
-- Write your SQL query below Codespace:

CREATE TABLE EMPLOYEE(
empid INT PRIMARY KEY,
empname VARCHAR(50),
age INT,
salary DECIMAL(10,2),
designation VARCHAR(30),
address VARCHAR(100),
date_of_join DATE
);
DESC EMPLOYEE;

-- DESCRIBE THE SCHEMA -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code

/*, Type, Null, Key, Default, Extra
empid	int	NO	PRI	
empname	varchar(50)	YES		
age	int	YES		
salary	decimal(10,2)	YES		
designation	varchar(30)	YES		
address	varchar(100)	YES		
date_of_join	date	YES	*/	

-- insert 10 records to the table 
-- Write your SQL query below Codespace:

INSERT INTO EMPLOYEE VALUES (1, 'John Doe', 30, 60000.00, 'Software Engineer', '123 Main St, New York', '2020-01-15');
INSERT INTO EMPLOYEE VALUES (2, 'Jane Smith', 28, 75000.00, 'Product Manager', '456 Elm St, Los Angeles', '2019-05-20');
INSERT INTO EMPLOYEE VALUES (3, 'Alice Johnson', 35, 82000.00, 'Data Scientist', '789 Oak St, San Francisco', '2018-07-10');
INSERT INTO EMPLOYEE VALUES (4, 'Bob Brown', 40, 95000.00, 'Senior Developer', '101 Pine St, Chicago', '2017-02-11');
INSERT INTO EMPLOYEE VALUES (5, 'Charlie Green', 25, 55000.00, 'Junior Developer', '202 Maple St, Seattle', '2021-0325');
INSERT INTO EMPLOYEE VALUES (6, 'Diana White', 32, 67000.00, 'UX Designer', '303 Birch St, Austin', '2016-11-18');
INSERT INTO EMPLOYEE VALUES (7, 'Evan Black', 29, 71000.00, 'Engineer', '404 Cedar St, Miami', '2022-06-30');
INSERT INTO EMPLOYEE VALUES (8, 'Fiona Blue', 38, 88000.00, 'Product Designer', '505 Walnut St, Denver', '2015-08-14');
INSERT INTO EMPLOYEE VALUES (9, 'George King', 33, 90000.00, 'Developer', '606 Chestnut St, Boston', '2017-09-05');
INSERT INTO EMPLOYEE VALUES (10, 'Hannah Grey', 27, 65000.00, 'Marketing Specialist', '707 Maple St, Atlanta', '2020-11-22');
SELECT*FROM EMPLOYEE; 


-- COPYPASTE OF THE OUTPUT in CSV Format and terminate with ;

/*empid, empname, age, salary, designation, address, date_of_join
1	John Doe	30	60000.00	Software Engineer	123 Main St, New York	2020-01-15
2	Jane Smith	28	75000.00	Product Manager	456 Elm St, Los Angeles	2019-05-20
3	Alice Johnson	35	82000.00	Data Scientist	789 Oak St, San Francisco	2018-07-10
4	Bob Brown	40	95000.00	Senior Developer	101 Pine St, Chicago	2017-02-11
6	Diana White	32	67000.00	UX Designer	303 Birch St, Austin	2016-11-18
7	Evan Black	29	71000.00	Engineer	404 Cedar St, Miami	2022-06-30
8	Fiona Blue	38	88000.00	Product Designer	505 Walnut St, Denver	2015-08-14
9	George King	33	90000.00	Developer	606 Chestnut St, Boston	2017-09-05
10	Hannah Grey	27	65000.00	Marketing Specialist	707 Maple St, Atlanta	2020-11-22*/

-- perform the following procedures on the employee database and copy paste the output in the space provided
-- A. Insert Procedure

-- 1. Write a stored procedure named InsertEmployee to insert a new employee record into the Employee table with all fields as input parameters.
-- 2. Modify the insert procedure to ensure the employee’s age must be between 18 and 60.
      -- If not, display a message: "Invalid age, employee not added."
-- 3. Create a procedure that inserts a new employee record.
          -- If the salary is not provided, assign a default salary of 20000.
-- 4. Write a procedure that inserts three new employee records in a single procedure using multiple INSERT statements.
DESC EMPLOYEE;
DELIMITER $$

CREATE PROCEDURE INSSTD(IN EMPID INT, IN EMPNAME VARCHAR(50), IN AGE INT, IN SALARY DECIMAL(10,2), IN DESIGNATION VARCHAR(30), IN ADDRESS VARCHAR(100), DATE_OF_JOIN DATE)
BEGIN
INSERT INTO EMPLOYEE VALUES(EMPID,EMPNAME,AGE,SALARY,DESIGNATION,ADDRESS,DATE_OF_JOIN);
END $$ 

CALL INSSTD(1001,'ANITHA',34,25000,'MANAGER','BENGALURU','1980-12-12');
SELECT * FROM EMPLOYEE;

DELIMITTER $$
CREATE PROCEDURE AGE(IN EMPID INT, IN EMPNAME VARCHAR(50), IN AGE INT, IN SALARY DECIMAL(10,2), IN DESIGNATION VARCHAR(30), IN ADDRESS VARCHAR(100), DATE_OF_JOIN DATE)
BEGIN
IF AGE>18 AND AGE<60 THEN
     INSERT INTO EMPLOYEE VALUES(EMPID,EMPNAME,AGE, SALARY,DESIGNATION,ADDRESS,DATE_OF_JOIN);
 ELSE
     SELECT 'Invalid age, employee not added.' AS Message;
 END IF;  

END $$


CALL AGE(1001,'ANITHA',12,25000,'MANAGER','BENGALURU','1980-12-12');
-- B.  Update Procedure

/*
Update Salary:
Write a stored procedure named UpdateSalary to update an employee’s salary based on their empid.


Increment Salary by Percentage:
Create a procedure to increase the salary by 10% for all employees whose designation = 'Manager'.

Update Designation:
Write a procedure to update the designation of an employee by empid.
Example: Promote an employee from 'Clerk' to 'Senior Clerk'.

Update Address:
Write a procedure to update the address of an employee when empid is given as input.

Conditional Update (Age Check):
Create a procedure that updates salary only if the employee’s age > 40; otherwise, print "Not eligible for salary update."

*/
-- C. Delete Procedure
/*
Delete by empid:
Write a stored procedure named DeleteEmployee to delete an employee record using their empid.

Delete by Designation:
Create a procedure that deletes all employees belonging to a specific designation (e.g., 'Intern').

Delete Based on Salary Range:
Write a procedure to delete employees whose salary is less than ₹15000.

Delete by Joining Year:
Write a procedure to delete employees who joined before the year 2015.
*/
-- End of Lab Experiment 
