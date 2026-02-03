CREATE TABLE employee (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    designation VARCHAR(30),
    salary INT,
    joining_year INT
);

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


SELECT * FROM employee;
--Example 1: FOR Loop – Simple Iteration 
DO $$
DECLARE
    i INT;
BEGIN
    FOR i IN 1..5 LOOP
        RAISE NOTICE 'Processing batch number: %', i;
    END LOOP;
END $$;

--Example 2: FOR Loop – Query Based 
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


--Example 3: WHILE Loop – Conditional Iteration
DO $$
DECLARE
    i INT := 0;
BEGIN
    WHILE i <= 7 LOOP
        RAISE NOTICE '%',i;
        i := i + 1;
    END LOOP;
END $$;

--Example 4: LOOP with EXIT WHEN
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

--Example 5: Salary Increment using FOR Loop 
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



--Example 6: LOOP + IF Condition
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
