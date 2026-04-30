-- Query 1
-- Insert a new student record with the following details:
INSERT INTO
    students (
        student_name,
        dob,
        email,
        frontend_mark,
        backend_mark,
        status
    )
VALUES (
        'Utsho',
        '2000-05-05',
        'habibutsho.ph@gmail.com',
        50,
        60,
        NULL
    )

SELECT * FROM students;

-- Query 2:
-- Retrieve the names of all students who are enrolled in the course titled 'Next.js'.
SELECT student_name FROM enrollment
JOIN students ON enrollment.student_id = students.student_id
JOIN courses ON enrollment.course_id = courses.course_id
where course_name = 'Next.js'

-- Query 3:
-- Update the status of the student with the highest total (frontend_mark + backend_mark) to 'Awarded'.