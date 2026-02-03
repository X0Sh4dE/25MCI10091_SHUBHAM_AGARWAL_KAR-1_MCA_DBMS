

# **TITLE: Technical Training Worksheet 4** 
### Implementation of Conditional Logic using CASE and IF-ELSE in PostgreSQL
---

**Name:** Shubham Agarwal  
**UID:** 25MCI10091 
**Branch:** MCA AI ML  
**Semester:** 2nd  
**Section/Group:** 1A  
**Subject:** Technical Training Lab  
**Date of Performance:** 03/02/2026

---

## Aim of the Session

To understand and implement iterative control structures in PostgreSQL conceptually, including FOR loops, WHILE loops, and basic LOOP constructs, for repeated execution of database logic

---

## Software Requirements

- PostgreSQL Database Server
- pgAdmin 4
- Windows Operating System

---

## Objective of the Session

- - To understand why iteration is required in database programming.
- To learn the purpose and behaviour of FOR, WHILE, and LOOP constructs. 
- To understand how repeated data processing is handled in databases. 
- To relate loop concepts to real-world batch processing scenarios.
- To strengthen conceptual knowledge of procedural SQL used in enterprise systems.

---

## Practical Experiment Steps

### employee Table Creation

```sql
CREATE TABLE employee (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    designation VARCHAR(30),
    salary INT,
    joining_year INT
);
-- Insert data for employee table
INSERT INTO employee (emp_name, department, designation, salary, joining_year) VALUES
('Amit Sharma', 'IT', 'Developer', 30000, 2022),
('Neha Verma', 'HR', 'HR Executive', 35000, 2021),
('Nishant Sharma', 'HR', 'HR Executive', 35000, 2021),
('Nisha Sharma', 'HR', 'HR Executive', 35000, 2021),
('Neeraj Rajput', 'IT', 'Developer', 30000, 2022),
('Neeru Chawan', 'Sales', 'Sales Executive', 37000, 2023),
('Rahul Mehta', 'Finance', 'Accountant', 28000, 2023),
('Sneha Kapoor', 'IT', 'Senior Developer', 50000, 2019),
('Rohit Jain', 'Sales', 'Sales Executive', 32000, 2022),
('Pooja Singh', 'IT', 'Tester', 27000, 2024);
 [file:2]

![image](1.png) [file:2]

---

### Example 1: FOR Loop -- Simple Iteration

sql
DO $$
DECLARE
    i INT;
BEGIN
    FOR i IN 1..5 LOOP
        RAISE NOTICE 'Processing batch number: %', i;
    END LOOP;
END $$;
 [file:2]

![image](2.png) [file:2]

---

### Example 2: FOR Loop -- Query Based

sql
DO $$
DECLARE
    emp RECORD;
BEGIN
    FOR emp IN SELECT * FROM employee LOOP
        RAISE NOTICE
            'ID: %, Name: %, Dept: %, Salary: %',
            emp.emp_id, emp.emp_name, emp.department, emp.salary;
    END LOOP;
END $$;
 [file:2]

![image](3.png) [file:2]

---

### Example 3: WHILE Loop -- Conditional Iteration

sql
DO $$
DECLARE
    i INT := 0;
BEGIN
    WHILE i <= 7 LOOP
        RAISE NOTICE '%', i;
        i := i + 1;
    END LOOP;
END $$;
 [file:2]

![image](4.png) [file:2]

---

### Example 4: LOOP with EXIT WHEN (Version 1)

sql
DO $$
DECLARE
    counter INT := 1;
BEGIN
    LOOP
        RAISE NOTICE 'Loop execution count: %', counter;
        counter := counter + 1;
        EXIT WHEN counter > 5;
    END LOOP;
END $$;
 [file:2]

![image](5.png) [file:2]

---

### Example 4: LOOP with EXIT WHEN (Version 2)

sql
DO $$
DECLARE
    counter INT := 1;
BEGIN
    LOOP
        RAISE NOTICE 'Loop execution count: %', counter;
        counter := counter + 1;
        EXIT WHEN counter > 5;
    END LOOP;
END $$;
 [file:2]

![image](4.png) [file:2]

---

### Example 5: Salary Increment using FOR Loop

sql
DO $$
DECLARE
    emp RECORD;
BEGIN
    FOR emp IN SELECT emp_id FROM employee LOOP
        UPDATE employee
        SET salary = salary + 3000
        WHERE emp_id = emp.emp_id;
    END LOOP;
END $$;
 [file:2]

![image](6.png) [file:2]

---

### Example 6: LOOP + IF Condition

sql
DO $$
DECLARE
    emp RECORD;
BEGIN
    FOR emp IN SELECT emp_name, salary FROM employee LOOP
        IF emp.salary >= 40000 THEN
            RAISE NOTICE '% is a Senior Employee', emp.emp_name;
        ELSE
            RAISE NOTICE '% is a Junior Employee', emp.emp_name;
        END IF;
    END LOOP;
END $$;
``` [file:2]

![image](7.png) [file:2]

---

## I/O Analysis

### Input

- Employee Data


### Output

- Employee records were processed repeatedly using FOR loops to display and update data.   
- Query-based FOR loop classified and handled each employee record individually. 
- WHILE loop executed until the given condition became false, showing conditional iteration. 
- LOOP with EXIT demonstrated controlled termination of repeated execution. 
- Salary values were updated iteratively, simulating payroll processing.
- Conditional checks inside loops produced procedural validation messages during execution.

---

## Learning Outcomes

- Understand the concept of iterative control structures in PostgreSQL and explain their role in procedural database programming. 
- Identify scenarios in database systems where loops such as FOR, WHILE, and LOOP are required.  
- Differentiate between various loop constructs in PostgreSQL based on their behavior and use cases. 
- Apply iterative logic to simulate real-world database operations such as batch processing, record traversal, and conditional execution. 
- Develop a foundational understanding of PL/pgSQL required for implementing procedural logic in enterprise-grade database applications. 

---

## Repository Contents

- `README_Experiment_4.md` (this file)
- `Experiment_4.sql` (complete code)
- Screenshots (Ex_1.png to Ex_6.png)
