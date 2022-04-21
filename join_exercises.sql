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
SELECT d.dept_name AS "Department Name",
       concat(e.first_name, ' ', e.first_name) AS "Department Manager",
       s.salary
FROM employees e
         JOIN dept_manager dm on e.emp_no = dm.emp_no
         JOIN departments d on dm.dept_no = d.dept_no
         JOIN salaries s on e.emp_no = s.emp_no
WHERE dm.to_date > NOW()
    AND s.to_date > NOW();


# 4. Find the current titles of employees currently working in the Customer
#    Service department.
SELECT t.title AS Title,
       COUNT(de.emp_no) AS Total
FROM titles t
    JOIN dept_emp de on t.emp_no = de.emp_no
WHERE de.dept_no = 'd009'
    AND de.to_date > NOW()
    AND t.to_date > NOW()
GROUP BY t.title;



# 5. Find the current salary of all current managers.
SELECT d.dept_name AS "Department Name",
       CONCAT(e.first_name, ' ', e.last_name) AS "Department Manager",
       s.salary AS "Salary"
FROM departments d
    JOIN dept_manager dm on d.dept_no = dm.dept_no
    JOIN employees e on dm.emp_no = e.emp_no
    JOIN salaries s on e.emp_no = s.emp_no
WHERE s.to_date > NOW()
    and dm.to_date > NOW();


# Bonus Find the names of all current employees, their department name,
#       and their current manager's name
SELECT CONCAT(e.first_name, ' ', e.last_name) AS "Employee",
       d.dept_name AS "Department",
       CONCAT(e2.first_name, ' ', e2.last_name) AS "Manager"
           FROM employees e
               JOIN dept_emp de on e.emp_no = de.emp_no
               JOIN departments d on de.dept_no = d.dept_no,
                employees e2
               JOIN dept_manager dm on e2.emp_no = dm.emp_no
WHERE de.to_date > NOW();