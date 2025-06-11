-- Active: 1748169122316@@127.0.0.1@8006@student_data
SELECT * from student_info; 

SELECT country FROM student_info
  GROUP BY country; 

  SELECT country, count(*), AVG(age) FROM student_info
  GROUP BY country;
  
    SELECT country, count(*), AVG(age) FROM student_info
   GROUP BY country 
   HAVING AVG(age)> 20; 

   SELECT EXTRACT (YEAR from dob) as  birth_Year, count(*)
     FROM student_info
    GROUP BY birth_Year;