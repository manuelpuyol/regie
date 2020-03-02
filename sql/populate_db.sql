
INSERT INTO users (name, email, password, type) VALUES ('Student', 'student@uchicago.edu', '1', 1);
INSERT INTO users (name, email, password, type) VALUES ('Staff', 'staff@uchicago.edu', '1', 2);
INSERT INTO users (name, email, password, type) VALUES ('Admin', 'admin@uchicago.edu', '1', 3);

INSERT INTO courses (name, code) VALUES ('C/C++ for Advanced Programmers', 'MPCS 51044');
INSERT INTO courses (name, code) VALUES ('Object Oriented Programming', 'MPCS 51410');
INSERT INTO courses (name, code) VALUES ('Foundations of Data Analysis', 'MPCS 53110');

INSERT INTO student_courses (course_id, student_id, grade) VALUES (1,1, 'A');
INSERT INTO student_courses (course_id, student_id, grade) VALUES (2,1, 'B');
