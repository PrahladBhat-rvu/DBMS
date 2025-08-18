-- Lab Experiment 01: Implementation of DDL Commands in SQL
-- STUDENT NAME: 
-- USN: 
-- SECTION: 

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]


-- Scenario: University Course Management System
-- CREATE AND LOAD THE database DBLab001
-- Write your SQL query below Codespace:

create database lab001;
USE lab001;
-- Task 1: Create the Students Table
-- Create a table to store information about students.
-- Include the following columns:
-- 1. StudentID (Primary Key)
-- 2. FirstName
-- 3. LastName
-- 4. Email (Unique Constraint)
-- 5. DateOfBirth

-- Write your SQL query below Codespace:
create table Students
(StudentID varchar(10) Primary Key,
FirstName varchar(20),
LastName varchar(10),
Email varchar(20) Unique,
DOB date);
DESC STUDENTS; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code
/*'StudentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'FirstName', 'varchar(20)', 'YES', '', NULL, ''
'LastName', 'varchar(10)', 'YES', '', NULL, ''
'Email', 'varchar(20)', 'YES', 'UNI', NULL, ''
'DOB', 'date', 'YES', '', NULL, ''
*/


-- Alter the table and 2 new columns
alter table Students
add (Gender varchar(8));
desc Students;
alter table Students
add (Age int);
desc Students;
-- Modify a column data type
alter table Students modify Gender varchar(10);
desc Students;
-- Rename a column
alter table Students rename column LastName to Surname;
desc Students;
-- Drop a column
alter table Students drop column Age;
desc Students;
-- Rename the table
alter table StudentStud rename to StudentS;
desc StudentS;



-- Task 2: Create the Courses Table
-- Create a table to store information about courses.
-- Include the following columns:
-- - CourseID (Primary Key)
-- - CourseName
-- - Credits

-- Write your SQL query below Codespace:

create table CourseTable
(CourseID varchar(10) Primary Key,
CourseName varchar(20),
Credits int);
DESC CourseTable; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- OUTPUT :
/*'CourseID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(20)', 'YES', '', NULL, ''
'Credits', 'int', 'YES', '', NULL, ''
*/

-- Alter the table and 2 new columns
alter table CourseTable
add (Dept varchar(15), Faculty varchar(20));
desc CourseTable;
-- Modify a column data type
alter table CourseTable modify Dept varchar(10);
desc CourseTable;
-- Rename a column
alter table CourseTable rename column Dept to Department;
desc CourseTable;
-- Drop a column
alter table CourseTable drop column Faculty;
desc CourseTable;
-- Rename the table
alter table CourseTable rename to Course;
desc Course;

-- Task 3: Create the Enrollments Table
-- Create a table to store course enrollment information.
-- Include the following columns:
-- - EnrollmentID (Primary Key)
-- - StudentID (Foreign Key referencing Students table)
-- - CourseID (Foreign Key referencing Courses table)
-- - EnrollmentDate

-- Write your SQL query below Codespace:
Use lab001;
create table Enrollments
(EnrollmentID varchar(10) Primary Key,
StudentID varchar(10),
CourseID varchar(10),
Foreign Key (StudentID) references StudentS(StudentID),
Foreign Key (CourseID) references Course(CourseID));

DESC Enrollments; -- [ [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ] ]
-- OUTPUT :
/*'EnrollmentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'StudentID', 'varchar(10)', 'YES', 'MUL', NULL, ''
'CourseID', 'varchar(10)', 'YES', 'MUL', NULL, ''
*/
-- Alter the table and 2 new columns
alter table Enrollments
add (YearJoined int, Grade varchar(5));
desc Enrollments;
-- Modify a column data type
alter table Enrollments modify Grade varchar(10);
desc Enrollments;
-- Rename a column
alter table Enrollments rename column YearJoined to Batch;
desc Enrollments;
-- Drop a column
alter table Enrollments drop column Grade;
desc Enrollments;
-- Rename the table
alter table Enrollments rename to Roll;
desc Roll;

-- Task 4: Alter the Students Table
-- Add a column 'PhoneNumber' to store student contact numbers.

-- Write your SQL query below Codespace:
alter table StudentS
add (PhoneNumber int);
DESC StudentS; -- [[ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]]

-- Task 5: Modify the Courses Table
-- Change the data type of the 'Credits' column to DECIMAL.
-- Write your SQL query below Codespace:

-- Task 6: Drop Tables

SHOW TABLES; -- Before dropping the table

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:

SHOW TABLES; -- After dropping the table Enrollement and Course

-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabExperiment01
