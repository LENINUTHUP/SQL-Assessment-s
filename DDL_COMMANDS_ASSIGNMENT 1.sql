CREATE DATABASE School;
USE School;
-- Create the STUDENT Table
CREATE TABLE STUDENT (
    Roll_No INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT,
    Grade CHAR(2)
);
-- Insering elements to STUDENT Table
INSERT INTO STUDENT (Roll_No, Name, Marks, Grade) VALUES
(1, 'Bruce', 85, 'A'),
(2, 'Spector', 78, 'B'),
(3, 'Peter', 92, 'A'),
(4, 'Stark', 65, 'C');
-- Displaying Table
SELECT * FROM STUDENT;
-- Altering the Table
ALTER TABLE STUDENT ADD Contact VARCHAR(15);
ALTER TABLE STUDENT DROP COLUMN Grade;
-- Renaming the Table
RENAME TABLE STUDENT TO CLASSSIX;
RENAME TABLE CLASSSIX TO CLASS_TEN;


