-- Adding a new location Malmö
INSERT INTO "Location" ("city", "address") VALUES 
  ('Malmö', 'Stortorget 8, 21134')
ON CONFLICT ("address") DO NOTHING;

SELECT * FROM "Location";
 
-- Adding a full-time teacher (not a consultant)
INSERT INTO "Teachers" ("teach_name", "teach_surname", "teach_email", "teach_type", "is_consult") VALUES
  ('Helena', 'Ekström', 'helena.ekstrom@yrkesco.se', 'Senior Lecturer', false)
ON CONFLICT ("teach_email") DO NOTHING;

-- Adding personal data for a new teacher
INSERT INTO "PersTeacher" ("teach_id", "teach_pn") 
SELECT "teach_id", '197603151234'
FROM "Teachers" 
WHERE "teach_email" = 'helena.ekstrom@yrkesco.se'
AND NOT EXISTS (
    SELECT 1 FROM "PersTeacher" 
    WHERE "teach_pn" = '197603151234'
);

SELECT * FROM "Teachers";

-- Adding a new standalone course
INSERT INTO "Course" ("course_code", "course_name", "credits", "course_desc", "is_standalone") VALUES 
  ('AI101', 'Introduction to Artificial Intelligence', 15, 'Basic concepts of AI, machine learning, and neural networks', true)
ON CONFLICT ("course_code") DO NOTHING;

-- Assigning a teacher to a new standalone course
INSERT INTO "TeachCourse" ("teach_id", "course_code") 
SELECT t."teach_id", 'AI101'
FROM "Teachers" t
WHERE t."teach_email" = 'helena.ekstrom@yrkesco.se'
AND NOT EXISTS (
    SELECT 1 FROM "TeachCourse" 
    WHERE "teach_id" = t."teach_id" AND "course_code" = 'AI101'
);

-- Checking 
SELECT c.course_code, c.course_name, c.is_standalone, t.teach_name, t.teach_surname
FROM "Course" c
JOIN "TeachCourse" tc ON c.course_code = tc.course_code
JOIN "Teachers" t ON tc.teach_id = t.teach_id
WHERE c.course_code = 'AI101';

-- Checking all standalone courses 
SELECT course_code, course_name, credits, is_standalone
FROM "Course"
WHERE is_standalone = true
ORDER BY course_name;