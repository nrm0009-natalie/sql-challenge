CREATE TABLE  departments(
dept_no VARCHAR(4),
dept_name VARCHAR(30) NOT NULL,
PRIMARY KEY (dept_no));

CREATE TABLE employees(
emp_no INT,
birth_date VARCHAR(30) NOT NULL,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
gender VARCHAR(2) NOT NULL,
hire_date VARCHAR(30) NOT NULL,
PRIMARY KEY (emp_no));

CREATE TABLE salaries(
emp_no INT NOT NULL,
salary INT NOT NULL,
from_date VARCHAR(30) NOT NULL,
to_date VARCHAR(30) NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

CREATE TABLE dept_emp(
emp_no INT NOT NULL,
dept_no VARCHAR(6) NOT NULL,
from_date VARCHAR(30) NOT NULL,
to_date VARCHAR(30) NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no));


CREATE TABLE dept_manager(
dept_no VARCHAR(6) NOT NULL,
emp_no INT NOT NULL,	
from_date VARCHAR(30) NOT NULL,
to_date VARCHAR(30) NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no));

CREATE TABLE titles(
emp_no INT NOT NULL,
title VARCHAR (30) NOT NULL,
from_date VARCHAR(30) NOT NULL,
to_date VARCHAR(30) NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

--Homework question #1
SELECT employees.emp_no, employees.last_name, employees.first_name, 
employees.gender, salaries.salary
FROM salaries
INNER JOIN employees 
ON employees.emp_no=salaries.emp_no;

--Homework question #2
SELECT first_name, last_name FROM employees
WHERE hire_date LIKE '1986%';

--Homework question #3
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, 
employees.last_name, employees.first_name, dept_manager.from_date,
dept_manager.to_date
FROM dept_manager
JOIN employees ON employees.emp_no=dept_manager.emp_no
JOIN departments ON departments.dept_no=dept_manager.dept_no;

--Homework question #4
SELECT employees.emp_no, employees.last_name, employees.first_name,
departments.dept_name
FROM dept_manager
JOIN employees ON employees.emp_no=dept_manager.emp_no
JOIN departments ON departments.dept_no=dept_manager.dept_no;

--Homework question #5
SELECT first_name, last_name FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--Homework question #6
SELECT employees.emp_no, employees.first_name, employees.last_name, 
departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no=employees.emp_no
JOIN departments ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name = 'Sales';

--Homework question #7
SELECT employees.emp_no, employees.first_name, employees.last_name, 
departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no=employees.emp_no
JOIN departments ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';

--Homework question #8
SELECT last_name, COUNT(last_name) AS "Last_name_frequency"
FROM employees
GROUP BY last_name
ORDER BY "Last_name_frequency" DESC;

