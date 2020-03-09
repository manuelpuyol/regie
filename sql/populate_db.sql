
INSERT INTO users (name, email, password, type) VALUES ('Student', 'student@uchicago.edu', '1', 1);
INSERT INTO users (name, email, password, type) VALUES ('Staff', 'staff@uchicago.edu', '1', 2);
INSERT INTO users (name, email, password, type) VALUES ('Admin', 'admin@uchicago.edu', '1', 3);

INSERT INTO quarters (year, code) VALUES (2020, 1);
INSERT INTO quarters (year, code) VALUES (2020, 2);

# Quarter 1
INSERT INTO courses (name, code) VALUES ('C/C++ for Advanced Programmers', 'MPCS 51044');
INSERT INTO courses (name, code) VALUES ('Object Oriented Programming', 'MPCS 51410');
INSERT INTO courses (name, code) VALUES ('Foundations of Data Analysis', 'MPCS 53110');

INSERT INTO course_sections (course_id, quarter_id) VALUES (1, 1);
INSERT INTO course_sections (course_id, quarter_id) VALUES (2, 1);
INSERT INTO course_sections (course_id, quarter_id) VALUES (3, 1);

INSERT INTO student_sections (section_id, student_id, grade) VALUES (1,1, 'A');
INSERT INTO student_sections (section_id, student_id, grade) VALUES (2,1, 'B');
INSERT INTO student_sections (section_id, student_id, grade) VALUES (3,1, 'A');

# Quarter 2
INSERT INTO courses (name, code) VALUES ('Advanced C++', 'MPCS 51045');
INSERT INTO courses (name, code) VALUES ('Applied Software Engineering', 'MPCS 51220');
INSERT INTO courses (name, code) VALUES ('Parallel Programming', 'MPCS 52060');

INSERT INTO course_sections (course_id, quarter_id) VALUES (4, 2);
INSERT INTO course_sections (course_id, quarter_id) VALUES (5, 2);
INSERT INTO course_sections (course_id, quarter_id) VALUES (6, 2);
