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
