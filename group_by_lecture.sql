# GROUP BY LECTURE

# The "GROUP BY" clause is used to aggregate a table into various groups of shared characteristics.
#
# Grouping data is often accompanied with the use of aggregate functions to derive additional information
# about the various groupings.
#
# Most common aggregate functions are:
#
#     MIN()
#     MAX()
#     SUM()
#     AVG()
#     COUNT()
#
# One or multiple columns may be grouped together.
#
# No table columns may exist in a SELECT clause that are not contained in the GROUP BY clause.
    #
    #     The GROUP BY clause is after an optional where clause and before an optional order by clause.
                                      #
                                      #     The order of a result set may be by an aggregate column but an aggregate column cannot be referenced in a where clause.
                                      #
                                      # A having clause is a way to use aggregate results as if in a where clause.

USE employees;


select first_name, AVG(LENGTH(last_name))
from employees
GROUP BY first_name;



# --------- Grouping by a single column

# What are the titles?
SELECT *
FROM titles;

# What are the unique titles?
SELECT DISTINCT title
FROM titles;

# What are the groups of like titles?
SELECT title
FROM titles
GROUP BY title;

# How many employees have held each title?
SELECT title, COUNT(*)
FROM titles
GROUP BY title;

# What gender are all the employees?
SELECT gender
FROM employees;
# all genders of all employees listed

# How many unique genders are recorded in this company?
SELECT DISTINCT gender
FROM employees;
# all distinct genders in company

# What the groups created for each gender?
SELECT gender
FROM employees # creating groups of employees by gender
GROUP BY gender;

# How many employees are within each gender designation?
SELECT gender, COUNT(*)
FROM employees # how many are in each gender group?
GROUP BY gender;

# How many people share the same hire date?
SELECT hire_date, COUNT(*) AS `No of Employees Hired`
FROM employees
GROUP BY hire_date
ORDER BY COUNT(*) DESC;

select MIN(salary)
from salaries;

# How many salaries are at a given amount?
SELECT salary, COUNT(*)
FROM salaries
GROUP BY salary
ORDER BY COUNT(*) DESC;


# --------- Grouping by multiple columns

# How many employees share the same birthday?
SELECT birth_date, COUNT(*)
FROM employees
GROUP BY birth_date;


# How many male and female employees share the same birthday?
SELECT gender, birth_date, COUNT(*)
FROM employees
GROUP BY gender, birth_date
ORDER BY birth_date;


# COUNT function

# Find total number of employees
SELECT COUNT(*)
FROM employees;

# Find how many employees share the same name


# =========== AGGREGATE FUNCTIONS

# 1 Find the most common name (combo of first and last)
# 2 Find the most common female and male name
# 3 Find total number of female and male employees
# 4 Find the highest employee number of each unique first name
# 5 Select the first and last hire date for each first name
# 6 Find the minimum, maximum, average, and total number of salaries

# 1 Find the most common name

SELECT first_name, last_name, COUNT(*)
FROM employees
GROUP BY first_name, last_name
ORDER BY COUNT(*) DESC;

# 2 Find the most common female and male name

SELECT first_name, last_name, gender, COUNT(*)
FROM employees
GROUP BY first_name, last_name, gender
ORDER BY COUNT(*) DESC;

# 3 Find total number of female and male employees
SELECT gender, COUNT(*)
FROM employees
GROUP BY gender;

# 4 Find the highest employee number of each unique first name
SELECT MAX(emp_no), first_name
FROM employees
GROUP BY first_name;

# Find the min, max, avg, and count of each employee's salaries
SELECT emp_no, MIN(salary), MAX(salary), AVG(salary), COUNT(*)
FROM salaries
GROUP BY emp_no;



# MIN and MAX
# Select the first and last hire date for each first name
SELECT first_name, MIN(hire_date) AS 'First Hired', MAX(hire_date) AS 'Last Hired'
FROM employees
GROUP BY first_name;

DESCRIBE salaries;

# Find the minimum, maximum, average, and total number of salaries
SELECT COUNT(salary), MIN(salary), MAX(salary), AVG(salary), SUM(salary)
FROM salaries;

# Find the min, max, avg, total, and count of each employee's salaries
SELECT emp_no, COUNT(salary), MIN(salary), MAX(salary), AVG(salary), SUM(salary)
FROM salaries
GROUP BY emp_no
ORDER BY MAX(salary) DESC;
