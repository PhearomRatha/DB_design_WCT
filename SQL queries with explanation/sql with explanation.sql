-- 1. Retrieve all students who enrolled in a specific course.
-- To retrieve all students enrolled in a specific course (e.g., course with code "CS101"):
SELECT 
    s.first_name AS student_first_name,s.last_name AS student_last_name,
    c.course_code,c.course_name,e.enrollment_date,e.grade
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_code = 'CS101';

-- 2. Find all faculty members in a particular department.
-- To find all faculty members in a specific department (e.g., "Computer Science"):
SELECT 
    f.first_name AS faculty_first_name,
    f.last_name AS faculty_last_name,
    d.department_name
FROM Faculty f
JOIN Departments d ON f.department_id = d.department_id
WHERE d.department_name = 'Computer Science';


-- 3. List all courses a particular student is enrolled in.
-- To list all courses a particular student is enrolled in (e.g., student with student_id 1):

SELECT 
    c.course_code,
    c.course_name,
    e.enrollment_date,
    e.grade
FROM Enrollments e
JOIN Courses c ON e.course_id = c.course_id
WHERE e.student_id = 1;
-- 4. Retrieve students who have not enrolled in any course.
-- To retrieve all students who have not enrolled in any course:

SELECT 
    s.first_name AS student_first_name,
    s.last_name AS student_last_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.student_id IS NULL;

-- 5. Find the average grade of students in a specific course.
-- To find the average grade of students in a specific course (e.g., course with course_code 'CS101'):
SELECT 
    c.course_code,
    c.course_name,
    AVG(CASE
        WHEN e.grade = 'A' THEN 4.0
        WHEN e.grade = 'B' THEN 3.0
        WHEN e.grade = 'C' THEN 2.0
        WHEN e.grade = 'D' THEN 1.0
        WHEN e.grade = 'F' THEN 0.0
        ELSE NULL
    END) AS average_grade
FROM Enrollments e
JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_code = 'CS101'
GROUP BY c.course_code, c.course_name;







