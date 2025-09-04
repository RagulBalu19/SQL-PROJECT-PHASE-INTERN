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
