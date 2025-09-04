--a stored procedure that will generate a student’s full result card:
--Show semester-wise GPA
--Show all enrolled courses with marks, grade, GPA
--Calculate overall CGPA
--Show rank in class
------------------------------------------------------------------------------
------------------------------------------------------------------------------
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



--Get a student’s full report card (for example, student 1 – Amit Sharma):
CALL sp_student_result_card(1);
CALL sp_student_result_card(18);
CALL sp_student_result_card(11);
CALL sp_student_result_card(12);
CALL sp_student_result_card(31);
CALL sp_student_result_card(14);

--This will return 5 result sets:
  --1.Student basic info
  --2.Semester-wise GPA
  --3.Detailed course-wise results
  --4.Overall CGPA
  --5.Class rank
