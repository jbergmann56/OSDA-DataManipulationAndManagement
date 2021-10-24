-- get info on department managers hired between 1990 and 1995
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
