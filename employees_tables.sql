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



