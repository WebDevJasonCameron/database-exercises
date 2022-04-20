USE employees;

# More complete list of MySQL functions to explore: http://www.mysqltutorial.org/mysql-functions.aspx

# ========== STRING FUNCTIONS (string manipulation)

# CONCAT() - used to concatenate strings together

SELECT 'Something';

SELECT CONCAT('Hello', ' ' , 'World');

# SUBSTRING(<STRING>, <START>, <LENGTH>) 1 is the first character

SELECT SUBSTRING('Hello World', 1, 5);

# Use CONCAT() to output the following for all employees...
# "Georgi Facello was born 1953-09-02" (and include column for emp_no)
SELECT CONCAT(first_name, ' ', last_name, ' was born ', birth_date) AS 'Employee Info', emp_no
FROM employees;


# LENGTH() - used to find the length of a string
SELECT LENGTH('supercalifragilisticexpialidocious');

# Output first_name, and length of first name as two columns
SELECT first_name, LENGTH(first_name) FROM employees;

# COMBINING FUNCTIONS
SELECT UPPER(CONCAT('Hello', TRIM(' world   ')));


# ========== DATE FUNCTIONS (return units of time)

# NOW()
SELECT NOW();

# DAY(), MONTH(), YEAR()

SELECT DAY('1999-04-02');
SELECT MONTH('1999-04-02');
SELECT YEAR('1999-04-02');

# CURDATE()
SELECT CURDATE();

# CURTIME()
SELECT CURTIME();

# UNIX_TIMESTAMP()

SELECT UNIX_TIMESTAMP();

SELECT CONCAT(
               'Teaching people to code for ',
               UNIX_TIMESTAMP() - UNIX_TIMESTAMP('2014-02-04'),
               ' seconds'
           );

SELECT * FROM dept_emp WHERE to_date > NOW();

# ========== AGGREGATE FUNCTIONS (info about results)

# /////// COUNT()

# count all table records
SELECT COUNT(*) FROM salaries WHERE to_date > NOW();


# count total filtered results
SELECT COUNT(*)
FROM employees
WHERE birth_date = '1953-09-02';

SELECT COUNT(birth_date) # will not count null birth_date values
FROM employees
WHERE birth_date = '1953-09-02';

# count each unique instance of a value
SELECT COUNT(DISTINCT birth_date)
FROM employees;

SELECT COUNT(DISTINCT salary) FROM salaries;


# count each set of identical results
SELECT birth_date, COUNT(birth_date)
FROM employees
GROUP BY birth_date;


# MAX() / MIN()
SELECT MAX(birth_date) FROM employees;
SELECT MIN(birth_date) FROM employees;

# SUM()
SELECT SUM(salary) FROM salaries WHERE to_date > NOW();

SELECT salary, from_date
FROM salaries
WHERE emp_no = 10001
ORDER BY from_date ASC;

SELECT MIN(salary)
FROM salaries
WHERE emp_no = 10001;



# AVG()

SELECT AVG(salary)
FROM salaries;



# ========== MATH FUNCTIONS (perform calculations)

# ROUND()
SELECT ROUND(AVG(salary))
FROM salaries;

# COS()

SELECT COS(2);

# RAND()
SELECT RAND();

