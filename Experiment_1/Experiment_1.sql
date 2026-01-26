CREATE TABLE Department (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL UNIQUE,
    loc_name VARCHAR(50) NOT NULL
);

CREATE TABLE Employee (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    salary NUMERIC(10,2) CHECK (salary > 0),
    dept_id INT NOT NULL,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
        ON DELETE RESTRICT
);

CREATE TABLE Project (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(50) NOT NULL UNIQUE,
    budget NUMERIC(12,2) CHECK (budget >= 10000),
    dept_id INT NOT NULL,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
        ON DELETE CASCADE
);

INSERT INTO Department (dept_name, loc_name) VALUES
('HR', 'Delhi'),
('IT', 'Bangalore'),
('Finance', 'Mumbai'),
('Marketing', 'Pune'),
('Manufacturing', 'Manipur');

INSERT INTO Employee (emp_name, email, salary, dept_id) VALUES
('Amit', 'amit@org.com', 50000, 1),
('Neha', 'neha@org.com', 65000, 2),
('Rohan', 'rohan@org.com', 70000, 2),
('Rahul', 'rahul@org.com', 50000, 1),
('Nehal', 'nehal@org.com', 65000, 3),
('Rohit', 'rohit@org.com', 70000, 3);

INSERT INTO Project (project_name, budget, dept_id) VALUES
('Payroll System', 150000, 1),
('Website Revamp', 300000, 2);

UPDATE Employee
SET salary = salary + 5000
WHERE emp_name = 'Neha';

DELETE FROM Employee
WHERE emp_name = 'Amit';

CREATE USER reporting_user WITH PASSWORD 'report@123';

GRANT SELECT ON Department TO reporting_user;
GRANT SELECT ON Employee TO reporting_user;
GRANT SELECT ON Project TO reporting_user;

GRANT INSERT, UPDATE, DELETE ON Project TO reporting_user;
SELECT * FROM Department;
SELECT * FROM Employee;
SELECT * FROM Project;

REVOKE CREATE ON SCHEMA public FROM reporting_user; 
REVOKE INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public FROM 
reporting_user; 

ALTER TABLE Employee 
ADD COLUMN join_date DATE;

DROP TABLE Project;
