CREATE DATABASE SRP;

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
