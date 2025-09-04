--Automatically update GPA when marks are inserted.

DELIMITER $$

CREATE TRIGGER trg_calculate_gpa
BEFORE INSERT ON Grades
FOR EACH ROW
BEGIN
    IF NEW.marks >= 90 THEN 
        SET NEW.grade = 'A+', NEW.gpa = 4.0;
    ELSEIF NEW.marks >= 80 THEN 
        SET NEW.grade = 'A', NEW.gpa = 4.0;
    ELSEIF NEW.marks >= 75 THEN 
        SET NEW.grade = 'B+', NEW.gpa = 3.5;
    ELSEIF NEW.marks >= 70 THEN 
        SET NEW.grade = 'B', NEW.gpa = 3.0;
    ELSEIF NEW.marks >= 65 THEN 
        SET NEW.grade = 'C+', NEW.gpa = 2.3;
    ELSEIF NEW.marks >= 60 THEN 
        SET NEW.grade = 'C', NEW.gpa = 2.0;
    ELSEIF NEW.marks >= 55 THEN 
        SET NEW.grade = 'D', NEW.gpa = 1.5;
    ELSE 
        SET NEW.grade = 'F', NEW.gpa = 0.0;
    END IF;
END$$

DELIMITER ;
