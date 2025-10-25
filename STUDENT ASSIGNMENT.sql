----SQL Assignment: Student Attendance and Scholarship Evaluation System
CREATE TABLE STUDENT (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50),
    course VARCHAR(50),
    total_classes INT,
    attended_classes INT,
    percentage NUMERIC(5,2),
    marks INT,
    admission_year INT
);
SELECT * FROM STUDENT
INSERT INTO STUDENT (student_name, course, total_classes, attended_classes, percentage, marks, admission_year)
VALUES
('Amit Kumar', 'BCA', 100, 90, 90.00, 85, 2021),
('Priya Sharma', 'BBA', 100, 75, 75.00, 70, 2022),
('Rahul Verma', 'BCA', 100, 60, 60.00, 55, 2020),
('Neha Patel', 'MBA', 100, 95, 95.00, 88, 2019),
('Kiran Das', 'B.Com', 100, 80, 80.00, 65, 2023),
('Anjali Rao', 'MBA', 100, 50, 50.00, 45, 2022),
('Rohit Mehta', 'BBA', 100, 85, 85.00, 82, 2021);
SELECT * FROM STUDENT
----Part A: Arithmetic Operators

1.--- Calculate attendance percentage for each student using (attended_classes * 100) / total_classes.
SELECT STUDENT_NAME,ATTENDED_CLASSES,TOTAL_CLASSES,
(attended_classes * 100) / total_classes 
AS TOTAL_ATTENDENCE FROM STUDENT ;

2. ---Show bonus marks as 5% of marks for students with attendance ≥ 85%.
SELECT * ,
CASE WHEN ATTENDED_CLASSES >=85 THEN MARKS*0.5 ELSE 0 END AS BONUS_MARKS
FROM STUDENT;

3. ---Increase marks by 3 points for students admitted before 2022.
SELECT *, CASE WHEN ADMISSION_YEAR<2022 THEN MARKS*3 ELSE 0 END AS INCREASED_MARKS
FROM STUDENT;

4.--- Calculate total score = marks + bonus (bonus = 5% of marks if attendance ≥ 85 else 0).
SELECT *, CASE WHEN ATTENDED_CLASSES>=85 THEN MARKS*0.5 ELSE 0 
END AS BONUS, MARKS+ 
CASE WHEN ATTENDED_CLASSES >=85 THEN MARKS *0.5 ELSE 0 END AS TOTAL_SCORE
FROM STUDENT;

----Part B: Comparison Operators

5.--- List students whose marks are greater than 80.
SELECT * FROM STUDENT WHERE MARKS>80;

6. ---Find students admitted after 2020.
SELECT * FROM STUDENT WHERE admission_year>2020;

7. ---Retrieve students whose attendance percentage is between 70 and 90.
SELECT * FROM STUDENT WHERE attended_classes BETWEEN 70 AND 80;

8.--- Show students whose course is not 'MBA'.
SELECT * FROM STUDENT WHERE COURSE <> ('MBA');

9. ---Identify the student with the highest marks.
SELECT * FROM STUDENT  WHERE MARKS= (SELECT MAX(MARKS) FROM STUDENT);

----Part C: Logical Operators

---10. Display students in the BCA course AND marks greater than 75.
SELECT * FROM STUDENT WHERE COURSE= ('BCA') AND MARKS>75;

---11. Find students enrolled in BBA OR MBA courses.
SELECT * FROM STUDENT WHERE COURSE= ('BBA') OR COURSE=('MBA');
--OTHER WAY
SELECT * FROM STUDENT WHERE COURSE IN ('BBA','MBA');

---12. List students who have marks > 70 AND attendance > 80 AND admission_year < 2023.
SELECT * FROM STUDENT WHERE MARKS>70 AND attended_classes >80 AND 
ADMISSION_YEAR <2023;

---13. Show students who are NOT from the B.Com course.
SELECT * FROM STUDENT WHERE COURSE <> ('B.COM'); ---ask mam
SELECT * FROM student WHERE course NOT IN ('B.Com');

---14. Identify students with marks < 50 OR attendance < 60.
SELECT * FROM STUDENT WHERE MARKS<50 OR ATTENDED_CLASSES <60;





