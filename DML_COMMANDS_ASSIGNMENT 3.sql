CREATE DATABASE COMPANY;
USE COMPANY;

CREATE TABLE MANAGERS (
MANAGER_ID INT PRIMARY KEY,
First_name VARCHAR(50) NOT NULL,
LAST_NAME VARCHAR(50)NOT NULL,
DOB DATE NOT NULL,
AGE INT CHECK (AGE>=18),
LAST_UPDATE timestamp default current_timestamp,
GENDER CHAR(1) CHECK (GENDER IN ("M","F","0")),
DEPARTMENT VARCHAR(50) NOT NULL,
SALARY DECIMAL(10,2) NOT NULL);

-- 1)
INSERT INTO Managers (Manager_Id, First_name, Last_Name, DOB, Age, Gender, Department, Salary) VALUES
(1, 'John', 'Wick', '1985-05-15', 38, 'M', 'IT', 30000.00),
(2, 'Jane', 'Foster', '1990-07-20', 33, 'F', 'HR', 25000.00),
(3, 'Aaliya', 'Khan', '1987-11-10', 36, 'F', 'Finance', 27000.00),
(4, 'Robert', 'Dawney', '1980-03-05', 43, 'M', 'IT', 35000.00),
(5, 'Emily', 'Clark', '1992-01-25', 31, 'F', 'Marketing', 23000.00),
(6, 'Michael', 'Jakson', '1988-09-15', 35, 'M', 'IT', 40000.00),
(7, 'Sarah', 'Sacarya', '1984-12-30', 38, 'F', 'HR', 29000.00),
(8, 'David', 'Martinez', '1995-02-14', 28, 'M', 'Finance', 22000.00),
(9, 'Laura', 'Logan', '1991-06-22', 32, 'F', 'Marketing', 24000.00),
(10, 'James', 'Rodrigouz', '1983-10-10', 40, 'M', 'IT', 32000.00);

-- 2)
SELECT FIRST_NAME,LAST_NAME,DOB
FROM MANAGERS
WHERE MANAGER_ID =3;

-- 3)
SELECT First_name, Last_Name, Salary * 12 AS Annual_Income 
FROM Managers;

-- 4)
SELECT *
FROM MANAGERS
WHERE FIRST_NAME!="Aaliya";

-- 5)
SELECT *  FROM MANAGERS
WHERE DEPARTMENT="IT" AND SALARY>25000;

-- 6)
SELECT * FROM MANAGERS
WHERE SALARY BETWEEN 10000 AND 35000;