# **DBMS Lab – Worksheet 1**  
## **Design and Implementation of Sample Database System using DDL, DML and DCL**

---

## 👨‍🎓 **Student Details**  
**Name:** Shubham Agarwal  
**UID:** 25MCI10091 
**Branch:** MCA (AI & ML)  
**Semester:** 2nd  
**Section/Group:** 1/A  
**Subject:** DBMS Lab  
**Date of Performance:** 13/01/2026  

---

## 🎯 **Aim of the Session**  
To design and implement a sample database system using DDL, DML, and DCL commands for managing departments, employees, and projects, and to apply role-based access control for secure data handling.

---
## 💻 **Software Requirements**

- PostgreSQL (Database Server)  
- pgAdmin
- Windows Operating System  

---
## 📌 **Objective of the Session**  
- To understand the use of DDL commands to create and modify database structures.  
- To perform DML operations such as INSERT, UPDATE, DELETE, and SELECT.  
- To implement relationships using primary and foreign keys.  
- To apply DCL commands to manage roles and privileges.  
- To analyze input and output of SQL queries in a real database environment.  

---

## 🛠️ **Practical / Experiment Steps**  
- Design the database schema for Department, Employee, and Project tables.  
- Create tables using appropriate constraints.  
- Insert sample records into tables.  
- Perform update and delete operations.  
- Retrieve data using SELECT queries.  
- Create a role and grant and revoke privileges.  
- Alter and drop database objects.  

---

## 🗄️ **Database Design**  

The database is designed to manage Departments, Employees, and Projects within an organization.

### **Tables**  
- Department  
- Employee  
- Project  

### **Constraints Used**  
- PRIMARY KEY – to uniquely identify each record  
- FOREIGN KEY – to maintain relationships between tables  
- NOT NULL – to avoid missing important values  
- UNIQUE – to prevent duplicate entries  

---
# ⚙️ **Procedure of the Practical**

# ⚙️ **Step 1: Table Creation (DDL)**  

### **Department Table**
```sql
CREATE TABLE Department (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL UNIQUE,
    loc_name VARCHAR(50) NOT NULL
);
```

### **Employee Table**
```sql
CREATE TABLE Employee (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    salary NUMERIC(10,2) CHECK (salary > 0),
    dept_id INT NOT NULL,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
        ON DELETE RESTRICT
);
```

### **Project Table**
```sql
CREATE TABLE Project (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(50) NOT NULL UNIQUE,
    budget NUMERIC(12,2) CHECK (budget >= 10000),
    dept_id INT NOT NULL,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
        ON DELETE CASCADE
);
```

---

# 🧾 **Step 2: Data Manipulation (DML)**  

### **Insert into Department**
```sql
INSERT INTO Department (dept_name, loc_name) VALUES
('HR', 'Delhi'),
('IT', 'Bangalore'),
('Finance', 'Mumbai'),
('Marketing', 'Pune'),
('Manufacturing', 'Manipur');
```

### **Insert into Employee**
```sql
INSERT INTO Employee (emp_name, email, salary, dept_id) VALUES
('Amit', 'amit@org.com', 50000, 1);,
('Neha', 'neha@org.com', 70000, 2),
('Rohan', 'rohan@org.com', 70000, 2),
('Rahul', 'rahul@org.com', 50000, 1),
('Nehal', 'nehal@org.com', 65000, 3),
('Rohit', 'rohit@org.com', 70000, 3);
```

### **Insert into Project**
```sql
INSERT INTO Project (project_name, budget, dept_id) VALUES
('Payroll System', 150000, 1),
('Website Revamp', 300000, 2);
```

---

# ✏️ **Step 3: UPDATE Operation**  
```sql

UPDATE Employee
SET salary = salary + 5000
WHERE emp_name = 'Neha';
```

---

# 🗑️ **Step 4: DELETE Operations**  

(Employee 105 was assigned to a project, so the project record was deleted first.)

```sql
DELETE FROM Employee
WHERE emp_name = 'Amit';
```

---

# 🔐 **Step 5: Create Role and Assign Privileges**

### **Create Role**
```sql
CREATE USER reporting_user WITH PASSWORD 'report@123';
```

### **Grant SELECT Privileges**
```sql
GRANT SELECT ON Department TO reporting_user;
GRANT SELECT ON Employee TO reporting_user;
GRANT SELECT ON Project TO reporting_user;
```

### **Revoke Privilege**
```sql
revoke select on Department from CEO;
```

---

# 🏗️ **Step 6: Schema Modification**

### **Add Column**
```sql
ALTER TABLE Employee 
ADD COLUMN join_date DATE; 
```

### **Drop Table**
```sql
drop table Project;
```

---
## 📥📤 I/O Analysis (Input / Output)

### 🔹 Input
- Department, Employee, and Project table creation queries  
- Records inserted into all tables using INSERT commands  
- Update query to modify employee department  
- Delete queries to remove project and employee records  
- Role creation and privilege assignment queries  
- ALTER and DROP table commands  

### 🔹 Output
- Department, Employee, and Project tables created successfully  
- Records inserted, updated, and deleted correctly  
- Referential integrity maintained between tables  
- Data displayed correctly using SELECT queries  
- Role-based access verified using GRANT and REVOKE  
- Table structure modified and Project table dropped successfully  

📸 Screenshots of execution and obtained results are attached.

---

## 📘 **Learning Outcomes**  
- Understood the basics of relational database design using tables, keys, and relationships.  
- Learned to apply primary and foreign key constraints to maintain data integrity.  
- Gained hands-on experience with INSERT, UPDATE, and DELETE operations.  
- Understood role-based access control using GRANT and REVOKE.  
- Learned how to create read-only users for secure data access.  
- Practiced ALTER TABLE and DROP TABLE commands for schema management.  

---
