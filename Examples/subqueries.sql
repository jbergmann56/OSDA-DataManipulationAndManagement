-- get info on department managers hired between 1990 and 1995
SELECT     *
FROM    dept_manager
WHERE emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');

-- get all info on assistant engineers
SELECT     *
FROM    employees E
WHERE emp_no IN (SELECT 
            emp_no
        FROM
            titles T
        WHERE
			T.emp_no = E.emp_no AND
            title = 'Assistant Engineer');
            
/* Assign employee 110022 as manager to employees 10001 to 10020 
 and employee 110039 as manager to employees 10021 to 10040 */
SELECT     A.*
FROM  (SELECT 
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
/* drop table if exists emp_manager;
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

Your output must contain 42 rows
insert into emp_manager .*/
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

