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

USE employees;


# WILL ONLY WORK if bothh tables have a column with the same name and that column
# is defined as a primary key in one of the tables
SELECT employees.last_name AS name,
       salaries.salary AS salary
FROM employees
    JOIN salaries USING (emp_no)

# Get name and salaries
SELECT concat(e.first_name, ' ', e.last_name) AS "Full Name",
       s.salary AS "Salary"
FROM employees e
    JOIN salaries s on e.emp_no = s.emp_no
WHERE e.emp_no = 10001
ORDER BY s.salary;

# Get Salaries from Research Dep
SELECT salary
FROM salaries s JOIN dept_emp de ON s.emp_no = de.emp_no
                JOIN departments d ON de.dept_no = d.dept_no
                JOIN employees e ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Research';