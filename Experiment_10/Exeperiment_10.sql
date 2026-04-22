CREATE TABLE Payroll (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2) CHECK(SALARY>0)
);

INSERT INTO Payroll (emp_id, emp_name, salary) VALUES 
(1, 'Amita', 30000), 
(2, 'Nehal', 40000), 
(3, 'Ravit', 50000), 
(4, 'Amit', 30000), 
(5, 'Neha', 40000), 
(6, 'Ravi', 50000), 
(7, 'Amitabh', 30000), 
(8, 'Nisha', 40000), 
(9, 'Ravish', 50000), 
(10, 'Ravindra', 50000);

-- truncate table pAYROLL

BEGIN;

UPDATE Payroll
SET salary = -1000
WHERE emp_id = 3;

UPDATE Payroll
SET salary = salary + 1000
WHERE emp_id = 3;


SELECT * FROM Payroll

ROLLBACK;


SELECT * FROM Payroll


BEGIN;
-- Update 1
UPDATE Payroll
SET salary = salary + 5000
WHERE emp_id = 1;

-- Savepoint
SAVEPOINT sp1;

-- Update 2
UPDATE Payroll
SET salary = salary + 7000
WHERE emp_id = 2;


-- Error simulation
UPDATE Payroll
SET salary = -1000
WHERE emp_id = 3;


-- Rollback to savepoint
ROLLBACK TO sp1;

-- Commit valid changes
COMMIT;


