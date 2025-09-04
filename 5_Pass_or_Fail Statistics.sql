SELECT 
    CASE WHEN g.gpa >= 2.0 THEN 'Pass' ELSE 'Fail' END AS status,
    COUNT(*) AS total_students
FROM Grades g
JOIN Enrollments e ON g.enrollment_id = e.enrollment_id
GROUP BY status;
