USE SCHOOL;

#1
CREATE TABLE teachers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    subject VARCHAR(100),
    experience INT,
    salary DECIMAL(10, 2)
);

INSERT INTO teachers (name, subject, experience, salary) VALUES
('Alice Johnson', 'Mathematics', 5, 50000.00),
('Bob Smith', 'Science', 8, 55000.00),
('Charlie Brown', 'History', 12, 60000.00),
('Diana Prince', 'Literature', 3, 45000.00),
('Ethan Hunt', 'Physics', 7, 52000.00),
('Fiona Apple', 'Music', 4, 48000.00),
('George Lucas', 'Art', 15, 70000.00),
('Hannah Montana', 'Drama', 2, 40000.00);

#2
DELIMITER //

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'salary cannot be negative';
    END IF;
END;

//

DELIMITER ;
#3
CREATE TABLE teacher_log (
    teacher_id INT,
    action VARCHAR(50),
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (teacher_id) REFERENCES teachers(id)
);

DELIMITER //

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete teacher with more than 10 years of experience';
    END IF;
END;

//

DELIMITER ;

DELIMITER //

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action) VALUES (OLD.id, 'DELETE');
END;

//

DELIMITER ;