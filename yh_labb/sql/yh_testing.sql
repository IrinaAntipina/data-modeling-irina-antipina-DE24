-- Get a list of all students with information about their classes and programs
SELECT s.stud_id, s.stud_name, s.stud_surname, s.stud_email, 
       c.class_name, p.prog_name
FROM "Students" s
JOIN "Class" c ON s.class_id = c.class_id
JOIN "Programm" p ON c.prog_code = p.prog_code
ORDER BY s.stud_id;

-- Find which education manager is responsible for which classes
SELECT em.em_name, em.em_surname, c.class_name, p.prog_name
FROM "EducationManager" em
JOIN "Class" c ON em.em_id = c.em_id
JOIN "Programm" p ON c.prog_code = p.prog_code
ORDER BY em.em_surname;

-- Get a list of courses for each program
SELECT p.prog_name, c.course_code, c.course_name, c.credits
FROM "Programm" p
JOIN "CourseProg" cp ON p.prog_code = cp.prog_code
JOIN "Course" c ON cp.course_code = c.course_code
ORDER BY p.prog_name, c.credits DESC;

-- Get a list of teachers and the courses they teach
SELECT t.teach_name, t.teach_surname, c.course_name, c.course_code
FROM "Teachers" t
JOIN "TeachCourse" tc ON t.teach_id = tc.teach_id
JOIN "Course" c ON tc.course_code = c.course_code
ORDER BY t.teach_surname;

-- Count the number of students in each class
SELECT c.class_name, COUNT(s.stud_id) AS student_count
FROM "Class" c
LEFT JOIN "Students" s ON c.class_id = s.class_id
GROUP BY c.class_name
ORDER BY c.class_name;

-- Find classes in Stockholm
SELECT c.class_name, p.prog_name, l.city
FROM "Class" c
JOIN "Programm" p ON c.prog_code = p.prog_code
JOIN "Location" l ON c.loc_id = l.loc_id
WHERE l.city = 'Stockholm';

-- Get information about consultant contracts
SELECT t.teach_name, t.teach_surname, cc.cc_name, con.start_date, con.end_date, con.hourly_rate
FROM "Contract" con
JOIN "Teachers" t ON con.teach_id = t.teach_id
JOIN "ConsultCompany" cc ON con.cc_id = cc.cc_id
WHERE t.is_consult = true;

-- Get a list of all standalone courses
SELECT course_code, course_name, credits, course_desc 
FROM "Course"
WHERE is_standalone = true
ORDER BY credits DESC;

-- Find teachers who teach standalone courses
SELECT t.teach_name, t.teach_surname, c.course_name
FROM "Teachers" t
JOIN "TeachCourse" tc ON t.teach_id = tc.teach_id
JOIN "Course" c ON tc.course_code = c.course_code
WHERE c.is_standalone = true
ORDER BY t.teach_surname;

-- Calculate the number of standard and standalone courses
SELECT
    CASE 
        WHEN is_standalone = true THEN 'Standalone Courses'
        ELSE 'Program Courses'
    END AS course_category,
    COUNT(*) AS count
FROM "Course"
GROUP BY is_standalone;
