/* Create an SQL stored procedure that will allow you to obtain
the average male and female salary per department within a certain salary range. 
Let this range be defined by two values the user can insert when calling the procedure.

Finally, visualize the obtained result-set in Tableau as a double bar chart.  */

DROP PROCEDURE IF EXISTS salary_range;

DELIMITER $$
CREATE PROCEDURE salary_range (IN p_lower_bound FLOAT, IN p_upper_bound FLOAT)
BEGIN
	SELECT
		e.gender,
        ROUND(AVG(s.salary), 2) AS avg_salary,
        d.dept_name        
	FROM t_salaries AS s
		JOIN t_employees AS e
			ON s.emp_no = e.emp_no
		JOIN t_dept_emp AS de
			ON e.emp_no = de.emp_no
		JOIN t_departments AS d
			ON de.dept_no = d.dept_no
	WHERE s.salary
		BETWEEN p_lower_bound AND p_upper_bound
	GROUP BY e.gender, d.dept_name;
END $$
DELIMITER ;

-- test
CALL salary_range(50000, 90000);