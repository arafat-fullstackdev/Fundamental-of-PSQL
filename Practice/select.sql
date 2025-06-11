-- Active: 1748169122316@@127.0.0.1@8006@student_data
CREATE DATABASE student_data;
CREATE TABLE student_info(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INTEGER,
    dob DATE,
    email VARCHAR(40) UNIQUE,
    course VARCHAR(25) DEFAULT 'Mathematics',
    grade VARCHAR (20),
    country VARCHAR(50)
);
SELECT * FROM student_info;

INSERT INTO student_info(first_name, last_name, age,dob, email,course,grade,country)
VALUES ('Alice', 'Johnson', 20, '2005-02-14', 'alice.johnson@example.com', 'Physics', 'A', 'USA'),
('Bob', 'Smith', 22, '2003-08-23', 'bob.smith@example.com', 'Mathematics', 'B+', 'Canada'),
('Charlie', 'Brown', 19, '2006-01-11', 'charlie.brown@example.com', 'Computer Science', 'A-', 'UK'),
('Diana', 'Miller', 21, '2004-05-30', 'diana.miller@example.com', 'Biology', 'B', 'Australia'),
('Ethan', 'Davis', 23, '2002-07-19', 'ethan.davis@example.com', 'Mathematics', 'C+', 'USA'),
('Fiona', 'Wilson', 20, '2005-03-08', 'fiona.wilson@example.com', 'Statistics', 'A', 'Ireland'),
('George', 'Lee', 18, '2007-09-25', 'george.lee@example.com', 'Physics', 'A-', 'Singapore'),
('Hannah', 'Clark', 22, '2003-12-15', 'hannah.clark@example.com', 'Mathematics', 'B-', 'Germany'),
('Isaac', 'Hall', 21, '2004-06-12', 'isaac.hall@example.com', 'Engineering', 'B+', 'India'),
('Jasmine', 'Young', 19, '2006-04-18', 'jasmine.young@example.com', 'Computer Science', 'A+', 'Bangladesh'),
('Kevin', 'Allen', 20, '2005-11-09', 'kevin.allen@example.com', 'Mathematics', 'C', 'USA'),
('Lily', 'Wright', 23, '2002-10-01', 'lily.wright@example.com', 'Biology', 'B', 'New Zealand'),
('Michael', 'Scott', 24, '2001-01-21', 'michael.scott@example.com', 'Mathematics', 'A-', 'USA'),
('Nina', 'Evans', 22, '2003-07-04', 'nina.evans@example.com', 'Chemistry', 'B+', 'France'),
('Oscar', 'Green', 20, '2005-05-02', 'oscar.green@example.com', 'Mathematics', 'A', 'Norway'),
('Paula', 'Hill', 21, '2004-03-17', 'paula.hill@example.com', 'Computer Science', 'A-', 'Brazil');

--DESC
--ASC
-- SELECT *FROM student_info
-- ORDER BY dob ASC; 

--? SELECT
--  SELECT * FROM student_info
--  WHERE course= 'Mathematics'; 
-- WHERE age >20; 
INSERT INTO student_info(first_name, last_name, age,dob,email, course,grade, country)
 VALUES
 ('Quincy', 'Bennett', 19, '2006-07-08', 'quincy.bennett@example.com', 'Data Science', 'B', 'South Africa'),
('Rachel', 'Nguyen', 20, '2005-01-30', 'rachel.nguyen@example.com', 'Physics', 'A-', 'Vietnam'),
('Samuel', 'Turner', 22, '2003-05-15', 'samuel.turner@example.com', 'Statistics', 'B+', 'USA'),
('Tina', 'Lopez', 21, '2004-10-21', 'tina.lopez@example.com', 'Mathematics', 'A', 'Mexico'),
('Umar', 'Iqbal', 23, '2002-02-27', 'umar.iqbal@example.com', 'Engineering', 'C+', 'Pakistan'),
('Vera', 'Schmidt', 20, '2005-06-18', 'vera.schmidt@example.com', 'Architecture', 'B-', 'Germany'),
('William', 'Khan', 18, '2007-11-11', 'william.khan@example.com', 'Chemistry', 'A+', 'UAE'),
('Xena', 'Peterson', 22, '2003-03-03', 'xena.peterson@example.com', 'Computer Science', 'B+', 'Sweden'),
('Yusuf', 'Abdi', 21, '2004-04-24', 'yusuf.abdi@example.com', 'Biology', 'B', 'Kenya'),
('Zara', 'Martinez', 19, '2006-09-19', 'zara.martinez@example.com', 'Physics', 'A-', 'Argentina'),
('Adil', 'Rahman', 20, '2005-12-12', 'adil.rahman@example.com', 'Mathematics', 'C', 'Bangladesh'),
('Bella', 'Foster', 23, '2002-08-08', 'bella.foster@example.com', 'History', 'B+', 'USA'),
('Carlos', 'Gomez', 24, '2001-06-16', 'carlos.gomez@example.com', 'Philosophy', 'B-', 'Spain'),
('Dana', 'Ibrahim', 21, '2004-02-02', 'dana.ibrahim@example.com', 'Mathematics', 'A+', 'Egypt'),
('Eli', 'Anderson', 19, '2006-05-05', 'eli.anderson@example.com', 'Engineering', 'A-', 'Canada'),
('Farah', 'Javed', 22, '2003-07-07', 'farah.javed@example.com', 'Law', 'B', 'Pakistan'),
('Gavin', 'Morris', 20, '2005-03-13', 'gavin.morris@example.com', 'Mathematics', 'A-', 'UK'),
('Helena', 'Novak', 21, '2004-11-29', 'helena.novak@example.com', 'Design', 'B+', 'Czech Republic'); ADD

--* SELECT function
--SELECT * FROM student_info
--  WHERE country ='USA' OR country='Pakistan';
--SELECT concat(first_name, ' ',last_name) As conCatName FROM student_info;
--SELECT UPPER(concat(first_name,' ',last_name)) AS fullNAme FROM student_info;
-- SELECT length(first_name) FROM student_info;

--Aggregate function
 SELECT AVG(age) FROM student_info;
 SELECT max(age) FROM student_info;
 SELECT min(age) FROM student_info;
 SELECT COUNT(age) FROM student_info;
 SELECT sum(age) FROM student_info;

 --Combine
  SELECT max(LENGTH(first_name)) FROM student_info;

  --In
  SELECT * FROM student_info 
     WHERE country in('USA','UK');
  --BETWEEN 
    SELECT * FROM student_info
     WHERE age BETWEEN 17  and 19;
  --LIKE 
    SELECT * FROM student_info
       WHERE first_name LIKE 'C%'; ADD

       --? LIMIT

       SELECT * FROM student_info
          LIMIT 6;


-- limit + offset
--- Pagination  Logic

SELECT * from student_info LIMIT 5 OFFSET 5 *0;
SELECT * from student_info LIMIT 5 OFFSET 5 *1;
SELECT * from student_info LIMIT 5 OFFSET 5 *2;
SELECT * from student_info LIMIT 5 OFFSET 5 *3;
       --? OFFSET
       SELECT * FROM student_info
         OFFSET 9;

       SELECT * FROM student_info;


  -- DELETE
--   DELETE FROM student_info;       
--* Using where filter

 DELETE FROM student_info
   WHERE grade='B';       

   --Update

   UPDATE student_info
     set email ='bob.smith@yahoo.com',  age = 23
        WHERE id = 70;