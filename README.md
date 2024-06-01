# SQL Challenge - Pewlett Hackard Research Project

## Background
This project involves analyzing the employee data from the 1980s and 1990s of Pewlett Hackard. The project is divided into three main parts: Data Modeling, Data Engineering, and Data Analysis.

## Project Structure
This project is divided into three main parts:
- **Data Modeling**: Creating an Entity Relationship Diagram (ERD) based on the provided CSV files.
- **Data Engineering**: Creating table schemas, importing data into SQL tables, and setting up the database.
- **Data Analysis**: Writing SQL queries to answer specific questions about the data.

## Files
- `ERD.png`: Entity Relationship Diagram for the database.
- `schema.sql`: SQL file containing table schemas.
- `queries.sql`: SQL file containing queries for data analysis.
- `README.md`: This file explaining the project.

## Data Modeling
The Entity Relationship Diagram (ERD) was created based on the provided CSV files. The following tables were identified:
- **Employees**: Employee details including employee number, name, birth date, gender, and hire date.
- **Departments**: Department details including department number and name.
- **Department_Employee**: Relationship between employees and departments.
- **Department_Manager**: Details of department managers.
- **Salaries**: Employee salary details.
- **Titles**: Employee titles over time.

### Data Engineering
- Created a table schema for each CSV file.
- Ensured to specify data types, primary keys, foreign keys, and constraints.
- Created the tables in the correct order to handle foreign keys.
- Imported each CSV file into its corresponding SQL table.

### Data Analysis
The following SQL queries were used to analyze the data from Pewlett Hackard:

--Employee Details with Salaries 
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM "Employees" AS emp
LEFT JOIN "Salaries" AS sal
ON emp.emp_no = sal.emp_no;

--Employees Hired in 1986 
SELECT emp.first_name, emp.last_name, emp.hire_date
FROM "Employees" AS emp
WHERE EXTRACT(YEAR FROM emp.hire_date) = 1986;

--Managers of Each Department 
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM "Department_Manager" AS dm
JOIN "Employees" AS e ON dm.emp_no = e.emp_no
JOIN "Departments" AS d ON dm.dept_no = d.dept_no;

--Employees and Their Departments 
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Department_Employee" AS de
JOIN "Employees" AS e ON de.emp_no = e.emp_no
JOIN "Departments" AS d ON de.dept_no = d.dept_no;

--Specific Employees Named Hercules 
SELECT emp.first_name, emp.last_name, emp.sex
FROM "Employees" AS emp
WHERE emp.first_name = 'Hercules' AND emp.last_name LIKE 'B%';

--Employees in Sales Department
SELECT emp.emp_no, emp.last_name, emp.first_name
FROM "Department_Employee" AS de
JOIN "Employees" AS emp ON de.emp_no = emp.emp_no
JOIN "Departments" AS dept ON de.dept_no = dept.dept_no
WHERE dept.dept_name = 'Sales';

--Employees in Sales and Development Departments
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM "Department_Employee" AS de
JOIN "Employees" AS emp ON de.emp_no = emp.emp_no
JOIN "Departments" AS dept ON de.dept_no = dept.dept_no
WHERE dept.dept_name IN ('Sales', 'Development');

--Frequency Counts of Last Names 
SELECT emp.last_name, COUNT(emp.last_name) AS name_count
FROM "Employees" AS emp
GROUP BY emp.last_name
ORDER BY name_count DESC;
