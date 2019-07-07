-- get info on department managers hired between 1990 and 1995
SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');

-- get all info on assistant engineers
SELECT 
    *
FROM
    employees E
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            titles T
        WHERE
			T.emp_no = E.emp_no AND
            title = 'Assistant Engineer');
            
/* Assign employee 110022 as manager to employees 10001 to 10020 
 and employee 110039 as manager to employees 10021 to 10040 */
SELECT 
    A.*
FROM
    (SELECT 
        E.emp_no AS employeeID,
            MIN(DE.dept_no) AS dept_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS managerID
    FROM
        employees AS E
    JOIN dept_emp AS DE 
		ON E.emp_no = DE.emp_no
    WHERE
        E.emp_no <= 10020
    GROUP BY E.emp_no
    ORDER BY E.emp_no) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        E.emp_no AS employeeID,
            MIN(DE.dept_no) AS dept_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS managerID
    FROM
        employees AS E
    JOIN dept_emp AS DE 
		ON E.emp_no = DE.emp_no
    WHERE
        E.emp_no BETWEEN 10020 AND 10039
    GROUP BY E.emp_no
    ORDER BY E.emp_no) AS B;

-- set up
drop table if exists emp_manager;

CREATE TABLE emp_manager (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    manager_no INT(11) NOT NULL
);

-- insert datat about employees, their dept number, and their managers
/* A and B should be the same subsets used in the last lecture (SQL Subqueries Nested in SELECT and FROM). 
In other words, assign employee number 110022 as a manager to all employees from 10001 to 10020 (this must be subset A),
 and employee number 110039 as a manager to all employees from 10021 to 10040 (this must be subset B).

Use the structure of subset A to create subset C, where you must assign employee number 110039 as a manager to employee 110022.

Following the same logic, create subset D. Here you must do the opposite - assign employee 110022 as a manager to employee 110039.

Your output must contain 42 rows.*/
insert into emp_manager 
select
	U.*
from
	(SELECT -- A
		A.*
	FROM
		(SELECT 
			E.emp_no AS employeeID,
            MIN(DE.dept_no) AS dept_code,
            (SELECT 
				emp_no
			FROM
				dept_manager
			WHERE
				emp_no = 110022) AS managerID
		FROM
			employees AS E
		JOIN dept_emp AS DE 
			ON E.emp_no = DE.emp_no
		WHERE
			E.emp_no <= 10020
		GROUP BY E.emp_no
		ORDER BY E.emp_no) AS A 
	UNION SELECT -- B
		B.*
	FROM
		(SELECT 
			E.emp_no AS employeeID,
            MIN(DE.dept_no) AS dept_code,
            (SELECT 
				emp_no
			FROM
				dept_manager
			WHERE
				emp_no = 110039) AS managerID
		FROM
			employees AS E
		JOIN dept_emp AS DE 
			ON E.emp_no = DE.emp_no
		WHERE
			E.emp_no > 10020
		GROUP BY E.emp_no
		ORDER BY E.emp_no
		LIMIT 20) AS B
	UNION SELECT -- C
		C.*
	FROM
		(SELECT 
			E.emp_no AS employeeID,
            MIN(DE.dept_no) AS dept_code,
            (SELECT 
				emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS managerID
		FROM
			employees AS E
		JOIN dept_emp AS DE 
			ON E.emp_no = DE.emp_no
		WHERE
			E.emp_no = 110022
		GROUP BY E.emp_no
		ORDER BY E.emp_no) AS C
	UNION SELECT -- D
		D.*
	FROM
		(SELECT 
			E.emp_no AS employeeID,
            MIN(DE.dept_no) AS dept_code,
            (SELECT 
				emp_no
			FROM
				dept_manager
			WHERE
				emp_no = 110022) AS managerID
		FROM
			employees AS E
		JOIN dept_emp AS DE 
			ON E.emp_no = DE.emp_no
		WHERE
			E.emp_no = 110039
		GROUP BY E.emp_no
		ORDER BY E.emp_no) AS D)
AS U;

-- check
select * from emp_manager;

-- Create a procedure that will provide the average salary of all employees.
-- Then, call the procedure.
delimiter $$
create procedure avg_salary()
begin
	select
		avg(salary)
	from salaries;
end $$
delimiter ;

call avg_salary();

-- Create a procedure called ‘emp_info’ that uses as parameters
-- the first and the last name of an individual, and returns their employee number.
select * from employees limit 5;
select emp_no from employees where first_name = 'Georgi' and last_name = 'Facello'; -- only works on single-row results

/* Create a variable, called ‘v_emp_no’, where you will store the output of the procedure you created in the last exercise.

Call the same procedure, inserting the values ‘Aruna’ and ‘Journel’ as a first and last name respectively.

Finally, select the obtained output.*/
set @v_emp_no = 0;
call emp_info('Aruna', 'Journel', @v_emp_no);
select @v_emp_no;

/* Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, 
and returns the salary from the newest contract of that employee.

Hint: In the BEGIN-END block of this program, 
you need to declare and use two variables 
– v_max_from_date that will be of the DATE type, and v_salary, that will be of the DECIMAL (10,2) type.

Finally, select this function. */

SET GLOBAL log_bin_trust_function_creators = 1;

delimiter $$
create function f_emp_info(p_first_name varchar(50), p_last_name varchar(50)) returns decimal(10,2)
begin
	declare v_salary decimal(10,2);
	declare v_max_from_date DATE;

	select max(from_date) into v_max_from_date
    from employees as e
    join salaries as s
		on e.emp_no = s.emp_no
	where p_first_name = e.first_name and
		  p_last_name = e.last_name;
		
    
    select s.salary into v_salary
    from salaries as s
    join employees e
		on s.emp_no = e.emp_no
	where p_first_name = e.first_name and
		  p_last_name = e.last_name and
          s.from_date = v_max_from_date;
          
    return v_salary;
end $$ 
delimiter ;

select f_emp_info('Aruna', 'Journel') as latest_salary;
