CREATE database SRP;


USE SRP;


CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50)
);


CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT NOT NULL
);


CREATE TABLE Semesters (
    semester_id INT PRIMARY KEY,
    semester_name VARCHAR(50),
    year INT
);


CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    semester_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (semester_id) REFERENCES Semesters(semester_id)
);


CREATE TABLE Grades (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,
    enrollment_id INT,
    marks INT,
    grade CHAR(2),
    gpa FLOAT,
    FOREIGN KEY (enrollment_id) REFERENCES Enrollments(enrollment_id)
);


INSERT INTO Students (student_id, name, department) VALUES
(1, 'Amit Sharma', 'CSE'),
(2, 'Neha Verma', 'ECE'),
(3, 'Rohit Kumar', 'ME'),
(4, 'Priya Singh', 'CSE'),
(5, 'Vikram Patel', 'EEE'),
(6, 'Sneha Nair', 'IT'),
(7, 'Arjun Mehta', 'CSE'),
(8, 'Pooja Rani', 'ECE'),
(9, 'Karan Gupta', 'ME'),
(10, 'Simran Kaur', 'IT'),
(11, 'Rahul Joshi', 'CSE'),
(12, 'Divya Menon', 'ECE'),
(13, 'Ankit Yadav', 'ME'),
(14, 'Meena Kumari', 'EEE'),
(15, 'Saurabh Mishra', 'IT'),
(16, 'Shweta Jain', 'CSE'),
(17, 'Deepak Singh', 'ECE'),
(18, 'Riya Sinha', 'ME'),
(19, 'Abhishek Das', 'EEE'),
(20, 'Komal Thakur', 'IT'),
(21, 'Mohit Rana', 'CSE'),
(22, 'Anjali Pandey', 'ECE'),
(23, 'Sandeep Rai', 'ME'),
(24, 'Kavita Ghosh', 'EEE'),
(25, 'Harsh Vardhan', 'IT'),
(26, 'Manish Kumar', 'CSE'),
(27, 'Swati Agarwal', 'ECE'),
(28, 'Rajeev Ranjan', 'ME'),
(29, 'Tanya Kapoor', 'EEE'),
(30, 'Nitin Malhotra', 'IT'),
(31, 'Akhil Reddy', 'CSE'),
(32, 'Sonali Mishra', 'ECE'),
(33, 'Aditya Prasad', 'ME'),
(34, 'Geeta Devi', 'EEE'),
(35, 'Mayank Arora', 'IT'),
(36, 'Pallavi Singh', 'CSE'),
(37, 'Tarun Khanna', 'ECE'),
(38, 'Jyoti Sharma', 'ME'),
(39, 'Rakesh Chauhan', 'EEE'),
(40, 'Nisha Rathore', 'IT'),
(41, 'Umesh Jha', 'CSE'),
(42, 'Alka Verma', 'ECE'),
(43, 'Ashish Bansal', 'ME'),
(44, 'Rekha Patil', 'EEE'),
(45, 'Chetan Garg', 'IT'),
(46, 'Poonam Saxena', 'CSE'),
(47, 'Aadesh Rawat', 'ECE'),
(48, 'Monika Yadav', 'ME'),
(49, 'Gaurav Sharma', 'EEE'),
(50, 'Kirti Chauhan', 'IT');


-- Insert 50 Courses
INSERT INTO Courses (course_id, course_name, credits) VALUES
(101, 'Data Structures', 4),
(102, 'Digital Electronics', 3),
(103, 'Thermodynamics', 3),
(104, 'Database Systems', 4),
(105, 'Operating Systems', 4),
(106, 'Computer Networks', 3),
(107, 'Software Engineering', 3),
(108, 'Artificial Intelligence', 4),
(109, 'Machine Learning', 4),
(110, 'Computer Graphics', 3),
(111, 'Compiler Design', 4),
(112, 'Cyber Security', 3),
(113, 'Cloud Computing', 3),
(114, 'Big Data Analytics', 4),
(115, 'Microprocessors', 3),
(116, 'VLSI Design', 3),
(117, 'Signal Processing', 3),
(118, 'Embedded Systems', 4),
(119, 'Robotics', 4),
(120, 'IoT Fundamentals', 3),
(121, 'Renewable Energy', 3),
(122, 'Fluid Mechanics', 3),
(123, 'Heat Transfer', 3),
(124, 'Automobile Engineering', 4),
(125, 'Manufacturing Tech', 3),
(126, 'Material Science', 3),
(127, 'Power Electronics', 3),
(128, 'Control Systems', 4),
(129, 'Electrical Machines', 3),
(130, 'HVDC Systems', 3),
(131, 'Computer Vision', 4),
(132, 'Data Mining', 3),
(133, 'Mobile Computing', 3),
(134, 'Distributed Systems', 4),
(135, 'Blockchain Basics', 3),
(136, 'Quantum Computing', 4),
(137, 'Bioinformatics', 3),
(138, 'Game Development', 3),
(139, 'Parallel Computing', 4),
(140, 'Neural Networks', 4),
(141, 'Ethical Hacking', 3),
(142, 'Augmented Reality', 3),
(143, 'Virtual Reality', 4),
(144, 'Web Development', 4),
(145, 'Cloud Architecture', 3),
(146, 'Data Privacy', 3),
(147, 'E-Commerce Systems', 3),
(148, 'Digital Marketing', 3),
(149, 'Entrepreneurship', 3),
(150, 'Project Management', 3);


