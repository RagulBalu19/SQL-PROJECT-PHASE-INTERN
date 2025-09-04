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
