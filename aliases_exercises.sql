USE employees;

# 1. Create a new file named aliases_exercises.sql.
#    <--DONE

# 2. Use the employees database.
#    <--DONE

# 3. Return 10 employees in a result set named 'full_name' in the format
#    of 'last name, first name' for each employee.
SELECT concat(first_name, ' ', last_name) AS full_name
FROM employees
LIMIT 10;

# 4. Add the date of birth for each employee as 'DOB' to the query.
SELECT concat(first_name, ' ', last_name) AS full_name,
       birth_date AS DOB
FROM employees
LIMIT 10;

# 5. Update the query to format full name to include the employee number
#    so it is formatted as 'employee number - last name, first name'.
SELECT CONCAT(emp_no, ' - ', last_name, ', ', first_name) AS full_name,
       birth_date AS DOB
FROM employees
LIMIT 10;