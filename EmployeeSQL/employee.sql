-- drop tables if extst
DROP TABLE IF EXISTS department CASCADE;
DROP TABLE IF EXISTS employee_dept CASCADE;
DROP TABLE IF EXISTS manager CASCADE;
DROP TABLE IF EXISTS salary CASCADE;
DROP TABLE IF EXISTS employee CASCADE;

-- Create tables
-- department
CREATE TABLE department(
	dept_no VARCHAR(10) PRIMARY KEY,
	dept_name varchar(50)
);
-- employee_dept
CREATE TABLE employee_dept(
	emp_no INT,
	dept_no VARCHAR(10),
  	PRIMARY KEY (emp_no, dept_no)
);
-- manager
CREATE TABLE manager(
	dept_no VARCHAR(10),
	emp_no INT PRIMARY KEY,
	FOREIGN KEY (dept_no) REFERENCES department(dept_no)
);
-- salary
CREATE TABLE salary (
	emp_no INT PRIMARY KEY,
	salary INT
);
-- employee
CREATE TABLE employee (
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR(140),
	birth_date DATE NOT NULL,
	first_name VARCHAR(140),
	last_name VARCHAR(140),
	sex VARCHAR(10),
	hire_date DATE NOT NULL
);
-- Queries
-- 1. List employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
	FROM employee AS e
	INNER JOIN salary AS s 
	ON e.emp_no=s.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
	FROM employee 
	WHERE EXTRACT(YEAR FROM hire_date) = 1986
	
-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, n.emp_no, e.last_name, e.first_name
	FROM department as d
	INNER JOIN manager AS n
	ON (d.dept_no=n.dept_no)
	JOIN employee as e
	ON (n.emp_no=e.emp_no)	

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
	FROM employee as e
	INNER JOIN employee_dept as n
	ON (e.emp_no=n.emp_no)
	JOIN department as d
	ON (n.dept_no=d.dept_no)

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex 
	FROM employee
	WHERE first_name = 'Hercules' AND SUBSTRING (last_name, 1, 1) = 'B'
	
-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
	FROM employee as e
	INNER JOIN employee_dept as n
	ON (e.emp_no=n.emp_no)
	JOIN department as d
	ON (n.dept_no=d.dept_no)
	WHERE (d.dept_name='Sales')
	
-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
	FROM employee as e
	INNER JOIN employee_dept as n
	ON (e.emp_no=n.emp_no)
	JOIN department as d
	ON (n.dept_no=d.dept_no)
	WHERE (d.dept_name='Sales') OR (d.dept_name='Development')
	
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) as "total"
	FROM employee
	GROUP BY last_name
	ORDER BY total DESC