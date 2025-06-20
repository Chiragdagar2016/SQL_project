--1. List all the employee details. 

select * from EMPLOYEE

--2. List all the department details. 

select * from [dbo].[DEPARTMENT]

--3. List all job details. 

select * from [dbo].[JOB]

--4. List all the locations. 

select * from [dbo].[LOCATION]

--5. List out the First Name, Last Name, Salary, Commission for all Employees. 

select First_Name, Last_name, salary, comm from EMPLOYEE

--6. List out the Employee ID, Last Name, Department ID for all employees and alias.
--Employee ID as "ID of the Employee", Last Name as "Name of the  Employee", Department ID as "Dep_id". 

select Employee_ID as 'ID of the Employee', Last_name as 'Name of the  Employee', Department_ID as 'Dep_id' 
from EMPLOYEE

--7. List out the annual salary of the employees with their names only. 

select First_name, Last_name, (salary*12) as 'Annual salary' from EMPLOYEE

--WHERE Condition: 

--1. List the details about "Smith". 

select * from EMPLOYEE
where last_name = 'Smith'

--2. List out the employees who are working in department 20. 

select * from EMPLOYEE
where Department_id=20;

--3. List out the employees who are earning salary between 2000 and 3000. 

select * from EMPLOYEE
Where salary between 2000 and 3000;

--4. List out the employees who are working in department 10 or 20. 

select * from EMPLOYEE
Where department_id in (10,20);

--5. Find out the employees who are not working in department 10 or 30. 

select * from EMPLOYEE
Where department_id not in (10,30);

--6. List out the employees whose name starts with 'L'. 

select * from EMPLOYEE
where first_name like 'L%' or middle_name like 'L%' or Last_name like 'L%';

--7. List out the employees whose name starts with 'L' and ends with 'E'. 

select * from EMPLOYEE
where first_name like 'L%e' or middle_name like 'L%e' or Last_name like 'L%e';

--8. List out the employees whose name length is 4 and start with 'J'. 

select * from EMPLOYEE
where first_name like 'J___' or middle_name like 'J___' or Last_name like 'J___';

--9. List out the employees who are working in department 30 and draw the salaries more than 2500. 

select * from EMPLOYEE
Where department_id= 30 and salary>2500;

--10. List out the employees who are not receiving commission. 

select * from EMPLOYEE
Where Comm is Null;

--ORDER BY Clause: 

--1. List out the Employee ID and Last Name in ascending order based on the Employee ID. 

select Employee_ID, Last_name from EMPLOYEE
order by Employee_ID;

--2. List out the Employee ID and Name in descending order based on salary. 

select Employee_ID, first_name, Middle_name, Last_name from EMPLOYEE
order by salary desc;

--3. List out the employee details according to their Last Name in ascending-order. 

select * from EMPLOYEE
order by Last_name;

--4. List out the employee details according to their Last Name in ascending order and then Department ID in descending order. 

select * from EMPLOYEE
order by Last_name Asc, Department_ID Desc

--GROUP BY and HAVING Clause: 

--1. List out the department wise maximum salary, minimum salary and average salary of the employees. 

select Department_ID, Max(salary) as 'maximum salary', Min(salary) as 'minimum salary', Avg(salary) as 'Average salary'
from EMPLOYEE
Group by Department_ID;

--2. List out the job wise maximum salary, minimum salary and average salary of the employees. 

select Job_id, Max(salary) as 'maximum salary', Min(salary) as 'minimum salary', Avg(salary) as 'Average salary'
from EMPLOYEE
Group by Job_id;

--3. List out the number of employees who joined each month in ascending order. 

select Datename(Month, Hire_date) as Hired_month, Count(Employee_id) as  'No of Employee'  from EMPLOYEE
Group by  Datename(Month, Hire_date)
order by Count(Employee_id);

--4. List out the number of employees for each month and year in ascending order based on the year and month. 

select Datename(Year, Hire_date) as Hired_Year, Datename(Month, Hire_date) as Hired_month, 
Count(Employee_id) as  'No of Employee'  from EMPLOYEE
Group by  Datename(Year, Hire_date), Datename(Month, Hire_date)
order by Count(Employee_id);

