# Student Result Processing System

## Abstract
The Student Result Processing System (SRP) is designed to manage and analyze academic records efficiently.  
It stores details of students, courses, semesters, enrollments, and grades, enabling GPA calculation, pass/fail statistics, and rank generation.  
The project automates result management, reducing manual effort and ensuring accuracy.

---

## Introduction
Academic institutions handle large volumes of student data each semester.  
Managing results manually is error-prone and time-consuming.  
The SRP system automates this by using SQL to store, process, and retrieve information about student performance.  
It helps administrators and faculty generate reports, analyze academic progress, and rank students effectively.

---

## Tools Used
- **MySQL**: For database creation and management  
- **SQL Queries**: For GPA, pass/fail, and ranking reports  
- **Triggers & Stored Procedures**: For automated GPA calculation and result generation  
- **Report Generation Tools**: To prepare structured result summaries  

---

## Steps Involved in Building the Project
1. Designed schema with five main tables: **Students, Courses, Semesters, Enrollments, and Grades**  
2. Inserted sample data for 50 students, 50 courses, and 50 semesters  
3. Established relationships between tables using **primary and foreign keys**  
4. Implemented SQL queries for GPA calculation, pass/fail statistics, and ranking  
5. Created **triggers** to automate GPA assignment during grade insertion  
6. Developed **stored procedures** to generate detailed student result cards and semester summaries  

---

## ER Diagram (Conceptual Representation)
- **Students** → Linked to Enrollments  
- **Courses** → Linked to Enrollments  
- **Semesters** → Linked to Enrollments  
- **Enrollments** → Acts as a bridge between Students, Courses, and Semesters  
- **Grades** → Linked to Enrollments for storing marks, grade, and GPA  

---

## Conclusion
The Student Result Processing System simplifies academic result management by automating calculations and reports.  
It enhances efficiency, reduces manual workload, and ensures accuracy in student performance evaluation.  
This project demonstrates the practical application of SQL in real-world academic systems and can be extended with a front-end for broader usability.
