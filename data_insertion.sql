-- Active: 1776581529734@@127.0.0.1@5432@university_db
CREATE Table students (
    student_id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    student_name VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    frontend_mark INT NOT NULL,
    backend_mark INT NOT NULL,
    status VARCHAR(20) CHECK (
        status IN ('passed', 'failed', 'pending')
    )
)

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
        'Sameer',
        '2000-01-01',
        'sameer@example.com',
        48,
        60,
        NULL
    ),
    (
        'Zoya',
        '2001-2-12',
        'zoya@example.com',
        52,
        58,
        NULL
    ),
    (
        'Nabil',
        '2000-06-21',
        'nabil@example.com',
        37,
        46,
        NULL
    ),
    (
        'Rafi',
        '2002-05-21',
        'rafi@example.com',
        41,
        40,
        NULL
    ),
    (
        'Sophia',
        '2001-02-11',
        'sophia@example.com',
        50,
        52,
        NULL
    ),
    (
        'Hasan',
        '2001-06-12',
        'hasan@gmail.com',
        43,
        39,
        NULL
    )

SELECT * FROM students;

CREATE Table courses (
    course_id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    course_name VARCHAR(50) UNIQUE NOT NULL,
    credits INT NOT NULL
)

INSERT INTO
    courses (course_name, credits)
VALUES ('Next.js', 3),
    ('React.js', 4),
    ('Database', 3),
    ('Prisma', 3)

SELECT * FROM courses;

CREATE Table enrollment (
    enrollment UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    student_id UUID REFERENCES students ("student_id") NOT NULL,
    course_id UUID REFERENCES courses ("course_id") NOT NULL
)

INSERT INTO
    enrollment (student_id, course_id)
values (
        'a7e4e939-7922-43c3-9e98-a04b3d808803',
        '25ce8e2a-49b7-496d-a52f-f71a8990e017'
    ),
    (
        'c35e7ede-9939-4d16-92dd-5d19c2565347',
        '5f36e4d1-6f85-4b31-af9e-d4362629672a'
    ),
    (
        'a51112f1-93cf-40eb-b8a4-6c9121df8e77',
        '3cd59a24-3fd9-4b77-9aa3-48428048566b'
    )

SELECT enrollment.*, students.student_name, age (now(), students.dob), students.email, courses.course_name, courses.credits
FROM
    enrollment
    JOIN students ON students.student_id = enrollment.student_id
    JOIN courses ON courses.course_id = enrollment.course_id