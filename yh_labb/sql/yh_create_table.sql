CREATE TABLE "EducationManager" (
  "em_id" SERIAL PRIMARY KEY,
  "em_name" VARCHAR(100) NOT NULL,
  "em_surname" VARCHAR(100) NOT NULL,
  "em_email" VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE "PersEM" (
  "pem_id" SERIAL PRIMARY KEY,
  "em_id" INTEGER NOT NULL,
  "em_pn" VARCHAR(20) UNIQUE NOT NULL,
  CONSTRAINT "FK_PersEM.em_id"
    FOREIGN KEY ("em_id")
      REFERENCES "EducationManager"("em_id")
);

CREATE TABLE "ConsultCompany" (
  "cc_id" SERIAL PRIMARY KEY,
  "cc_name" VARCHAR(100) NOT NULL,
  "cc_number" VARCHAR(50) NOT NULL,
  "f_skatt" BOOLEAN NOT NULL,
  "address" VARCHAR(200) UNIQUE NOT NULL
);

CREATE TABLE "Location" (
  "loc_id" SERIAL PRIMARY KEY,
  "city" VARCHAR(100) NOT NULL,
  "address" VARCHAR(200) UNIQUE NOT NULL
);

CREATE TABLE "Programm" (
  "prog_code" VARCHAR(20) PRIMARY KEY,
  "prog_name" VARCHAR(100) NOT NULL,
  "prog_desc" TEXT
);

CREATE TABLE "ProgLoc" (
  "pl_id" SERIAL PRIMARY KEY,
  "prog_code" VARCHAR(20) NOT NULL,
  "loc_id" INTEGER NOT NULL,
  CONSTRAINT "FK_ProgLoc.prog_code"
    FOREIGN KEY ("prog_code")
      REFERENCES "Programm"("prog_code"),
  CONSTRAINT "FK_ProgLoc.loc_id"
    FOREIGN KEY ("loc_id")
      REFERENCES "Location"("loc_id")
);

CREATE TABLE "Course" (
  "course_code" VARCHAR(20) PRIMARY KEY,
  "course_name" VARCHAR(100) NOT NULL,
  "credits" INTEGER NOT NULL,
  "course_desc" TEXT,
  "is_standalone" BOOLEAN DEFAULT FALSE NOT NULL
);

CREATE TABLE "CourseProg" (
  "cp_id" SERIAL PRIMARY KEY,
  "course_code" VARCHAR(20) NOT NULL,
  "prog_code" VARCHAR(20) NOT NULL,
  CONSTRAINT "FK_CourseProg.course_code"
    FOREIGN KEY ("course_code")
      REFERENCES "Course"("course_code"),
  CONSTRAINT "FK_CourseProg.prog_code"
    FOREIGN KEY ("prog_code")
      REFERENCES "Programm"("prog_code")
);

CREATE TABLE "Class" (
  "class_id" SERIAL PRIMARY KEY,
  "class_name" VARCHAR(100) NOT NULL,
  "prog_code" VARCHAR(20) NOT NULL,
  "em_id" INTEGER NOT NULL,
  "loc_id" INTEGER NOT NULL,
  CONSTRAINT "FK_Class.prog_code"
    FOREIGN KEY ("prog_code")
      REFERENCES "Programm"("prog_code"),
  CONSTRAINT "FK_Class.em_id"
    FOREIGN KEY ("em_id")
      REFERENCES "EducationManager"("em_id"),
  CONSTRAINT "FK_Class.loc_id"
    FOREIGN KEY ("loc_id")
      REFERENCES "Location"("loc_id")
);

CREATE TABLE "Students" (
  "stud_id" SERIAL PRIMARY KEY,
  "stud_name" VARCHAR(100) NOT NULL,
  "stud_surname" VARCHAR(100) NOT NULL,
  "stud_email" VARCHAR(100) UNIQUE NOT NULL,
  "class_id" INTEGER NOT NULL,
  CONSTRAINT "FK_Students.class_id"
    FOREIGN KEY ("class_id")
      REFERENCES "Class"("class_id")
);

CREATE TABLE "PersStudent" (
  "ps_id" SERIAL PRIMARY KEY,
  "stud_id" INTEGER NOT NULL,
  "stud_pn" VARCHAR(20) NOT NULL,
  CONSTRAINT "FK_PersStudent.stud_id"
    FOREIGN KEY ("stud_id")
      REFERENCES "Students"("stud_id")
);

CREATE TABLE "Teachers" (
  "teach_id" SERIAL PRIMARY KEY,
  "teach_name" VARCHAR(100) NOT NULL,
  "teach_surname" VARCHAR(100) NOT NULL,
  "teach_email" VARCHAR(100) UNIQUE NOT NULL,
  "teach_type" VARCHAR(50) NOT NULL,
  "is_consult" BOOLEAN NOT NULL
);

CREATE TABLE "PersTeacher" (
  "pt_id" SERIAL PRIMARY KEY,
  "teach_id" INTEGER NOT NULL,
  "teach_pn" VARCHAR(20) NOT NULL,
  CONSTRAINT "FK_PersTeacher.teach_id"
    FOREIGN KEY ("teach_id")
      REFERENCES "Teachers"("teach_id")
);

CREATE TABLE "TeachCourse" (
  "tc_id" SERIAL PRIMARY KEY,
  "teach_id" INTEGER NOT NULL,
  "course_code" VARCHAR(20) NOT NULL,
  CONSTRAINT "FK_TeachCourse.teach_id"
    FOREIGN KEY ("teach_id")
      REFERENCES "Teachers"("teach_id"),
  CONSTRAINT "FK_TeachCourse.course_code"
    FOREIGN KEY ("course_code")
      REFERENCES "Course"("course_code")
);

CREATE TABLE "Contract" (
  "contr_id" SERIAL PRIMARY KEY,
  "start_date" DATE NOT NULL,
  "end_date" DATE NOT NULL,
  "hourly_rate" DECIMAL(10,2) NOT NULL,
  "cc_id" INTEGER NOT NULL,
  "teach_id" INTEGER NOT NULL,
  "loc_id" INTEGER NOT NULL,
  CONSTRAINT "FK_Contract.cc_id"
    FOREIGN KEY ("cc_id")
      REFERENCES "ConsultCompany"("cc_id"),
  CONSTRAINT "FK_Contract.teach_id"
    FOREIGN KEY ("teach_id")
      REFERENCES "Teachers"("teach_id"),
  CONSTRAINT "FK_Contract.loc_id"
    FOREIGN KEY ("loc_id")
      REFERENCES "Location"("loc_id")
);