-- Active: 1748169122316@@127.0.0.1@8006@base_cmd
 CREATE TABLE employees(
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT
 );


 CREATE TABLE department(
      dep_id INT,
      dep_name VARCHAR(50)
 );

INSERT INTO employees 
VALUES (1,'Johan Doe',101),
  (2,'Gohan Doe',102),
  (3,'Eohan Doe',103),
  (4,'Kohan Doe',104)

INSERT INTO department
 VALUES  (1,'IT'),
 (1,'Dev'),
 (1,'MGT'),
 (1,'MKT')

 SELECT * FROM employees;
 SELECT * FROM department;

--Cross Join
SELECT * FROM employees
 CROSS JOIN department;

--Natural Join
SELECT * FROM employees
 NATURAL JOIN department;