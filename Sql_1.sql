# Creating a database 
CREATE DATABASE IF NOT EXISTS student_results_db;
USE student_results_db;

CREATE TABLE departments(
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE students(
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(60) NOT NULL,
    email VARCHAR(80) UNIQUE,
    city VARCHAR(30),
    dept_id INT,
    admission_year INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE courses(
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(80) NOT NULL,
    dept_id INT,
    credits INT NOT NULL DEFAULT 3,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE results(
    result_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    semester INT NOT NULL,
    marks INT,
    CHECK (marks BETWEEN 0 AND 100),
    UNIQUE (student_id, course_id, semester),
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

USE student_results_db;
SHOW TABLES;              
DESCRIBE students;        
DESCRIBE results;
-- 02_sample_data.sql
-- All names and emails are made up. Run AFTER 01_schema.sql.
-- Insert order matters: parents first (departments), then children (students, courses), then results.
USE student_results_db;

INSERT INTO departments (dept_id, dept_name) VALUES
(1, 'Computer Science'),
(2, 'Commerce'),
(3, 'Mechanical Engineering'),
(4, 'Arts'),
(5, 'Biotechnology');

INSERT INTO courses (course_id, course_name, dept_id, credits) VALUES
(1, 'Database Systems', 1, 4),
(2, 'Data Structures', 1, 4),
(3, 'Computer Networks', 1, 3),
(4, 'Data Ethics', 1, 2),
(5, 'Financial Accounting', 2, 4),
(6, 'Business Statistics', 2, 3),
(7, 'Corporate Law', 2, 3),
(8, 'Thermodynamics', 3, 4),
(9, 'Fluid Mechanics', 3, 4),
(10, 'Machine Design', 3, 3),
(11, 'Modern History', 4, 3),
(12, 'English Literature', 4, 3),
(13, 'Political Science', 4, 3),
(14, 'Genetics', 5, 4),
(15, 'Microbiology', 5, 3),
(16, 'Biochemistry', 5, 4);


INSERT INTO students (student_id, full_name, email, city, dept_id, admission_year) VALUES
(1, 'Aarav Deshmukh', 'aarav.1@example.com', 'Pune', 1, 2025),
(2, 'Sneha Jadhav', 'sneha.2@example.com', 'Nashik', 2, 2023),
(3, 'Rohan Kulkarni', 'rohan.3@example.com', 'Mumbai', 3, 2025),
(4, 'Priya Sharma', 'priya.4@example.com', 'Solapur', 4, 2023),
(5, 'Vikram Patil', 'vikram.5@example.com', 'Mumbai', 5, 2023),
(6, 'Ananya More', 'ananya.6@example.com', 'Pune', 1, 2025),
(7, 'Karan Shinde', 'karan.7@example.com', 'Solapur', 2, 2023),
(8, 'Isha Mehta', 'isha.8@example.com', 'Aurangabad', 3, 2023),
(9, 'Arjun Gupta', 'arjun.9@example.com', 'Solapur', 4, 2024),
(10, 'Meera Jadhav', 'meera.10@example.com', 'Nagpur', 5, 2023),
(11, 'Rahul Iyer', 'rahul.11@example.com', 'Mumbai', 1, 2023),
(12, 'Pooja Khan', 'pooja.12@example.com', 'Mumbai', 2, 2024),
(13, 'Siddharth Nair', 'siddharth.13@example.com', 'Aurangabad', 3, 2023),
(14, 'Kavya Mehta', 'kavya.14@example.com', 'Mumbai', 4, 2024),
(15, 'Nikhil Sharma', 'nikhil.15@example.com', 'Aurangabad', 5, 2025),
(16, 'Riya Nair', 'riya.16@example.com', 'Nashik', 1, 2025),
(17, 'Amit Sharma', 'amit.17@example.com', 'Pune', 2, 2025),
(18, 'Neha More', 'neha.18@example.com', 'Aurangabad', 3, 2023),
(19, 'Varun More', 'varun.19@example.com', 'Mumbai', 4, 2024),
(20, 'Tanvi Jadhav', 'tanvi.20@example.com', 'Thane', 5, 2025),
(21, 'Harsh Nair', 'harsh.21@example.com', 'Nagpur', 1, 2024),
(22, 'Divya Nair', 'divya.22@example.com', 'Nashik', 2, 2025),
(23, 'Manish Jadhav', 'manish.23@example.com', 'Mumbai', 3, 2025),
(24, 'Shruti Gupta', 'shruti.24@example.com', 'Nashik', 4, 2023),
(25, 'Yash Mehta', 'yash.25@example.com', 'Solapur', 5, 2024),
(26, 'Aditi More', 'aditi.26@example.com', 'Kolhapur', 1, 2023),
(27, 'Omkar More', 'omkar.27@example.com', 'Pune', 2, 2024),
(28, 'Sakshi Khan', 'sakshi.28@example.com', 'Aurangabad', 3, 2023),
(29, 'Tushar Shinde', 'tushar.29@example.com', 'Kolhapur', 4, 2023),
(30, 'Pallavi Reddy', 'pallavi.30@example.com', 'Solapur', 5, 2025),
(31, 'Gaurav Mehta', 'gaurav.31@example.com', 'Nagpur', 1, 2024),
(32, 'Rutuja Kulkarni', 'rutuja.32@example.com', 'Nashik', 2, 2025),
(33, 'Sagar Jadhav', 'sagar.33@example.com', 'Solapur', 3, 2025),
(34, 'Komal Khan', 'komal.34@example.com', 'Kolhapur', 4, 2023),
(35, 'Deepak Kulkarni', 'deepak.35@example.com', 'Thane', 5, 2023),
(36, 'Swati Joshi', 'swati.36@example.com', 'Mumbai', 1, 2023),
(37, 'Pranav Gupta', 'pranav.37@example.com', 'Solapur', 2, 2025),
(38, 'Mansi Sharma', 'mansi.38@example.com', 'Solapur', 3, 2024),
(39, 'Aniket Mehta', 'aniket.39@example.com', 'Aurangabad', NULL, 2025),
(40, 'Janhavi Patil', 'janhavi.40@example.com', 'Mumbai', 5, 2026);


INSERT INTO results (student_id, course_id, semester, marks) VALUES
(1, 1, 1, 64),
(1, 2, 1, 56),
(1, 3, 2, 69),
(2, 5, 1, 83),
(2, 6, 1, 75),
(2, 7, 2, NULL),
(3, 8, 1, 15),
(3, 9, 1, 56),
(3, 10, 2, 54),
(4, 11, 1, 60),
(4, 12, 1, 59),
(4, 13, 2, 67),
(5, 14, 1, 94),
(5, 15, 1, 55),
(5, 16, 2, 64),
(6, 1, 1, 91),
(6, 2, 1, 65),
(6, 3, 2, NULL),
(7, 5, 1, 65),
(7, 6, 1, 46),
(7, 7, 2, 67),
(8, 8, 1, 30),
(8, 9, 1, 59),
(8, 10, 2, 47),
(9, 11, 1, 99),
(9, 12, 1, 71),
(9, 13, 2, 87),
(10, 14, 1, 51),
(10, 15, 1, 68),
(10, 16, 2, NULL),
(11, 1, 1, 96),
(11, 2, 1, 48),
(11, 3, 2, 85),
(12, 5, 1, 72),
(12, 6, 1, 85),
(12, 7, 2, 73),
(13, 8, 1, 47),
(13, 9, 1, 39),
(13, 10, 2, 29),
(14, 11, 1, 70),
(14, 12, 1, 65),
(14, 13, 2, 96),
(15, 14, 1, 61),
(15, 15, 1, 74),
(15, 16, 2, 48),
(16, 1, 1, 66),
(16, 2, 1, 75),
(16, 3, 2, 83),
(17, 5, 1, 84),
(17, 6, 1, 63),
(17, 7, 2, 48),
(18, 8, 1, 53),
(18, 9, 1, 54),
(18, 10, 2, 53),
(19, 11, 1, 58),
(19, 12, 1, 83),
(19, 13, 2, 69),
(20, 14, 1, 79),
(20, 15, 1, 87),
(20, 16, 2, 78),
(21, 1, 1, 76),
(21, 2, 1, 100),
(21, 3, 2, 75),
(22, 5, 1, 59),
(22, 6, 1, 65),
(22, 7, 2, 84),
(23, 8, 1, 48),
(23, 9, 1, 54),
(23, 10, 2, 63),
(24, 11, 1, 60),
(24, 12, 1, 43),
(24, 13, 2, 72),
(25, 14, 1, 73),
(25, 15, 1, 61),
(25, 16, 2, 82),
(26, 1, 1, 80),
(26, 2, 1, 58),
(26, 3, 2, 79),
(27, 5, 1, 61),
(27, 6, 1, 43),
(27, 7, 2, 70),
(28, 8, 1, 46),
(28, 9, 1, 36),
(28, 10, 2, 54),
(29, 11, 1, 74),
(29, 12, 1, 59),
(29, 13, 2, 73),
(30, 14, 1, 84),
(30, 15, 1, 60),
(30, 16, 2, 75),
(31, 1, 1, 72),
(31, 2, 1, 100),
(31, 3, 2, 45),
(32, 5, 1, 73),
(32, 6, 1, 59),
(32, 7, 2, 62),
(33, 8, 1, 73),
(33, 9, 1, 46),
(33, 10, 2, 78),
(34, 11, 1, 61),
(34, 12, 1, 72),
(34, 13, 2, 61),
(35, 14, 1, 60),
(35, 15, 1, 70),
(35, 16, 2, 66),
(36, 1, 1, 74),
(36, 2, 1, 42),
(36, 3, 2, 100),
(37, 5, 1, 61),
(37, 6, 1, 88),
(37, 7, 2, 49),
(38, 8, 1, 51),
(38, 9, 1, 91),
(38, 10, 2, 34),
(39, 11, 1, 54),
(39, 5, 1, 57),
(3, 8, 3, 49),
(8, 8, 3, 46),
(13, 9, 3, 41),
(13, 10, 3, 58),
(28, 9, 3, 63),
(38, 10, 3, 57);


SELECT 'departments' AS tbl, COUNT(*) AS total FROM departments
UNION ALL SELECT 'courses', COUNT(*) FROM courses
UNION ALL SELECT 'students', COUNT(*) FROM students
UNION ALL SELECT 'results', COUNT(*) FROM results;
