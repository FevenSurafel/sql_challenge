--This query retrieves the employee number, last name, first name, sex, and salary of each employee:
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM "Employees" AS emp
LEFT JOIN "Salaries" AS sal
ON emp.emp_no = sal.emp_no;

--This query retrieves the first name, last name, and hire date of employees who were hired in the year 1986:
SELECT emp.first_name, emp.last_name, emp.hire_date
FROM "Employees" AS emp
WHERE EXTRACT(YEAR FROM emp.hire_date) = 1986;

--This query lists the manager of each department along with their department number, department name, employee number, last name, and first name:
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM "Department_Manager" AS dm
JOIN "Employees" AS e ON dm.emp_no = e.emp_no
JOIN "Departments" AS d ON dm.dept_no = d.dept_no;

--This query lists the department number for each employee along with that employee’s employee number, last name, first name, and department name:
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Department_Employee" AS de
JOIN "Employees" AS e ON de.emp_no = e.emp_no
JOIN "Departments" AS d ON de.dept_no = d.dept_no;

--This query lists the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B:
SELECT emp.first_name, emp.last_name, emp.sex
FROM "Employees" AS emp
WHERE emp.first_name = 'Hercules' AND emp.last_name LIKE 'B%';

--This query lists each employee in the Sales department, including their employee number, last name, and first name:
SELECT emp.emp_no, emp.last_name, emp.first_name
FROM "Department_Employee" AS de
JOIN "Employees" AS emp ON de.emp_no = emp.emp_no
JOIN "Departments" AS dept ON de.dept_no = dept.dept_no
WHERE dept.dept_name = 'Sales';

--This query lists each employee in the Sales and Development departments, including their employee number, last name, first name, and department name:
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM "Department_Employee" AS de
JOIN "Employees" AS emp ON de.emp_no = emp.emp_no
JOIN "Departments" AS dept ON de.dept_no = dept.dept_no
WHERE dept.dept_name IN ('Sales', 'Development');

--This query lists the frequency counts, in descending order, of all the employee last names:
SELECT emp.last_name, COUNT(emp.last_name) AS name_count
FROM "Employees" AS emp
GROUP BY emp.last_name
ORDER BY name_count DESC;