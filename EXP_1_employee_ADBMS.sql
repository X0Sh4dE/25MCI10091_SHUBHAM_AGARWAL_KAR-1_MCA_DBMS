--DDL operations(create)
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL UNIQUE,
    address VARCHAR(50) NOT NULL
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) CHECK (salary > 0), -- cannont be zero
    dept_id INT NOT NULL,
    email VARCHAR(100) UNIQUE,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(40) NOT NULL,
    dept_id INT,
    start_date DATE NOT NULL,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- DML OPERATIONS(INSERT,UPDATE,DELETE,SET)
INSERT INTO DEPARTMENT VALUES
(1, 'HR', 'DELHI'),
(2, 'IT', 'CHANDIGARH'),
(3, 'FINANCE', 'BANGLORE'),
(4, 'MR','MUMBAI');

INSERT INTO EMPLOYEE VALUES
(101, 'Amit Sharma', 50000, 1, 'amit123@gmail.com'),
(102, 'Karan Gupta', 65000, 2, 'karan@gmail.com'),
(103, 'Arun Singh', 70000, 2, 'arun@gmail.com'),
(104, 'Rajesh Kumar', 70000, 3, 'arun@gmail.com');

INSERT INTO PROJECT VALUES
(201, 'Bank Management', 1, '2024-01-10'),
(202, 'Pollution measurement index', 2, '2024-02-15'),
(203, 'Traffic Survalence', 2, '2024-03-14');

UPDATE EMPLOYEE
SET salary = 75000
WHERE emp_id = 103;

DELETE FROM PROJECT
WHERE project_id = 201;

SELECT * FROM DEPARTMENT;
SELECT * FROM PROJECT;
SELECT * FROM EMPLOYEE;

-- DCL OPERATION GRANT and REVOKE operations -----
CREATE ROLE MANAGER LOGIN PASSWORD 'manager';

--THE NEXT COMMAND WILL ALLOW THE 'ROLE' TO READ DATA FROM THE SPECIFIED TABLE - GRANT
GRANT SELECT ON DEPARTMENT,EMPLOYEE,PROJECT TO MANAGER;

-- THE NEXT COMMAND WILL NOT ALLOW THE 'ROLE' TO READ FROM A SPECIFIC TABLE - REVOKE
REVOKE SELECT ON DEPARTMENT FROM MANAGER;

-- DDL OPERATIONS(ALTER AND DROP)
ALTER TABLE EMPLOYEE
DROP COLUMN EMAIL;

Drop table project;