--5. List out the Department ID having at least four employees. 


select Department_ID, Count(Employee_id) as 'No of Employee' from EMPLOYEE
Group by Department_ID
Having Count(Employee_id)>=4;

--6. How many employees joined in February month. 

select Year(Hire_date) as Hired_year, Count(Employee_id) as 'Count of Employee' from  EMPLOYEE
Where Month(Hire_date)= 2
Group by Year(Hire_date)
order by Year(Hire_date)

--7. How many employees joined in May or June month. 

select Datename(Month, Hire_date) as 'Hired Month', Count(Employee_id) as 'Count of Employee' from  EMPLOYEE
Where Month(Hire_date) in (5,6)
Group by Datename(Month, Hire_date), Month(Hire_date)
order by Month(Hire_date)

--8. How many employees joined in 1985? 

select Year(Hire_date) as 'Hired year', Count(employee_id) as ' No of Emp joined' from EMPLOYEE
Where Year(Hire_date) = 1985
Group by Year(Hire_date)

--9. How many employees joined each month in 1985? 

select Datename(month, Hire_date) as 'Joined Month', Count(employee_id) as ' No of Emp joined' from EMPLOYEE
Where Year(Hire_date) = 1985
Group by Datename(month, Hire_date), Month(Hire_date)
order by  Month(Hire_date)

--10. How many employees were joined in April 1985? 

select Datename(month, Hire_date) as 'Joined Month', Count(employee_id) as ' No of Emp joined' from EMPLOYEE
Where Year(Hire_date) = 1985 and Month(Hire_date)= 4
Group by Datename(month, Hire_date), Month(Hire_date)
order by  Month(Hire_date)

--11. Which is the Department ID having greater than or equal to 3 employees joining in April 1985? 

select Department_ID, Count(employee_id) as ' No of Emp joined' from EMPLOYEE
Where Year(Hire_date) = 1985 and Month(Hire_date)= 4
Group by Department_ID
Having Count(employee_id)>=3

--Joins: 

--1. List out employees with their department names. 

select E.employee_id, E.first_name, E.last_name, E.department_id, D.name from EMPLOYEE E
join Department D
on E.department_id= D.department_id

--2. Display employees with their designations. 

select E.employee_id, E.first_name, E.last_name, E.JOB_ID, J.DESIGNATION from EMPLOYEE E
join Job J
on E.JOB_ID= J.Job_id

--3. Display the employees with their department names and city. 

select E.employee_id, E.first_name, E.last_name, E.department_id, D.name, L.City from EMPLOYEE E
join Department D
on E.department_id= D.department_id
Join LOCATION L
on D.LOCATION_id= L.LOCATION_id

--4. How many employees are working in different departments? Display with department names. 

select Count(employee_id) as 'No of employee', D.name from EMPLOYEE E
join DEPARTMENT D
on E.DEPARTMENT_ID=D.Department_Id
Group by Name

--5. How many employees are working in the sales department? 

select Count(employee_id) as 'No of employee', D.name from EMPLOYEE E
join DEPARTMENT D
on E.DEPARTMENT_ID=D.Department_Id
Group by Name
Having name =  'sales';

--6. Which is the department having greater than or equal to 3 employees and display the department names in ascending order.

select Count(employee_id) as 'No of employee', D.name from EMPLOYEE E
join DEPARTMENT D
on E.DEPARTMENT_ID=D.Department_Id
Group by Name
Having Count(employee_id)>= 3
order by name Asc;

--7. How many employees are working in 'Dallas'? 

select Count(employee_id) as 'No of employee', L.city from EMPLOYEE E
Join DEPARTMENT D
on E.DEPARTMENT_ID=D.Department_Id
Join Location L
on D.Location_Id=L.Location_ID
Group by city
Having  city = 'Dallas'

--8. Display all employees in sales or operation departments.

