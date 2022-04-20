USE employees;

# ======================== WHERE CLAUSES

# LIKE keyword - for finding results that contain a substring
# Select the last name from all employees with a last name ending in z

SELECT last_name FROM employees
WHERE last_name LIKE 'a%z%';



# DISTINCT - for filtering out duplicate results
# Select distinct first names from employees where first name contains a z

SELECT first_name, last_name FROM employees
WHERE first_name LIKE 'a%z%';

SELECT first_name FROM employees
WHERE first_name LIKE 'a%z%';

SELECT DISTINCT first_name FROM employees
WHERE first_name LIKE 'a%z%';

SELECT DISTINCT first_name, last_name FROM employees
WHERE first_name LIKE 'a%z%';


# BETWEEN - for filtering results within a given range
# Select all employee data where employee number is between 10001 and 10010

describe employees;

SELECT * FROM employees
WHERE emp_no BETWEEN 10001 AND 10010
   OR emp_no BETWEEN 10201 AND 10210;

# IN - for matching with any result within a given set
# Select all employee data for employees with a first name of Georgi or Parto
SELECT *
FROM employees
WHERE first_name LIKE 'Georgi'
   OR first_name LIKE 'Parto';

# REFACTOR...
SELECT *
FROM employees
WHERE first_name IN ('Georgi', 'Parto');




# Select employee number, first name, last name for employees with a last name of Herber, Dredge, Lipner, or Baek
SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name IN ('Herber', 'Dredge', 'Lipner', 'Baek');

describe employees;

# Chaining WHERE clauses - for defining multiple filtering criteria
# Select all data from female employees where employee number is less than 10200
SELECT * FROM employees
WHERE gender = 'F'
  AND emp_no < 10200;



# Parentheses matter - order of precedence changes the logic of what to include
# Select all employee data from male or female employees with an id less than 10200
SELECT *
FROM employees
WHERE emp_no < 10200
  AND (gender = 'F' OR gender = 'M');


# Select all employee data from female employees with an id less than 10200 or are male employees
SELECT *
FROM employees
WHERE emp_no < 10200
    AND gender = 'F'
   OR gender = 'M';










# ======================== ORDER BY

# Select employee first and last names from highest to lowest employee number
SELECT emp_no, first_name, last_name
FROM employees
ORDER BY emp_no DESC;

# Select employee data from all employees in ascending order by last name
SELECT *
FROM employees
ORDER BY last_name;


# Select employee data from all employees in descending order by last name
SELECT *
FROM employees
ORDER BY last_name DESC;


# Select all female then male employee data for all employees
# with a first name of Leni with last names in descending alphabetical order

SELECT *
FROM employees
WHERE first_name = 'Leni'
ORDER by gender DESC;

DESCRIBE employees;

SELECT *
FROM employees
WHERE first_name = 'Leni'
ORDER by gender DESC, last_name;






# ======================== LIMIT / OFFSET

SELECT * FROM employees
                  LIMIT 16 OFFSET 0;