-- CREATE DATABASE university_db;
-- USE university_db;



-- Table: Students
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    date_of_birth DATE NOT NULL
);

-- Table: Departments
CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(255) NOT NULL
);

-- Table: Faculty
CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id) ON DELETE SET NULL
);

-- Table: Courses
CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_code VARCHAR(50) UNIQUE NOT NULL,
    course_name VARCHAR(255) NOT NULL,
    faculty_id INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id) ON DELETE SET NULL
);

-- Table: Enrollments (Many-to-Many Relationship between Students and Courses)
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE NOT NULL,
    grade VARCHAR(10),
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);


select * from university_db;

SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Faculty;
SELECT * FROM Departments;
SELECT * FROM Enrollments;


-- Insert Students
INSERT INTO students (first_name, last_name, date_of_birth, email) 
VALUES 
('Bob', 'Williams', '2002-08-20', 'bob@example.com');

-- Insert Departments
INSERT INTO Departments (department_id, department_name) 
VALUES 
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics');

-- Insert Faculty
INSERT INTO Faculty (faculty_id, first_name, last_name, department_id) 
VALUES 
(1, 'John', 'Doe', 1), 
(2, 'Jane', 'Smith', 2), 
(3, 'Robert', 'Brown', 3);

-- Insert Courses
INSERT INTO Courses (course_id, course_code, course_name, faculty_id) 
VALUES 
(1, 'CS101', 'Introduction to Programming', 1),
(2, 'MATH201', 'Linear Algebra', 2),
(3, 'PHYS301', 'Quantum Mechanics', 3);

-- Insert Enrollments (WITHOUT enrollment_id)


INSERT INTO Enrollments (student_id, course_id, enrollment_date, grade) 
VALUES 
(1, 1, '2024-03-01', 'A'),
(4, 2, '2024-03-05', 'B'); 







SELECT * FROM Students;



