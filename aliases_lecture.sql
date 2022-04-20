-- Aliases = used to temporarily control output for column / table names
USE employees;

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
         LIMIT 25;


-- Multiple aliases
SELECT first_name AS 'First Name', last_name AS 'Last Name'
FROM employees;


-- Multiple column data for one alias

SELECT CONCAT(first_name, ' ', last_name, ' was born ', birth_date) AS 'Employee Birth Message'
FROM employees;

-- Alias table name (very important for writing table joins)

SELECT * FROM employees AS e;


SELECT hire_date, COUNT(*) AS employee_count
FROM employees
GROUP BY hire_date
ORDER BY employee_count DESC
    LIMIT 10;