CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    designation VARCHAR(50),
    salary NUMERIC(20,3),
    joining_date DATE
);

INSERT INTO employees (emp_id, emp_name, department, designation, salary, joining_date) VALUES
(1, 'Rahul Sharma', 'IT', 'Software Engineer', 45000.000, '2022-03-15'),
(2, 'Priya Verma', 'HR', 'HR Manager', 55000.000, '2021-07-10'),
(3, 'Amit Gupta', 'Finance', 'Accountant', 40000.000, '2020-11-05'),
(4, 'Sneha Kapoor', 'IT', 'Frontend Developer', 42000.000, '2023-01-20'),
(5, 'Vikas Singh', 'Sales', 'Sales Executive', 38000.000, '2022-06-25'),
(6, 'Neha Joshi', 'Marketing', 'Marketing Manager', 60000.000, '2019-09-12'),
(7, 'Arjun Mehta', 'IT', 'Backend Developer', 47000.000, '2021-12-01');

SELECT * FROM employees;

create or replace procedure update_salary_proc(IN P_EMP_ID INT,INOUT P_SALARY NUMERIC(20,3),OUT STATUS VARCHAR(20))
AS
$$
DECLARE
CURR_SAL NUMERIC(20,3);
BEGIN

SELECT SALARY+P_SALARY INTO CURR_SAL FROM employees WHERE EMP_ID=P_EMP_ID;
IF NOT FOUND THEN
RAISE EXCEPTION 'EMPLOYEE NOT FOUND';
END IF;

UPDATE employees
set salary= curr_sal
where emp_id=p_emp_id;

P_salary:=curr_sal;
status:='SUCCESS';

EXCEPTION
WHEN OTHERS THEN
IF SQLERRM LIKE '%EMPLOYEE NOT FOUND%' THEN
STATUS:= 'EMPLOYEE NOT FOUND';
END IF;

END;

$$ LANGUAGE PLPGSQL;
	DO
	$$
	DECLARE
	EMP_ID INT:=1;
	STATUS VARCHAR(20);
	SALARY NUMERIC(20,3):=500;
	BEGIN
	CALL update_salary_proc(Emp_id,salary,status);
	RAISE NOTICE 'YOUR STATUS IS % AND YOUR UPDATED SALARY IS  %',STATUS,salary;
	END;
	$$