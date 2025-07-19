-- Створення бази
CREATE DATABASE IF NOT EXISTS SchoolDB;
USE SchoolDB;

-- 1. Institutions
CREATE TABLE Institutions (
    institution_id INT AUTO_INCREMENT PRIMARY KEY,
    institution_name VARCHAR(100) NOT NULL,
    institution_type ENUM('School', 'Kindergarten') NOT NULL,
    address VARCHAR(200)
);

-- 2. Classes
CREATE TABLE Classes (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(50) NOT NULL,
    institution_id INT,
    direction ENUM('Mathematics', 'Biology and Chemistry', 'Language Studies'),
    FOREIGN KEY (institution_id) REFERENCES Institutions(institution_id)
        ON DELETE SET NULL
);

-- 3. Children
CREATE TABLE Children (
    child_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_date DATE,
    year_of_entry INT,
    age INT,
    institution_id INT,
    class_id INT,
    FOREIGN KEY (institution_id) REFERENCES Institutions(institution_id)
        ON DELETE SET NULL,
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
        ON DELETE SET NULL
);

-- 4. Parents
CREATE TABLE Parents (
    parent_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    child_id INT,
    tuition_fee DECIMAL(10,2),
    FOREIGN KEY (child_id) REFERENCES Children(child_id)
        ON DELETE SET NULL
);
