CREATE DATABASE company_db;
USE company_db;


CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    hire_date DATE
);


INSERT INTO employees VALUES
(1, 'Alice',   'IT',      70000, '2020-01-15'),
(2, 'Bob',     'IT',      85000, '2019-03-10'),
(3, 'Chris',   'IT',      85000, '2021-02-01'),
(4, 'David',   'HR',      60000, '2021-06-01'),
(5, 'Emma',    'HR',      65000, '2018-11-20'),
(6, 'Frank',   'Finance', 90000, '2017-07-05'),
(7, 'Grace',   'Finance', 88000, '2019-09-12');

select * from employees;

###  ROW_NUMBER() ----Assigns unique numbers even if values are same.

SELECT emp_name, department, salary,
    ROW_NUMBER() OVER ( PARTITION BY department ORDER BY salary DESC) AS row_num
FROM employees;

###  RANK() --- Same salary = same rank, gaps appear

SELECT emp_name,department,salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank_num
FROM employees;


### DENSE_RANK()---Same salary = same rank, no gaps

SELECT emp_name, department, salary,
    DENSE_RANK() OVER ( PARTITION BY department ORDER BY salary DESC) AS dense_rank_num
FROM employees;

### LAG()---Access previous row value

SELECT emp_name, department, salary,
    LAG(salary) OVER (PARTITION BY department ORDER BY hire_date) AS previous_salary
FROM employees;

###LEAD()---Access next row value

SELECT emp_name, department, salary,
    LEAD(salary) OVER (PARTITION BY department ORDER BY hire_date) AS next_salary
FROM employees;

### NTILE()----Divide rows into buckets

SELECT emp_name, department, salary,
    NTILE(3) OVER (PARTITION BY department ORDER BY salary DESC) AS salary_bucket
FROM employees;


### SUM()---Calculates total or running total for same department grouping rows.

SELECT emp_name, department, salary,
    SUM(salary) OVER (PARTITION BY department ORDER BY hire_date) AS running_total_salary
FROM employees;

### AVG()---It calculates the average salary for each department

SELECT emp_name, department, salary,
    AVG(salary) OVER (PARTITION BY department) AS department_avg_salary
FROM employees;

###MIN()/MAX()---The minimum salary and maximum salary in their department

SELECT emp_name, department, salary,
    MIN(salary) OVER (PARTITION BY department) AS min_salary,
    MAX(salary) OVER (PARTITION BY department) AS max_salary
FROM employees;




