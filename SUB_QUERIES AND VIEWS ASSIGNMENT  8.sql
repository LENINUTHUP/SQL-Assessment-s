USE POPULATION;
#Find the number of persons in each country
SELECT Country_name, COUNT(*) AS NumberOfPersons
FROM Persons
GROUP BY Country_name
#Find the number of persons in each country sorted from high to low.
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(11, 'Marco', 'polo', 332000000, 4.6, 1, 'USA');

SELECT Country_name, COUNT(*) AS NumberOfPersons
FROM Persons
GROUP BY Country_name
ORDER BY NumberOfPersons DESC;

#Find out an average rating for Persons in respective countries if the average is greater than 3.0.
SELECT Country_name, AVG(Rating) AS AverageRating
FROM Persons
GROUP BY Country_name
HAVING AVG(Rating) > 3.0;

#Find the countries with the same rating as the USA. (Use Subqueries)
SELECT DISTINCT Country_name
FROM Persons
WHERE Rating = (SELECT AVG(Rating) FROM Persons WHERE Country_name = 'USA');

#Select all countries whose population is greater than the average population of all nations.
SELECT Country_name
FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country);

CREATE DATABASE Product;

USE Product;

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);

INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '555-1234', '123 Elm St', 'Springfield', 'IL', '62701', 'USA'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '555-5678', '456 Oak St', 'Springfield', 'IL', '62701', 'USA'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '555-8765', '789 Pine St', 'Los Angeles', 'CA', '90001', 'USA'),
(4, 'Bob', 'Brown', 'bob.brown@example.com', '555-4321', '321 Maple St', 'New York', 'NY', '10001', 'USA'),
(5, 'Charlie', 'Davis', 'charlie.davis@example.com', '555-1357', '654 Cedar St', 'Miami', 'FL', '33101', 'USA'),
(6, 'David', 'Wilson', 'david.wilson@example.com', '555-2468', '987 Birch St', 'Seattle', 'WA', '98101', 'USA'),
(7, 'Eva', 'Garcia', 'eva.garcia@example.com', '555-3698', '159 Spruce St', 'Austin', 'TX', '73301', 'USA'),
(8, 'Frank', 'Martinez', 'frank.martinez@example.com', '555-7531', '753 Willow St', 'Chicago', 'IL', '60601', 'USA'),
(9, 'Grace', 'Lopez', 'grace.lopez@example.com', '555-1597', '852 Fir St', 'San Francisco', 'CA', '94101', 'USA'),
(10, 'Henry', 'Miller', 'henry.miller@example.com', '555-9512', '963 Ash St', 'Boston', 'MA', '02101', 'USA');

CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS FullName, Email
FROM Customer;

SELECT * FROM customer_info;

CREATE VIEW US_Customer AS
SELECT *
FROM Customer
WHERE Country = 'USA';

CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS FullName, Email, Phone_no, State
FROM Customer;

SET SQL_SAFE_UPDATES = 0;

UPDATE Customer
SET Phone_no = '455-2854' 
WHERE State = 'California';

SET SQL_SAFE_UPDATES = 1;

SELECT State, COUNT(*) AS NumberOfCustomers
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;

SELECT State, COUNT(*) AS NumberOfCustomers
FROM Customer_details
GROUP BY State;

SELECT *
FROM Customer_details
ORDER BY State ASC;