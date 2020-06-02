/* Create a visualization that provides a breakdown between the male and female employees working in the company each year, starting from 1990. */

-- calendar year, sex, total_employees of each sex, from 1990 forward 
SELECT 
    YEAR(DE.from_date) AS calendar_year,
    E.gender,
    COUNT(E.emp_no) AS total_employees
FROM
    t_employees E
join t_dept_emp DE
	on E.emp_no = DE.emp_no
WHERE
    YEAR(DE.from_date) >= 1990
GROUP BY YEAR(DE.from_date), gender
ORDER BY calendar_year;

-- alt
SELECT 
    YEAR(d.from_date) AS calendar_year,
    e.gender,     
    COUNT(e.emp_no) AS num_of_employees
FROM     
     t_employees e         
          JOIN     
     t_dept_emp d ON d.emp_no = e.emp_no
GROUP BY calendar_year , e.gender 
HAVING calendar_year >= 1990
order by calendar_year;