USE employees;

# Create a file named sub-queries_exercises.sql and craft queries to return
# the results for the following criteria:
#
# 1. Find all the employees with the same hire date as employee 101010 using
#    a sub-query.
#    ~ 69 Rows
SELECT CONCAT(first_name, ' ', last_name) AS "Employee Name",
       hire_date AS "Birth Day"
FROM employees
WHERE hire_date IN (
    SELECT hire_date
    FROM employees
    WHERE emp_no = 101010
    );


# 2. Find all the titles held by all employees with the first name Aamod.
#    ~ 314 total titles, 6 unique titles
SELECT title AS "Title"
FROM titles
WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE first_name = 'Aamod'
    );


# 3. Find all the current department managers that are female.
#    +------------+------------+
#    | first_name | last_name  |
#    +------------+------------+
#    | Isamu      | Legleitner |
#    | Karsten    | Sigstam    |
#    | Leon       | DasSarma   |
#    | Hilary     | Kambil     |
#    +------------+------------+
SELECT first_name AS "First Name",
       last_name AS "Last Name"
FROM employees e
         JOIN dept_manager dm on e.emp_no = dm.emp_no
         JOIN departments d on dm.dept_no = d.dept_no
WHERE dm.to_date > NOW()
  AND e.gender = 'F';

SELECT first_name AS "First Name",
       last_name AS "Last Name"
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE to_date > NOW()
    ) AND gender = 'F';


#  BONUS
#
# 1. Find all the department names that currently have female managers.
#    +-----------------+
#    | dept_name       |
#    +-----------------+
#    | Development     |
#    | Finance         |
#    | Human Resources |
#    | Research        |
#    +-----------------+
SELECT dept_name AS "Department Name"
FROM departments
WHERE dept_no IN (
    SELECT dept_no
    FROM dept_manager
    WHERE to_date > NOW()
    AND emp_no IN (
        SELECT emp_no
        FROM employees
        WHERE gender = 'F'
    )
);

#  2. Find the first and last name of the employee with the highest salary.
#    +------------+-----------+
#    | first_name | last_name |
#    +------------+-----------+
#    | Tokuyasu   | Pesch     |
#    +------------+-----------+
SELECT first_name AS "First Name",
       last_name AS "Last Name"
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM salaries
    WHERE to_date > NOW()
      AND salary IN (
        SELECT MAX(salary)
        FROM salaries
    )
);