-- Insert 8 Semesters (realistic)
INSERT INTO Semesters (semester_id, semester_name, year) VALUES
(1, 'Semester 1', 2020),
(2, 'Semester 2', 2020),
(3, 'Semester 3', 2021),
(4, 'Semester 4', 2021),
(5, 'Semester 5', 2022),
(6, 'Semester 6', 2022),
(7, 'Semester 7', 2023),
(8, 'Semester 8', 2023);


-- Insert 50 Enrollments (mapped cyclically to 8 semesters)
INSERT INTO Enrollments (student_id, course_id, semester_id) VALUES
(1, 101, 1),
(2, 102, 2),
(3, 103, 3),
(4, 104, 4),
(5, 105, 5),
(6, 106, 6),
(7, 107, 7),
(8, 108, 8),
(9, 109, 1),
(10, 110, 2),
(11, 111, 3),
(12, 112, 4),
(13, 113, 5),
(14, 114, 6),
(15, 115, 7),
(16, 116, 8),
(17, 117, 1),
(18, 118, 2),
(19, 119, 3),
(20, 120, 4),
(21, 121, 5),
(22, 122, 6),
(23, 123, 7),
(24, 124, 8),
(25, 125, 1),
(26, 126, 2),
(27, 127, 3),
(28, 128, 4),
(29, 129, 5),
(30, 130, 6),
(31, 131, 7),
(32, 132, 8),
(33, 133, 1),
(34, 134, 2),
(35, 135, 3),
(36, 136, 4),
(37, 137, 5),
(38, 138, 6),
(39, 139, 7),
(40, 140, 8),
(41, 141, 1),
(42, 142, 2),
(43, 143, 3),
(44, 144, 4),
(45, 145, 5),
(46, 146, 6),
(47, 147, 7),
(48, 148, 8),
(49, 149, 1),
(50, 150, 2);


-- Insert 50 Grades (corrected grading scale)
INSERT INTO Grades (enrollment_id, marks, grade, gpa) VALUES
(1, 85, 'A', 4.0),
(2, 78, 'B+', 3.5),
(3, 92, 'A+', 4.0),
(4, 65, 'C', 2.0),
(5, 70, 'B', 3.0),
(6, 88, 'A', 4.0),
(7, 55, 'D', 1.5),
(8, 74, 'B', 3.0),
(9, 81, 'A-', 3.7),
(10, 95, 'A+', 4.0),
(11, 67, 'C+', 2.3),
(12, 72, 'B', 3.0),
(13, 89, 'A', 4.0),
(14, 91, 'A+', 4.0),
(15, 76, 'B+', 3.5),
(16, 64, 'C', 2.0),
(17, 59, 'D', 1.5),
(18, 82, 'A-', 3.7),
(19, 73, 'B', 3.0),
(20, 87, 'A', 4.0),
(21, 60, 'D', 1.5),
(22, 71, 'B', 3.0),
(23, 84, 'A-', 3.7),
(24, 68, 'C+', 2.3),
(25, 79, 'B+', 3.5),
(26, 93, 'A+', 4.0),
(27, 66, 'C', 2.0),
(28, 90, 'A+', 4.0),
(29, 58, 'D', 1.5),
(30, 83, 'A-', 3.7),
(31, 74, 'B', 3.0),
(32, 62, 'C', 2.0),  
(33, 86, 'A', 4.0),
(34, 69, 'C+', 2.3),
(35, 94, 'A+', 4.0),
(36, 61, 'D', 1.5),
(37, 77, 'B+', 3.5),
(38, 80, 'B+', 3.5),
(39, 56, 'D', 1.5),
(40, 75, 'B', 3.0),
(41, 88, 'A', 4.0),
(42, 63, 'C', 2.0),
(43, 96, 'A+', 4.0),
(44, 54, 'F', 0.0),
(45, 85, 'A', 4.0),
(46, 72, 'B', 3.0),
(47, 89, 'A', 4.0),
(48, 66, 'C', 2.0),
(49, 78, 'B+', 3.5),
(50, 91, 'A+', 4.0);


SELECT * FROM STUDENTS;
SELECT * FROM COURSES;
SELECT * FROM SEMESTERS;
SELECT * FROM ENROLLMENTS;
select * FROM GRADES;


-- Calculate GPA per Student (Semester-wise) Query:
SELECT 
    s.student_id,
    s.name,
    sem.semester_name,
    ROUND(SUM(g.gpa * c.credits) / SUM(c.credits), 2) AS semester_gpa
