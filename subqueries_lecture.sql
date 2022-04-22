USE employees;

SELECT emp_no FROM dept_manager;

SELECT birth_date
FROM employees
WHERE emp_no IN (
    SELECT emp_no FROM dept_manager
    );

SELECT CONCAT(first_name, ' ', last_name) AS "Name",
       birth_date AS "Birth Date"
FROM employees
WHERE emp_no IN (
    SELECT emp_no FROM dept_manager
);

USE code_test_db;

SELECT * FROM preferences;

INSERT INTO preferences (person_id, album_id)
VALUES (
        (SELECT id
        FROM persons
        WHERE first_name = 'Tarea'
            ),
        (SELECT id
        FROM albums
        WHERE name = 'Rumours')
        );


