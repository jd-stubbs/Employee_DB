-- List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, last_name, first_name, gender, s.salary
	FROM "Employees" AS e
	LEFT JOIN "Salaries" AS s
		ON e.emp_no = s.emp_no;
		
-- List employees who were hired in 1986.
SELECT * FROM "Employees" AS e
	WHERE e.hire_date like '1986%';
	
-- List the manager of each department with the following information:
	-- department number, department name, the manager's employee number,
	-- last name, first name, and start and end employment dates.
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
	FROM "Dept_Manager" AS dm
	LEFT JOIN "Departments" AS d
		on dm.dept_no = d.dept_no
		LEFT JOIN "Employees" AS e
			on dm.emp_no = e.emp_no;
			
-- List the department of each employee with the following information: 
	-- employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
	FROM "Dept_Emp" AS de
	LEFT JOIN "Departments" AS d
		on de.dept_no = d.dept_no
		LEFT JOIN "Employees" AS e
			on de.emp_no = e.emp_no;
			
-- List all employees whose first name is "Hercules" and last names begin with "B".
SELECT * FROM "Employees"
	WHERE last_name LIKE 'B%'
	AND first_name = 'Hercules';

-- List all employees in the Sales department, including their:
	-- employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
	FROM "Dept_Emp" AS de
	LEFT JOIN "Departments" AS d
		ON de.dept_no = d.dept_no
		LEFT JOIN "Employees" AS e
			ON de.emp_no = e.emp_no
	WHERE d.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their:
	-- employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
	FROM "Dept_Emp" AS de
	LEFT JOIN "Departments" AS d
		ON de.dept_no = d.dept_no
		LEFT JOIN "Employees" AS e
			ON de.emp_no = e.emp_no
	WHERE d.dept_name = 'Sales'
	OR d.dept_name = 'Development';
	
-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name AS "Last Name", COUNT(last_name) AS "Frequency" FROM "Employees"
	GROUP BY "Last Name"
	ORDER BY "Frequency" DESC;