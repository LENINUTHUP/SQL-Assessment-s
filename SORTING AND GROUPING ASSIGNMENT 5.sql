
USE Population;

SELECT SUBSTRING(Country_name, 1, 3) AS First_Three_Chars FROM Country;

SELECT CONCAT(Fname, ' ', Lname) AS Full_Name FROM Persons;

SELECT COUNT(DISTINCT Country_name) AS Unique_Country_Count FROM Persons;

SELECT MAX(Population) AS Max_Population FROM Country;

SELECT MIN(Population) AS Min_Population FROM Country;
-- Inserting new rows with Lname as NULL
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(11, 'Jack', NULL, 500000, 4.0, 1, 'USA'),
(12, 'Jill', NULL, 600000, 4.5, 2, 'Canada');

-- Counting Lname from Persons table
SELECT COUNT(Lname) AS Count_Lname FROM Persons WHERE Lname IS NOT NULL ;
SELECT COUNT(*) AS Total_Rows FROM Persons;
SELECT Population FROM Country LIMIT 3;
SELECT * FROM Country ORDER BY RAND() LIMIT 3;
SELECT * FROM Persons ORDER BY Rating DESC;
SELECT Country_name, SUM(Population) AS Total_Population
FROM Persons
GROUP BY Country_name;
SELECT Country_name, COUNT(*) AS Total_Persons, AVG(Rating) AS Average_Rating
FROM Persons
GROUP BY Country_name
HAVING COUNT(*) > 2
ORDER BY Average_Rating ASC;