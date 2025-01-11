Create database COMPANY;
USE COMPANY;

CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT(15),
    JoiningDate DATETIME,
    Department CHAR(25)
);

INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department) VALUES
(1, 'John', 'Doe', 50000, '2023-01-15 09:00:00', 'HR'),
(2, 'Jane', 'Smith', 60000, '2023-02-20 09:00:00', 'Finance'),
(3, 'Mike', 'Johnson', 55000, '2023-03-10 09:00:00', 'IT'),
(4, 'Emily', 'Davis', 70000, '2023-04-05 09:00:00', 'Marketing'),
(5, 'Chris', 'Brown', 45000, '2023-05-15 09:00:00', 'HR'),
(6, 'Anna', 'Wilson', 80000, '2023-06-25 09:00:00', 'Finance'),
(7, 'Tom', 'Taylor', 65000, '2023-07-30 09:00:00', 'IT'),
(8, 'Sara', 'Anderson', 72000, '2023-08-10 09:00:00', 'Marketing'),
(9, 'David', 'Thomas', 48000, '2023-09-15 09:00:00', 'HR'),
(10, 'Laura', 'Jackson', 53000, '2023-10-20 09:00:00', 'Finance');

#1
DELIMITER //

CREATE PROCEDURE AddWorker(
IN p_Worker_Id INT,
IN p_FirstName CHAR(25),
IN p_LastName CHAR(25),
IN p_Salary INT,
IN p_JoiningDate DATETIME,
IN p_Department CHAR(25)
)
BEGIN
INSERT INTO Worker(Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END //

DELIMITER ;

CALL AddWorker(11, 'Mark', 'Lee', 59000, '2023-11-01 09:00:00', 'IT');

#2

DELIMITER //

CREATE PROCEDURE GetSalaryByWorkerId(
    IN p_Worker_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary FROM Worker WHERE Worker_Id = p_Worker_Id;
END //

DELIMITER ;


SET @salary = 0;
CALL GetSalaryByWorkerId(1, @salary);
SELECT @salary AS Salary;

#3
DELIMITER //

CREATE PROCEDURE UpdateWorkerDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker SET Department = p_Department WHERE Worker_Id = p_Worker_Id;
END //

DELIMITER ;


CALL UpdateWorkerDepartment(1, 'Operations');

#4
DELIMITER //

CREATE PROCEDURE GetWorkerCountByDepartment(
    IN p_Department CHAR(25),
    OUT p_workerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_workerCount FROM Worker WHERE Department = p_Department;
END //

DELIMITER ;

SET @workerCount = 0;
CALL GetWorkerCountByDepartment('HR', @workerCount);
SELECT @workerCount AS WorkerCount;

#5
DELIMITER //

CREATE PROCEDURE GetAverageSalaryByDepartment(
    IN p_Department CHAR(25),
    OUT p_avgSalary DECIMAL(10,2)
)
BEGIN
    SELECT AVG(Salary) INTO p_avgSalary FROM Worker WHERE Department = p_Department;
END //

DELIMITER ;

SET @avgSalary = 0;
CALL GetAverageSalaryByDepartment('Finance', @avgSalary);
SELECT @avgSalary AS AverageSalary;
