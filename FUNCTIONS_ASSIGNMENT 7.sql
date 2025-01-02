USE POPULATION;

ALTER TABLE PERSONS
ADD DOB DATE;

UPDATE Persons
SET DOB = CASE Id
    WHEN 1 THEN '1990-05-15'
    WHEN 2 THEN '1985-10-20'
    WHEN 3 THEN '1992-03-25'
    WHEN 4 THEN '1988-07-30'
    WHEN 5 THEN '1995-12-05'
    WHEN 6 THEN '1980-01-15'
    WHEN 7 THEN '1993-11-10'
    WHEN 8 THEN '1987-04-22'
    WHEN 9 THEN '1991-09-18'
    WHEN 10 THEN '1994-06-12'
    END
WHERE Id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

DELIMITER $$
CREATE FUNCTION CalculateAge(DOB DATE)
RETURNS DATE
DETERMINISTIC
BEGIN 
DECLARE Age INT;
    SET Age = YEAR(CURDATE()) - YEAR(DOB) - 
              (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(DOB, '%m%d'));
    RETURN Age;
END;

SELECT p.ID, p.Fname, CalculateAge(p.DOB) AS Age
FROM Persons p;

SELECT ID, Country_name, LENGTH(Country_name) AS NameLength
FROM Country;
select *from persons;

SELECT Country_name, LEFT(Country_name, 3) AS FirstThreeChars
FROM Country;
SELECT Country_name, LOWER(Country_name) AS CountryNameLower
FROM Country;
