CREATE DATABASE POPULATION;
USE POPULATION;

-- Create the Country table
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(100) NOT NULL,
    Population INT NOT NULL,
    Area INT NOT NULL
);

-- Create the Persons table
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(100) NOT NULL,
    Lname VARCHAR(100) NOT NULL,
    Population INT NOT NULL,
    Rating DECIMAL(2, 1) NOT NULL,
    Country_Id INT,
    Country_name VARCHAR(100),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);
-- Inserting data into Country table
INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331000000, 9833517),
(2, 'Canada', 37742154, 9984670),
(3, 'UK', 67886011, 243610),
(4, 'India', 1380004385, 3287263),
(5, 'Australia', 25499884, 7692024),
(6, 'Germany', 83783942, 357022),
(7, 'France', 65273511, 551695),
(8, 'Brazil', 212559417, 8515767),
(9, 'Japan', 126476461, 377975),
(10, 'South Africa', 59308690, 1219090);

-- Inserting data into Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 331000000, 4.5, 1, 'USA'),
(2, 'Jane', 'Smith', 37742154, 4.8, 2, 'Canada'),
(3, 'Alice', 'Johnson', 67886011, 3.9, 3, 'UK'),
(4, 'Bob', 'Brown', 1380004385, 4.2, 4, 'India'),
(5, 'Charlie', 'Davis', 25499884, 4.7, 5, 'Australia'),
(6, 'Eve', 'Wilson', 83783942, 4.1, 6, 'Germany'),
(7, 'Frank', 'Miller', 65273511, 4.9, 7, 'France'),
(8, 'Grace', 'Lee', 212559417, 4.0, 8, 'Brazil'),
(9, 'Hank', 'Garcia', 126476461, 4.6, 9, 'Japan'),
(10, 'Ivy', 'Martinez', 59308690, 4.3, 10, 'South Africa');

SELECT DISTINCT Country_name FROM Persons;

SELECT Fname AS First_Name, Lname AS Last_Name FROM Persons;

SELECT * FROM Persons WHERE Rating > 4.0;

SELECT * FROM Country WHERE Population > 1000000;

SELECT * FROM Persons WHERE Country_name = 'USA' OR Rating > 4.5;

SELECT * FROM Persons WHERE Country_name IS NULL;
SELECT * FROM Persons WHERE Country_name IN ('USA', 'Canada', 'UK');
SELECT * FROM Persons WHERE Country_name NOT IN ('India', 'Australia');
SELECT * FROM Country WHERE Population BETWEEN 500000 AND 2000000;
SELECT * FROM Country WHERE Country_name NOT LIKE 'C%';
