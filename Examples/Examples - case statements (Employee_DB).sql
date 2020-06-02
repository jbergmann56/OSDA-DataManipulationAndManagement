/* obtain a result set containing the employee number, first name, and
 last name of all employees with a number higher than 109990. 
 Create a fourth column in the query, indicating whether this employee is also a manager, 
 according to the data provided in the dept_manager table, or a regular employee. */
select 
	E.emp_no, 
    E.first_name, 
    E.last_name,
    if(E.emp_no = DM.emp_no, 'Manager', 'Employee') as is_manager
from employees E
left join dept_manager DM
	on E.emp_no = DM.emp_no
where E.emp_no > 109990;

-- alternative
SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
    END AS is_manager
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON dm.emp_no = e.emp_no
WHERE
    e.emp_no > 109990;
    
/* Extract a dataset containing the following information about the managers: 
employee number, first name, and last name. 
Add two columns at the end – one showing the difference between the maximum and minimum salary of that employee, 
and another one saying whether this salary raise was higher than $30,000 or NOT. */
select 
	E.emp_no, 
	E.first_name,
    E.last_name,
    MAX(salary) - MIN(salary) as salary_change,
    IF(MAX(salary) - MIN(salary) > 30000, 'YES', 'NOT') as greater_than_30k
from employees E
join dept_manager DM
	on E.emp_no = DM.emp_no
join salaries S
	on DM.emp_no = S.emp_no
group by first_name, last_name
order by salary_change DESC;

-- alt1
SELECT
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raised by more then $30,000'
        ELSE 'Salary was NOT raised by more then $30,000'
    END AS salary_raise
FROM
    dept_manager dm
        JOIN
    employees e ON e.emp_no = dm.emp_no
        JOIN
    salaries s ON s.emp_no = dm.emp_no
GROUP BY s.emp_no;

 
-- alt2
SELECT
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    IF(MAX(s.salary) - MIN(s.salary) > 30000, 'Salary was raised by more then $30,000', 'Salary was NOT raised by more then $30,000') AS salary_delta
FROM
    dept_manager dm
        JOIN
    employees e ON e.emp_no = dm.emp_no
        JOIN
    salaries s ON s.emp_no = dm.emp_no
GROUP BY s.emp_no;

