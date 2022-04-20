USE employees;
# 1. Copy the order_by_exercises.sql script and save it as
#    functions_exercises.sql.
#    <--DONE


# 2. Update your queries for employees whose names start and end with 'E'. Use
#    concat() to combine their first and last name together as a single column
#    in your results.
SELECT CONCAT(first_name, ' ', last_name) FROM employees
WHERE last_name LIKE 'e%e';


# 3. Find all employees born on Christmas — 842 rows.
SELECT count(*) FROM employees
WHERE month(birth_date) = 12
    AND day(birth_date) = 25;

# 4. Find all employees hired in the 90s and born on Christmas — 362 rows.
SELECT count(*) FROM employees
WHERE month(birth_date) = 12
  AND day(birth_date) = 25
  AND year(hire_date) > 1989;

SELECT count(*) FROM employees
WHERE month(birth_date) = 12
  AND day(birth_date) = 25
  AND hire_date LIKE '199%';


# 5. Change the query for employees hired in the 90s and born on Christmas such
#    that the first result is the oldest employee who was hired last. It should
#    be Khun Bernini.
SELECT first_name, last_name, hire_date FROM employees
WHERE month(birth_date) = 12
  AND day(birth_date) = 25
  AND year(hire_date) > 1989
ORDER BY birth_date, hire_date DESC;


# 6. For your query of employees born on Christmas and hired in the 90s, use
#    datediff() to find how many days they have been working at the company
#    (Hint: You might also need to use now() or curdate()).
SELECT concat('Days at company: ', datediff(NOW(), hire_date)) AS 'Days at Company',
       concat(first_name, ' ', last_name) AS 'Name'
FROM employees
WHERE hire_date LIKE '199%'
    AND birth_date LIKE '%12-25'
ORDER BY birth_date ASC, hire_date DESC;







# FROM PRIOR LS
SELECT * FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;



SELECT first_name, last_name FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;


SELECT first_name, last_name FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name ;


           SELECT last_name FROM employees
     WHERE last_name LIKE '%e%'
     ORDER BY emp_no;


SELECT last_name FROM employees
WHERE last_name LIKE 'e%'
ORDER BY emp_no DESC;
