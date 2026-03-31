# Experiment No. 7

**Student Name: Shubham Agarwal** 

**UID: 25MCI10091**

**Branch: MCA (AI & ML) Section/Group: 25MAM-1/A**

**Semester: 2nd**

**Date of Performance:31/03/2026**

**Subject Name: Technical Training Lab**

**Subject Code: 25CAH-653**

---

**Aim of the Session:**
To implement and understand different types of JOIN operations in PostgreSQL for combining data from multiple tables.

---

**Software Requirements:**
- PostgreSQL Database Server
- pgAdmin 4
- Windows Operating System

---

**Objective of the Session:**
- To apply different types of JOIN operations on four related tables-Students, Courses, Enrollments, and Departments.
- To understand the relationships between these tables using primary and foreign keys.
- To combine data from multiple tables to retrieve meaningful and structured information.
- To enhance query writing skills for real-world database analysis and reporting.

---

**Practical Experiment Steps:**

**Table Creation & Record Insertion:**

```sql
CREATE TABLE DEPARTMENTS (
dept_id VARCHAR(10) PRIMARY KEY, dept_name VARCHAR(50)
);
```
```sql
CREATE TABLE STUDENTS (
student_id VARCHAR(15) PRIMARY KEY, student_name VARCHAR(50), dept_id VARCHAR(10),
FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);
```

```sql
CREATE TABLE Courses (
course_id VARCHAR(15) PRIMARY KEY, course_name VARCHAR(50)
);
```
```sql
CREATE TABLE Enrollments (
enroll_id VARCHAR(20) PRIMARY KEY,student_id VARCHAR(15),course_id VARCHAR(15),
FOREIGN KEY (student_id) REFERENCES Students(student_id),
FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
```
---

**DEPARTMENTS TABLE**

```sql
INSERT INTO Departments VALUES ('D01', 'Computer Science');
INSERT INTO Departments VALUES ('D02', 'Mechanical');
INSERT INTO Departments VALUES ('D03', 'Electrical');
```

**STUDENTS TABLE**
```sql
INSERT INTO Students VALUES ('STU101A', 'Shubham Agarwal', 'D01');
INSERT INTO Students VALUES ('STU102B', 'Rahul Sharma', 'D02');
INSERT INTO Students VALUES ('STU103C', 'Amit Verma', 'D01');
INSERT INTO Students VALUES ('STU104D', 'Neha Kapoor', 'D03');
INSERT INTO Students VALUES ('STU105E', 'Priya Singh', 'D02');
INSERT INTO Students VALUES ('STU106F', 'Karan Mehta', 'D01');
```
**COURSES TABLE**
```sql
INSERT INTO Courses VALUES ('CSE201', 'Database Management System');
INSERT INTO Courses VALUES ('CSE202', 'Operating System');
INSERT INTO Courses VALUES ('MTH101', 'Engineering Mathematics');
INSERT INTO Courses VALUES ('PHY110', 'Applied Physics');
```
**ENROLLMENTS TABLE**
```sql
INSERT INTO Enrollments VALUES ('ENR001', 'STU101A', 'CSE201');
INSERT INTO Enrollments VALUES ('ENR002', 'STU101A', 'CSE202');
INSERT INTO Enrollments VALUES ('ENR003', 'STU101A', 'MTH101');
INSERT INTO Enrollments VALUES ('ENR004', 'STU102B', 'MTH101');
INSERT INTO Enrollments VALUES ('ENR005', 'STU103C', 'CSE201');
INSERT INTO Enrollments VALUES ('ENR006', 'STU103C', 'PHY110');
INSERT INTO Enrollments VALUES ('ENR007', 'STU106F', 'CSE201');
INSERT INTO Enrollments VALUES ('ENR008', 'STU106F', 'CSE202');
INSERT INTO Enrollments VALUES ('ENR009', 'STU106F', 'PHY110');
```
---

**VIEWING RECORDS OF DIFFERENT TABLES**
```sql
SELECT * FROM DEPARTMENTS;
```
<img src = "\Outputs\Departments.png">

```sql
SELECT * FROM STUDENTS;
```
<img src = "\Outputs\Students.png">

```sql
SELECT * FROM ENROLLMENTS;
```
<img src = "\Outputs\Enrollments.png">

```sql
SELECT * FROM COURSES;
```
<img src = "\Outputs\Courses.png">

---

**Step 1: Write queries to list students with their enrolled courses (INNER JOIN).**

```sql
SELECT * FROM Students S INNER JOIN Enrollments E
ON S.student_id = E.student_id INNER JOIN Courses C
ON E.course_id = C.course_id;
```
<img src = "\Outputs\STEP_1.png">

---

**STEP 2: Find students not enrolled in any course (LEFT JOIN).**
```sql
SELECT s.student_id, s.student_name
FROM STUDENTS s
LEFT JOIN ENROLLMENTS e ON s.student_id = e.student_id
WHERE e.student_id IS NULL;
```
<img src = "\Outputs\STEP_2.png">

---

**STEP 3:** **Display all courses with or without enrolled students (RIGHT JOIN).**

```sql
SELECT c.course_id, c.course_name, s.student_name
FROM STUDENTS s
RIGHT JOIN ENROLLMENTS e ON s.student_id = e.student_id
RIGHT JOIN COURSES c ON e.course_id = c.course_id;
```
<img src = "\Outputs\STEP_3.png">

---

**STEP 4: Show students with department info using SELF JOIN or MULTIPLE JOINS.**

```sql
SELECT s.student_id, s.student_name, d.dept_name
FROM STUDENTS s
INNER JOIN DEPARTMENTS d ON s.dept_id = d.dept_id;
```
<img src = "\Outputs\STEP_4.png">

---

**STEP 5: Display all possible student-course combinations (CROSS JOIN).**

```sql
SELECT s.student_name, c.course_name
FROM STUDENTS sCROSS JOIN COURSES c;
```
<img src = "\Outputs\STEP_5.png">

---

**I/O Analysis**

**Input:**

The input consists of data stored in four relational tables:

**Departments Table**

<img src = "\Outputs\Departments.png">

 **Students Table**

<img src = "\Outputs\Students.png">

 **Courses Table**

<img src = "\Outputs\Courses.png">

 **Enrollments Table**

<img src = "\Outputs\Enrollments.png">

---

**Output:**

- Step 1 - Inner Join Operation:  
   **Displayed only those students who are enrolled in courses, ensuring matching records from all related tables.
- Step 2 - Left Join Operation:  
   Identified students who are not enrolled in any course by showing unmatched records from the Students table.
- Step 3 - Right Join Operation:  
   Displayed all courses along with enrolled students, ensuring that even courses without students would be included.
- Step 4 - Multiple Join Operation:  
   Combined Students and Departments tables to provide complete student details along with their department information.
- Step 5 - Cross Join Operation:  
   Generated all possible combinations of students and courses, demonstrating the concept of Cartesian product.

---

**Learning Outcomes**

- **Understanding of JOIN Operations:**
Gained knowledge of different types of SQL joins such as INNER JOIN, LEFT JOIN, RIGHT JOIN, and CROSS JOIN and their practical applications.

- **Data Integration Skills:**
Learned how to combine data from multiple related tables (Students, Courses, Enrollments, Departments) to extract meaningful information.

- **Handling Matched and Unmatched Records:**
Developed the ability to identify both matching and non-matching records using INNER and OUTER joins.

- **Query Writing and Optimization:**
Improved skills in writing efficient SQL queries to retrieve structured and relevant data from relational databases.
