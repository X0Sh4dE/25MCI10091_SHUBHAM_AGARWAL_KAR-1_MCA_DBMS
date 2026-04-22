# Experiment No. 10
## Implementation of Transactions, ROLLBACK and SAVEPOINT in PostgreSQL

> **Student Name:** Shubham Agarwal
> **UID:** 25MCI10091
> **Branch:** MCA (AI & ML)
> **Section/Group:** 25MAM-1/A
> **Semester:** 2nd
> **Date of Performance:** 12/03/2026
> **Subject Name:** Technical Training Lab
> **Subject Code:** 25CAH-653

---

## Aim of the Session

To apply the concept of Transactions in database operations in order to perform tasks like data modification with the ability to commit, rollback, and use savepoints to maintain data integrity and consistency within the database system.

---

## Software Requirements

- PostgreSQL Database Server
- pgAdmin 4
- Windows Operating System

---

## Objective of the Session

- To understand the concept and usage of transactions in database systems.
- To implement `BEGIN`, `COMMIT`, and `ROLLBACK` for controlling transaction flow.
- To use `SAVEPOINT` for partial rollbacks within a transaction.
- To understand how constraints like `CHECK` prevent invalid data from being committed.
- To demonstrate atomicity and data integrity through practical transaction scenarios.

---

## Practical Experiment Steps

### Table Creation

```sql
CREATE TABLE Payroll (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2) CHECK(SALARY > 0)
);
```

### Record Insertion

```sql
INSERT INTO Payroll (emp_id, emp_name, salary) VALUES
(1,  'Amita',    30000),
(2,  'Nehal',    40000),
(3,  'Ravit',    50000),
(4,  'Amit',     30000),
(5,  'Neha',     40000),
(6,  'Ravi',     50000),
(7,  'Amitabh',  30000),
(8,  'Nisha',    40000),
(9,  'Ravish',   50000),
(10, 'Ravindra', 50000);

SELECT * FROM Payroll;
```
---

### Step 1: Transaction with ROLLBACK

A transaction is started using `BEGIN`. An invalid salary update (`-1000`) is attempted for `emp_id = 3`, which violates the `CHECK` constraint. A valid update is then attempted, but the entire transaction is rolled back using `ROLLBACK`, undoing all changes.

```sql
BEGIN;

UPDATE Payroll
SET salary = -1000
WHERE emp_id = 3;

UPDATE Payroll
SET salary = salary + 1000
WHERE emp_id = 3;

SELECT * FROM Payroll;

ROLLBACK;

SELECT * FROM Payroll;
```

> **Expected Output:** After `ROLLBACK`, the salary of `emp_id = 3` remains `50000.00` — unchanged as if no updates were made.

---

### Step 2: Transaction with SAVEPOINT

A transaction is started. A valid salary increment is applied to `emp_id = 1`. A `SAVEPOINT sp1` is created before the next update. An increment is applied to `emp_id = 2`, followed by an invalid update (`-1000`) for `emp_id = 3`. The transaction is rolled back to `sp1` (undoing changes to `emp_id = 2` and `emp_id = 3`), but the change to `emp_id = 1` is preserved and committed.

```sql
BEGIN;

-- Update 1: Valid salary increment
UPDATE Payroll
SET salary = salary + 5000
WHERE emp_id = 1;

-- Savepoint created after Update 1
SAVEPOINT sp1;

-- Update 2: Valid salary increment
UPDATE Payroll
SET salary = salary + 7000
WHERE emp_id = 2;

-- Error simulation: Invalid salary
UPDATE Payroll
SET salary = -1000
WHERE emp_id = 3;

-- Rollback to savepoint (undoes Update 2 and the error)
ROLLBACK TO sp1;

-- Commit valid changes (only Update 1 is committed)
COMMIT;
```

> **Expected Output:** `emp_id = 1` salary increases by `5000`. `emp_id = 2` and `emp_id = 3` remain unchanged.

---

## I/O Analysis

**Input:**
- Payroll table with employee salary data
- Transaction blocks with valid and invalid update statements

**Output:**
- **ROLLBACK:** Reverts all changes within the transaction — data remains as before `BEGIN`
- **SAVEPOINT:** Marks a safe point within the transaction
- **ROLLBACK TO sp1:** Undoes only the changes made after the savepoint
- **COMMIT:** Permanently saves only the valid changes made before the savepoint
- **CHECK Constraint:** Prevents negative salary values from being persisted

---

## Learning Outcomes

- **Transaction Control:** Students will be able to use `BEGIN`, `COMMIT`, and `ROLLBACK` to manage database transactions and ensure atomicity.
- **SAVEPOINT Usage:** Students will understand how to create savepoints within transactions for partial rollbacks without losing all changes.
- **Data Integrity:** Students will learn how constraints like `CHECK` work alongside transactions to prevent invalid data from entering the database.
- **Error Handling:** Students will gain practical experience in simulating errors within transactions and recovering gracefully using rollback mechanisms.
- **Real-world Application:** Students will be able to apply transaction management in systems like banking, payroll, and order processing where partial failures must not corrupt data.
