-- Data Analysis --
SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM dept_employees;
SELECT * FROM manager;


-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
-- Since it is asking for each employee, use full outer join to make sure all employees are covered though there may be some null values. 
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
full outer join salaries
on employees.emp_no = salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where hire_date >= '1986-01-01' and hire_date <= '1986-12-31';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
-- This requires joining 3 tables together.
select departments.dept_no, departments.dept_name, manager.emp_no, employees.last_name, employees.first_name
from departments
join manager
on departments.dept_no = manager.dept_no
join employees
on manager.emp_no = employees.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
-- Since it is asking for each employee, use full outer join to make sure all employees are covered though there may be some null values. 
select dept_employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_employees
full outer join employees
on dept_employees.emp_no = employees.emp_no
full outer join departments
on dept_employees.dept_no = departments.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select dept_employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_employees
full outer join employees
on dept_employees.emp_no = employees.emp_no
full outer join departments
on dept_employees.dept_no = departments.dept_no
where departments.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select dept_employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_employees
full outer join employees
on dept_employees.emp_no = employees.emp_no
full outer join departments
on dept_employees.dept_no = departments.dept_no
where departments.dept_name = 'Sales' or departments.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select 
    last_name,
	count(last_name) as "last name count"
from employees
group by last_name
order by "last name count" desc;








