INSERT INTO "Location" ("city", "address") VALUES 
  ('Stockholm', 'Kungsgatan 65, 11122'),
  ('Göteborg', 'Avenyn 12, 41103');


INSERT INTO "Programm" ("prog_code", "prog_name", "prog_desc") VALUES 
  ('FSDEV', 'Full Stack Development', 'Comprehensive program covering both frontend and backend development technologies'),
  ('DATSC', 'Data Science', 'Program focused on data analysis, machine learning and AI applications');


INSERT INTO "ProgLoc" ("prog_code", "loc_id") VALUES 
  ('FSDEV', 1),
  ('FSDEV', 2),
  ('DATSC', 1),
  ('DATSC', 2);


INSERT INTO "Course" ("course_code", "course_name", "credits", "course_desc", "is_standalone") VALUES 
  ('WEB101', 'Web Development Basics', 30, 'Introduction to HTML, CSS and JavaScript', false),
  ('DB201', 'Database Design', 20, 'Relational databases, SQL and data modeling', false),
  ('STAT301', 'Statistics for Data Science', 25, 'Statistical methods and their applications in data analysis', false),
  ('PYTHON101', 'Python Programming Fundamentals', 15, 'Basic programming concepts using Python language', true),
  ('UX101', 'UX/UI Design Basics', 10, 'Introduction to user experience and interface design principles', true);


INSERT INTO "CourseProg" ("course_code", "prog_code") VALUES 
  ('WEB101', 'FSDEV'),
  ('DB201', 'FSDEV'),
  ('DB201', 'DATSC'),
  ('STAT301', 'DATSC');
  -- Note: Standalone courses aren't linked to any program


INSERT INTO "EducationManager" ("em_name", "em_surname", "em_email") VALUES 
  ('Maria', 'Johansson', 'maria.johansson@yrkesco.se');


INSERT INTO "Class" ("class_name", "prog_code", "em_id", "loc_id") VALUES 
  ('A-2023', 'FSDEV', 1, 1),
  ('B-2023', 'DATSC', 1, 2),
  ('A-2024', 'FSDEV', 1, 1),
  ('B-2024', 'DATSC', 1, 2);


INSERT INTO "Teachers" ("teach_name", "teach_surname", "teach_email", "teach_type", "is_consult") VALUES 
  ('Erik', 'Andersson', 'erik.andersson@yrkesco.se', 'Senior Lecturer', false),
  ('Anna', 'Lindberg', 'anna.lindberg@consult.se', 'Guest Lecturer', true),
  ('Jonas', 'Bergström', 'jonas.bergstrom@yrkesco.se', 'Senior Lecturer', false);


INSERT INTO "ConsultCompany" ("cc_name", "cc_number", "f_skatt", "address") VALUES 
  ('Tech Consultants AB', '556789-1234', true, 'Storgatan 45, Stockholm');


INSERT INTO "Contract" ("start_date", "end_date", "hourly_rate", "cc_id", "teach_id", "loc_id") VALUES 
  ('2023-01-15', '2025-12-31', 850.00, 1, 2, 1);


INSERT INTO "TeachCourse" ("teach_id", "course_code") VALUES 
  (1, 'WEB101'),
  (1, 'DB201'),
  (2, 'STAT301'),
  (2, 'DB201'),
  (3, 'PYTHON101'),
  (3, 'UX101');


INSERT INTO "PersEM" ("em_id", "em_pn") VALUES 
  (1, '197505121234');


INSERT INTO "PersTeacher" ("teach_id", "teach_pn") VALUES 
  (1, '198012151234'),
  (2, '197708231234'),
  (3, '198505041234');


INSERT INTO "Students" ("stud_name", "stud_surname", "stud_email", "class_id") VALUES 
  ('Johan', 'Svensson', 'johan.svensson@student.se', 1),
  ('Emma', 'Nilsson', 'emma.nilsson@student.se', 1),
  ('Oscar', 'Eriksson', 'oscar.eriksson@student.se', 1),
  ('Lisa', 'Larsson', 'lisa.larsson@student.se', 1),
  ('Simon', 'Björk', 'simon.bjork@student.se', 1),
  
  ('Sofia', 'Lundgren', 'sofia.lundgren@student.se', 2),
  ('Alexander', 'Bergman', 'alexander.bergman@student.se', 2),
  ('Elin', 'Ek', 'elin.ek@student.se', 2),
  ('Lucas', 'Lind', 'lucas.lind@student.se', 2),
  ('Amanda', 'Holm', 'amanda.holm@student.se', 2),
  
  ('Gustav', 'Gustafsson', 'gustav.gustafsson@student.se', 3),
  ('Maja', 'Malmström', 'maja.malmstrom@student.se', 3),
  ('Viktor', 'Vinter', 'viktor.vinter@student.se', 3),
  ('Hanna', 'Holmberg', 'hanna.holmberg@student.se', 3),
  ('Axel', 'Axelsson', 'axel.axelsson@student.se', 3),
  
  ('Klara', 'Karlsson', 'klara.karlsson@student.se', 4),
  ('Nils', 'Nordin', 'nils.nordin@student.se', 4),
  ('Isabelle', 'Isaksson', 'isabelle.isaksson@student.se', 4),
  ('Felix', 'Fransson', 'felix.fransson@student.se', 4),
  ('Julia', 'Jakobsson', 'julia.jakobsson@student.se', 4);


INSERT INTO "PersStudent" ("stud_id", "stud_pn") VALUES 
  (1, '200001011234'),
  (2, '200002021234'),
  (3, '200003031234'),
  (4, '200004041234'),
  (5, '200005051234'),
  (6, '200006061234'),
  (7, '200007071234'),
  (8, '200008081234'),
  (9, '200009091234'),
  (10, '200010101234'),
  (11, '200111111234'),
  (12, '200112121234'),
  (13, '200101131234'),
  (14, '200101141234'),
  (15, '200101151234'),
  (16, '200201161234'),
  (17, '200201171234'),
  (18, '200201181234'),
  (19, '200201191234'),
  (20, '200201201234');