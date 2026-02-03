

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
```
### Insert Data For Employee Table

```sql
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
```

<img width="707" height="276" alt="employee_table_creation" src="https://github.com/user-attachments/assets/0c03e553-4514-4cc0-a5ee-a78e348164e7">

---

### Example 1: FOR Loop -- Simple Iteration

```sql
sql
DO $$
DECLARE
    i INT;
BEGIN
    FOR i IN 1..5 LOOP
        RAISE NOTICE 'Processing batch number: %', i;
    END LOOP;
END $$;
```
<img width="403" height="162" alt="Ex_1" src="https://github.com/user-attachments/assets/278201f2-5b13-49b7-9c5b-fb0f8f833532">

---

### Example 2: FOR Loop -- Query Based

```sql
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
```

<img width="648" height="262" alt="Ex_2" src="https://github.com/user-attachments/assets/b8b95c61-53d1-4ad4-b744-abec962018bd">

---

### Example 3: WHILE Loop -- Conditional Iteration

```sql
DO $$
DECLARE
    i INT := 0;
BEGIN
    WHILE i <= 7 LOOP
        RAISE NOTICE '%', i;
        i := i + 1;
    END LOOP;
END $$;
```
<img width="493" height="216" alt="Ex_3" src="https://github.com/user-attachments/assets/ac389b86-97e2-4091-986f-f3eeeac19339">

---

### Example 4: LOOP with EXIT WHEN

```sql
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
```
<img width="492" height="162" alt="Ex_4" src="https://github.com/user-attachments/assets/77a11b1a-b157-4bb4-a445-bd18d88e08f4">

---

### Example 5: Salary Increment using FOR Loop

```sql
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
```
<img width="702" height="276" alt="Ex_5" src="https://github.com/user-attachments/assets/118d2a76-83aa-4c4a-9a36-d8a4463944da">

---

### Example 6: LOOP + IF Condition

```sql
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
```
<img width="552" height="263" alt="Ex_6" src="https://github.com/user-attachments/assets/86e87bff-5e7f-4799-9085-af80e9c7317b">


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
