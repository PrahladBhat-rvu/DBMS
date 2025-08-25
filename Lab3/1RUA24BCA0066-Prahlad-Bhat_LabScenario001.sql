-- Lab Experiment 01: Implementation of DDL Commands in SQL for the given scenarios
-- STUDENT NAME: 
-- USN: 
-- SECTION: 

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- Scenario: College Student Management System

-- CREATE AND LOAD THE database
-- Write your SQL query below Codespace:
create database college;
use college;
-- Task 1: Create the Tables under this system (min 5 tables)
  -- Table 01: Departments ( DepartmentID, DepartmentName, HOD,ContactEmail,PhoneNumber,Location )
  -- Table 02: Course (CourseID, CourseName,Credits,DepartmentID,Duration,Fee )
  -- Table 03: Students (StudentID,FirstName,LastName,Email,DateOfBirth,CourseID)
  -- Table 04: Faculty FacultyID,FacultyName,DepartmentID,Qualification,Email,PhoneNumber)
  -- Table 05: Enrollments (  EnrollmentID,StudentID,CourseID,Semester,Year,Grade)
-- Specify the Key (Primary and Foreign) for each table while creating


-- Write your SQL query below Codespace:
create table departments (
DepartmentID varchar(10) primary key,
DepartmentName varchar(15),
HOD varchar(10),
ContactEmail varchar(20),
PhoneNumber int,
Location varchar(30)
);
 -- Table 02: Course (CourseID, CourseName,Credits,DepartmentID,Duration,Fee )
 create table Course (
 CourseID varchar(10) primary key,
 CourseName varchar(10),
 Credits int,
 DepartmentID varchar(20),
 foreign key (DepartmentID) references departments (DepartmentID),
 Duration varchar(10),
 Fee int
 );

 -- Table 03: Students (StudentID,FirstName,LastName,Email,DateOfBirth,CourseID)
CREATE TABLE Students (
    StudentID VARCHAR(10) ,
    FirstName VARCHAR(10),
    LastName VARCHAR(10),
    Email VARCHAR(20),
    DOB DATE,
    CourseID VARCHAR(10),
    FOREIGN KEY (CourseID)
        REFERENCES Course (CourseID)
);

 -- Table 04: Faculty FacultyID,FacultyName,DepartmentID,Qualification,Email,PhoneNumber)
create table Faculty (
FacultyID varchar(10) primary key,
FacultyName varchar(10),
DepartmentID varchar(10),
foreign key (DepartmentID) references departments (DepartmentID),
Qualifications varchar(15),
Email varchar(20),
PhoneNumber int
);

  -- Table 05: Enrollments (  EnrollmentID,StudentID,CourseID,Semester,Year,Grade)
create table Enrollments(
EnrollmentID varchar(10) primary key,
StudentID varchar(10),
foreign key (StudentID) references Students (StudentID),
CourseID varchar(10),
foreign key (CourseID) references Course (CourseID),
Semester int,
Year date,
Grade varchar(5)
);
alter table Students modify column StudentID varchar(10) Primary key;
desc departments;
desc Course;
desc Students;
desc Faculty;
desc Enrollments;
-- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code
--  describe the structure of each table and copy paste the Output 

/*'DepartmentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'DepartmentName', 'varchar(15)', 'YES', '', NULL, ''
'HOD', 'varchar(10)', 'YES', '', NULL, ''
'ContactEmail', 'varchar(20)', 'YES', '', NULL, ''
'PhoneNumber', 'int', 'YES', '', NULL, ''
'Location', 'varchar(30)', 'YES', '', NULL, ''
*/

/*'CourseID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(10)', 'YES', '', NULL, ''
'Credits', 'int', 'YES', '', NULL, ''
'DepartmentID', 'varchar(20)', 'YES', 'MUL', NULL, ''
'Duration', 'varchar(10)', 'YES', '', NULL, ''
'Fee', 'int', 'YES', '', NULL, ''
*/

/*'StudentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'FirstName', 'varchar(10)', 'YES', '', NULL, ''
'LastName', 'varchar(10)', 'YES', '', NULL, ''
'Email', 'varchar(20)', 'YES', '', NULL, ''
'DOB', 'date', 'YES', '', NULL, ''
'CourseID', 'varchar(10)', 'YES', 'MUL', NULL, ''
*/

/*'FacultyID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'FacultyName', 'varchar(10)', 'YES', '', NULL, ''
'DepartmentID', 'varchar(10)', 'YES', 'MUL', NULL, ''
'Qualifications', 'varchar(15)', 'YES', '', NULL, ''
'Email', 'varchar(20)', 'YES', '', NULL, ''
'PhoneNumber', 'int', 'YES', '', NULL, ''
*/

/*'EnrollmentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'StudentID', 'varchar(10)', 'YES', 'MUL', NULL, ''
'CourseID', 'varchar(10)', 'YES', 'MUL', NULL, ''
'Semester', 'int', 'YES', '', NULL, ''
'Year', 'date', 'YES', '', NULL, ''
'Grade', 'varchar(5)', 'YES', '', NULL, ''
*/


-- Perform the following operations on the each of the tables
-- 01: add 2 new columns for each table

alter table departments
	add (BlockNumber int, room int);
alter table Course
	add (Subject1 varchar(15), Subject2 varchar(15));
alter table Students
	add (Height decimal, Weight decimal);
alter table Faculty
	add (Height decimal, Weight decimal);
alter table Enrollments
	add (Course varchar(10), FirstName varchar(10), StudentName varchar(10));
    
-- 02: Modify the existing column from one table
	-- 03 change the datatypes
    alter table Students modify column StudentID varchar(20);
	-- 04: Rename a column
    alter table Enrollments rename column StudentName to StudName;
-- 05: Drop a column
	alter table Enrollments drop column StudName;
-- 06: Rename the table
	alter table Enrollments rename to Enroll;
-- 07: describe the structure of the new table

/*  Additional set of questions 
--1 Add a new column Address (VARCHAR(100)) to the Students table.
--2 Add a column Gender (CHAR(1)) to the Students table.
--3 Add a column JoiningDate (DATE) to the Faculty table.
--4 Modify the column CourseName in the Courses table to increase its size from VARCHAR(50) to VARCHAR(100).
--5 Modify the column Location in the Departments table to VARCHAR(80).
--6 Rename the column Qualification in the Faculty table to Degree.
--7 Rename the table Faculty to Teachers.
--8 Drop the column PhoneNumber from the Departments table.
--9 Drop the column Email from the Students table.
--10 Drop the column Duration from the Courses table.
*/
alter table Students
	add (Address varchar(100), Gender char(1));
alter table Faculty
	add (JoiningDate date);
alter table Course modify CourseName varchar(100);
alter table Faculty modify Qualifications varchar(80);
alter table Faculty rename to Teachers;
alter table Teachers rename column Qualifications to Degree;
alter table Students drop column Email;
alter table Course drop column Duration;
SHOW TABLES; -- Before dropping the table

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:
drop table Course; -- not possible has been referenced in other table
drop table Enrollments;
SHOW TABLES; -- After dropping the table Enrollement and Course
-- Note: Perform the specified operations on all the 5 tables in the system
-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabScenario01