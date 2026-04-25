--Lab MST TECHNICAL TRAINING
--SHUBHAM AGARWAL
--25MCI10091

--Ques1-An online store records every purchase in a Purchases table. Each record represents a customer buying a product on a specific date.
--The analytics team wants to detect situations where multiple customers purchased the same product on the same day.
--Your task is to identify all unique pairs of customers who bought the same product on the same date.

--Requirements
--product_id must be the same
--purchase_date must be the same
--Customers must be different


--Avoid duplicate pairs:
--(CustomerA, CustomerB) should appear once,(CustomerB, CustomerA) should not appear again


--Answer 1-
CREATE TABLE Purchases (
          purchase_id SERIAL PRIMARY KEY,
          customer_id INT,
          product_id INT,
          purchase_date DATE
      );
      INSERT INTO Purchases (customer_id, product_id, purchase_date) VALUES

      (101, 1, '2026-03-01'),
      (102, 1, '2026-03-01'),
      (103, 2, '2026-03-01'),
      (104, 1, '2026-03-01'),
      (105, 3, '2026-03-02'),
      (101, 2, '2026-03-02'),
      (102, 2, '2026-03-02'),
      (106, 1, '2026-03-01'),
      (107, 3, '2026-03-02'),
      (108, 1, '2026-03-03');
      
	  SELECT Distinct
          p1.product_id, 
         p1.purchase_date,
          p1.customer_id AS customer_a,
          p2.customer_id AS customer_b
      FROM Purchases p1
      JOIN Purchases p2
      ON p1.product_id = p2.product_id
      AND p1.purchase_date = p2.purchase_date
      AND p1.customer_id < p2.customer_id;


--Ques 2.A company database contains one tables: Employee(EmpID, EmpName, Salary) .Write an SQL query to create a VIEW named HighSalaryEmployees that displays EmpID, EmpName, and Salary from the Employee table where the Salary is greater than 50000.
--Answer 2-
        
		
		CREATE TABLE Employees (
         emp_id INT PRIMARY KEY,
         emp_name VARCHAR(50),
         manager_id INT,
         department VARCHAR(50),
         salary INT
      );

	  
      INSERT INTO Employees VALUES

      (1, 'Amit', NULL, 'Management', 120000),

      (2, 'Ravi', 1, 'Engineering', 39000),

      (3, 'Neha', 1, 'Engineering', 82000),

      (4, 'Karan', 2, 'Engineering', 20000),

      (5, 'Simran', 2, 'Engineering', 62000),

      (6, 'Pooja', 3, 'Engineering', 41000),

      (7, 'Rahul', 3, 'Engineering', 64000),

      (8, 'Arjun', 1, 'HR', 10000);

      create view HighSalaryEmployees AS

      Select emp_id,emp_name,salary

      From Employees

      where salary>50000;


      Select * from HighSalaryEmployees;
