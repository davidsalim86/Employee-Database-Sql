-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
FROM salaries s
INNER JOIN employees e
ON e.emp_no = s.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

-- 3. List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name.

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM departments d
INNER JOIN departments_managers dm
ON dm.dept_no = d.dept_no
INNER JOIN employees e
ON dm.emp_no = e.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, 
-- and department name.

-- use join
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments_employees de
INNER JOIN employees e
ON e.emp_no = de.emp_no
INNER JOIN departments d
ON de.dept_no = d.dept_no;

-- create view
CREATE VIEW departments_employees_list AS
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments_employees de
INNER JOIN employees e
ON e.emp_no = de.emp_no
INNER JOIN departments d
ON de.dept_no = d.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
ANd last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

-- use view
SELECT * 
from departments_employees_list
WHERE dept_name = 'Sales'; 

-- use join
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments_employees de
INNER JOIN employees e
ON e.emp_no = de.emp_no
INNER JOIN departments d
ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, 
-- and department name.

-- use view
SELECT * 
from departments_employees_list
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

-- use join
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments_employees de
INNER JOIN employees e
ON e.emp_no = de.emp_no
INNER JOIN departments d
ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS count_of_last_name
FROM employees
GROUP BY last_name
ORDER BY count_of_last_name DESC;