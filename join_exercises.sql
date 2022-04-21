USE employees;

# 1. Create a file named join_exercises.sql to do your work in.
#    <<--DONE
SELECT d.dept_name AS "Department Name",
       concat(e.first_name, ' ', e.first_name) AS "Department Manager"
FROM employees e
    JOIN dept_manager dm on e.emp_no = dm.emp_no
    JOIN departments d on dm.dept_no = d.dept_no
WHERE dm.to_date > NOW();


# 2. Using the example in the Associative Table Joins section as a guide,
#    write a query that shows each department along with the name of the
#    current manager for that department.
SELECT d.dept_name AS "Department Name",
       concat(e.first_name, ' ', e.first_name) AS "Department Manager"
FROM employees e
         JOIN dept_manager dm on e.emp_no = dm.emp_no
         JOIN departments d on dm.dept_no = d.dept_no
WHERE dm.to_date > NOW()
    AND e.gender = 'F';


# 3. Find the name of all departments currently managed by women.

# 4. Find the current titles of employees currently working in the Customer
#    Service department.

# 5. Find the current salary of all current managers.

# Bonus Find the names of all current employees, their department name,
#       and their current manager's name