FROM Grades g
JOIN Enrollments e ON g.enrollment_id = e.enrollment_id
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id
JOIN Semesters sem ON e.semester_id = sem.semester_id
GROUP BY s.student_id, sem.semester_id
ORDER BY s.student_id, sem.semester_id;


-- Calculate CGPA (Overall GPA) Query:
SELECT 
    s.student_id,
    s.name,
    ROUND(SUM(g.gpa * c.credits) / SUM(c.credits), 2) AS cgpa
FROM Grades g
JOIN Enrollments e ON g.enrollment_id = e.enrollment_id
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id
GROUP BY s.student_id
ORDER BY cgpa DESC;


-- Pass or Fail Statistics Query:
SELECT 
    CASE WHEN g.gpa >= 2.0 THEN 'Pass' ELSE 'Fail' END AS status,
    COUNT(*) AS total_students
FROM Grades g
JOIN Enrollments e ON g.enrollment_id = e.enrollment_id
GROUP BY status;


-- Rank List using Window Functions Query:
SELECT 
    s.student_id,
    s.name,
    ROUND(SUM(g.gpa * c.credits) / SUM(c.credits), 2) AS cgpa,
    RANK() OVER (ORDER BY SUM(g.gpa * c.credits) / SUM(c.credits) DESC) AS rank_position
FROM Grades g
JOIN Enrollments e ON g.enrollment_id = e.enrollment_id
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id
GROUP BY s.student_id, s.name;


-- Trigger for GPA Calculation Query:
DELIMITER $$

CREATE TRIGGER trg_calculate_gpaa
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


-- Semester-wise Result Summary Query:
SELECT 
    sem.semester_name,
    COUNT(DISTINCT s.student_id) AS total_students,
    ROUND(AVG(g.gpa), 2) AS avg_gpa,
    SUM(CASE WHEN g.gpa >= 2.0 THEN 1 ELSE 0 END) AS pass_count,
    SUM(CASE WHEN g.gpa < 2.0 THEN 1 ELSE 0 END) AS fail_count
FROM Grades g
JOIN Enrollments e ON g.enrollment_id = e.enrollment_id
JOIN Students s ON e.student_id = s.student_id
JOIN Semesters sem ON e.semester_id = sem.semester_id
GROUP BY sem.semester_id
ORDER BY sem.semester_id;


-- Stored Procedure: sp_student_result_card Query: 
DELIMITER $$

CREATE PROCEDURE sp_student_result_card(IN p_student_id INT)
BEGIN
    -- 1. Student Basic Info
    SELECT 
        s.student_id, 
        s.name, 
        s.department
    FROM Students s
    WHERE s.student_id = p_student_id;

    -- 2. Semester-wise GPA
    SELECT 
        sem.semester_name,
        ROUND(SUM(g.gpa * c.credits) / SUM(c.credits), 2) AS semester_gpa
    FROM Grades g
    JOIN Enrollments e ON g.enrollment_id = e.enrollment_id
    JOIN Courses c ON e.course_id = c.course_id
    JOIN Semesters sem ON e.semester_id = sem.semester_id
    WHERE e.student_id = p_student_id
    GROUP BY sem.semester_id
    ORDER BY sem.semester_id;

    -- 3. Detailed Course-wise Results
    SELECT 
        sem.semester_name,
        c.course_name,
        c.credits,
        g.marks,
        g.grade,
        g.gpa
    FROM Grades g
    JOIN Enrollments e ON g.enrollment_id = e.enrollment_id
    JOIN Courses c ON e.course_id = c.course_id
    JOIN Semesters sem ON e.semester_id = sem.semester_id
    WHERE e.student_id = p_student_id
    ORDER BY sem.semester_id, c.course_id;

    -- 4. Overall CGPA
    SELECT 
        ROUND(SUM(g.gpa * c.credits) / SUM(c.credits), 2) AS cgpa
    FROM Grades g
    JOIN Enrollments e ON g.enrollment_id = e.enrollment_id
    JOIN Courses c ON e.course_id = c.course_id
    WHERE e.student_id = p_student_id;

    -- 5. Rank in Class (based on CGPA)
    SELECT 
        ranked.student_id,
        ranked.name,
        ranked.cgpa,
        ranked.rank_position
    FROM (
        SELECT 
            s.student_id,
            s.name,
            ROUND(SUM(g.gpa * c.credits) / SUM(c.credits), 2) AS cgpa,
            RANK() OVER (ORDER BY SUM(g.gpa * c.credits) / SUM(c.credits) DESC) AS rank_position
        FROM Students s
        JOIN Enrollments e ON s.student_id = e.student_id
        JOIN Grades g ON e.enrollment_id = g.enrollment_id
        JOIN Courses c ON e.course_id = c.course_id
        GROUP BY s.student_id, s.name
    ) ranked
    WHERE ranked.student_id = p_student_id;
END$$

DELIMITER ;


-- This query Shows five set of Results for each student record we enter in the query  [for Example: CALL sp_student_result_card(21)] this 21 id refer Mohit Rana’s data
CALL sp_student_result_card(21);
