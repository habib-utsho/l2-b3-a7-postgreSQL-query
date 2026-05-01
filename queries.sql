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
SELECT student_name
FROM
    enrollment
    JOIN students ON enrollment.student_id = students.student_id
    JOIN courses ON enrollment.course_id = courses.course_id
where
    course_name = 'Next.js'

-- Query 3:
-- Update the status of the student with the highest total (frontend_mark + backend_mark) to 'Awarded'.

UPDATE students
SET
    status = 'Awarded'
WHERE
    student_id = (
        SELECT student_id
        FROM students
        GROUP BY
            student_id
        ORDER BY sum(frontend_mark + backend_mark) DESC
        LIMIT 1
    )

-- Query 4:
-- Delete all courses that have no students enrolled.
SELECT * FROM courses

DELETE FROM courses
WHERE
    NOT EXISTS (
        SELECT 1
        FROM enrollment
        WHERE
            courses.course_id = enrollment.course_id
    );

SELECT *
FROM courses
    left JOIN enrollment ON enrollment.course_id = courses.course_id
WHERE
    enrollment is NULL

-- Query 5:
-- Retrieve the names of students using a limit of 2, starting from the 3rd student.
SELECT student_name FROM students OFFSET 3 LIMIT 2;

-- Query 6:
-- Retrieve the course names and the number of students enrolled in each course.

select course_name, count(*)
FROM
    enrollment
    JOIN students ON enrollment.student_id = students.student_id
    JOIN courses ON enrollment.course_id = courses.course_id
GROUP BY
    course_name
ORDER BY count DESC

-- Query 7:
-- Calculate and display the average age of all students.

select ROUND(
        (
            extract(
                YEAR
                FROM avg(age (dob))
            ) + extract(
                MONTH
                FROM avg(age (dob))
            ) / 12.0
        )::NUMERIC, 2
    ) as avg_age
from students;

-- Query 8:
-- Retrieve the names of students whose email addresses contain 'example.com'.
SELECT student_name, email
FROM students
WHERE
    email LIKE '%example.com%';