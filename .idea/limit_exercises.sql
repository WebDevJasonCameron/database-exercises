USE employees;

# 1. Create a new SQL script called limit_exercises.sql.
#    <--DONE

# 2. MySQL provides a way to return only unique results from our
#    queries with the keyword DISTINCT. For example, to find all
#    the unique titles within the company, we could run the
#    following query:
SELECT DISTINCT last_names FROM employees
Order by last_name DESC
LIMIT 10;

# 3. Create a query to get the top 5 salaries and display just
#    the employees number from the salaries table. The employee
#    number results should be:
SELECT DISTINCT emp_no FROM salaries
Order by salary DESC
LIMIT 5;


# 4. Try to think of your results as batches, sets, or pages.
#    The first five results are your first page. The five after
#    that would be your second page, etc. Update the previous
#    query to find the tenth page of results. The employee
#    number results should be:
SELECT DISTINCT emp_no FROM salaries
Order by salary DESC
LIMIT 5 OFFSET 45;

#  OFFSET = PAGES * LIMIT - LIMT