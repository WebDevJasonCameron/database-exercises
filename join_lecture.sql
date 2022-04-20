USE employees;

SELECT employees.last_name AS Name,
       salaries.salary AS Salary
FROM employees JOIN salaries on employees.emp_no = salaries.emp_no;

SELECT employees.last_name AS Name,
       salaries.salary AS Salary,
       salaries.from_date AS StartDate,
       salaries.to_Date AS EndDate
FROM employees JOIN salaries ON employees.emp_no = salaries.emp_no;

SELECT concat(employees.last_name, ' ', employees.first_name) AS Name,
       salaries.salary AS Salary,
       salaries.from_date AS StartDate,
       salaries.to_Date AS EndDate
FROM employees JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE employees.emp_no = 14781;

SELECT concat(e.last_name, ' ', e.first_name) AS Name,
       s.salary AS Salary,
       s.from_date AS StartDate,
       s.to_Date AS EndDate
FROM employees e JOIN salaries s ON e.emp_no = s.emp_no;