select E.employee_id, E.first_name, E.last_name, E.salary, D.name from EMPLOYEE E
Inner Join DEPARTMENT D
on E.DEPARTMENT_ID=D.Department_Id
Where D.Name in ('sales', 'operations')

--CONDITIONAL STATEMENT 

--1. Display the employee details with salary grades. Use conditional statement to create a grade column. 

select EMPLOYEE_id, First_name, Last_name, salary, 
	case 
		when salary>=2500 then 'Top'
		when salary>=1500 then 'Middle'
		Else 'Lower'
		End as 'salary Grade'
from employee

--2. List out the number of employees grade wise. Use conditional statement to create a grade column. 

select 
	case 
		when salary>=2500 then 'Top'
		when salary>=1500 then 'Middle'
		Else 'Lower'
		End as 'salary Grade',
		Count(employee_id) as 'No of Employees'
from employee
		Group by salary;

--3. Display the employee salary grades and the number of employees between 2000 to 5000 range of salary. 
SELECT 
    CASE 
        WHEN Salary >= 1000 THEN 'A'
        WHEN Salary BETWEEN 1000 AND 4000 THEN 'B'
        WHEN Salary >= 4000 THEN 'C'
        ELSE 'D'
    END AS Salary_Grade,
    COUNT(Employee_ID) AS Employee_Count
FROM Employee
WHERE Salary BETWEEN 2000 AND 5000
GROUP BY SALARY

--Subqueries: 

--1. Display the employees list who got the maximum salary. 

select * from [EMPLOYEE]
where salary= (select max(salary) from EMPLOYEE)

--2. Display the employees who are working in the sales department. 

select E.employee_id, E.first_name, E.Middle_name, E.last_name, E.job_id, E.manager_id, E.hire_date, E.salary, E.comm, 
E.DEPARTMENT_id, D.Name from EMPLOYEE E
Inner Join DEPARTMENT D
on E.DEPARTMENT_id=D.DEPARTMENT_id
where D.name= 'sales'

--3. Display the employees who are working as 'Clerk'. 

select E.employee_id, E.first_name, E.Middle_name, E.last_name, E.job_id, E.manager_id, E.hire_date, E.salary, E.comm, 
E.DEPARTMENT_id, J.designation from EMPLOYEE E
Inner Join Job J
on E.JOB_ID=J.JOB_ID
where DESIGNATION= 'Clerk'

--4. Display the list of employees who are living in 'Boston'. 

select E.employee_id, E.first_name, E.Middle_name, E.last_name, E.job_id, E.manager_id, E.hire_date, E.salary, E.comm, 
E.DEPARTMENT_id, L.city from EMPLOYEE E
Inner Join [DEPARTMENT] D
on E.DEPARTMENT_id= D.DEPARTMENT_id
Inner Join Location L
on D.Location_id= L.Location_ID
where city= 'Boston'

--5. Find out the number of employees working in the sales department. 

select count(employee_id) as 'no of Employee', E.first_name from EMPLOYEE E
Inner join DEPARTMENT D
on E.DEPARTMENT_ID= D.Department_Id
where D.name= 'sales'
Group by E.first_name;

--6. Update the salaries of employees who are working as clerks on the basis of 10%.

update EMPLOYEE
set salary=  salary *1.10
where Job_id= (select job_id from Job
				where DESIGNATION= 'clerk')

--7. Display the second highest salary drawing employee details. 

select * from EMPLOYEE
where salary= (select max(salary) from EMPLOYEE
				where salary < (select max(salary) from EMPLOYEE))

--8. List out the employees who earn more than every employee in department 30. 

select * from EMPLOYEE
where salary= (select max(salary) from EMPLOYEE
				where department_id =30)

--9. Find out which department has no employees. 

SELECT * 
FROM DEPARTMENT
WHERE Department_ID NOT IN (
							SELECT DISTINCT Department_ID 
							FROM EMPLOYEE
						)

--10. Find out the employees who earn greater than the average salary for their department.

select * from EMPLOYEE
where salary > (select Avg(salary) from EMPLOYEE
				Where department_id= department_id)