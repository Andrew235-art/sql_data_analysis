use sql_hr;

show tables;

select * from employees;


select concat(employees.first_name, ' ',
 employees.last_name) as Employee_Name, job_title, salary
 from employees;


select distinct(count(employee_id)) as Total_count_of_employees
from employees;


select * from offices;


select distinct(count(office_id)) as total_count_of_offices
from offices;


select distinct(state) as Office_locations_by_State
from offices;


select distinct(city) as Office_locations_by_City
from offices;



Select employees.employee_id, concat(employees.first_name, ' ',
 employees.last_name) as employee_name, employees.job_title, employees.salary,
 offices.state, offices.city, offices.address
from employees
join offices
on employees.office_id = offices.office_id
-- where employee_id is not null
order by salary Desc;




with cte_employee_data 
as (
Select employees.employee_id, concat(employees.first_name, ' ',
 employees.last_name) as employee_name, employees.job_title, employees.salary,
 offices.state, offices.city, offices.address
from employees
join offices
on employees.office_id = offices.office_id
-- where employee_id is not null
order by salary Desc
)

select employee_name, job_title, salary, address, city from cte_employee_data
where state = 'NY'
order by salary desc;




with cte_employee_data 
as (
Select employees.employee_id, concat(employees.first_name, ' ',
 employees.last_name) as employee_name, employees.job_title, employees.salary,
 offices.state, offices.city, offices.address
from employees
join offices
on employees.office_id = offices.office_id
-- where employee_id is not null
order by salary Desc
)

select max(salary) as Highest_salary,
 min(salary) as Lowest_salary,
 round(avg(salary),2) as Mean_salary,
 sum(salary) as Grand_total_salary from cte_employee_data;




with cte_employee_data 
as (
Select employees.employee_id, concat(employees.first_name, ' ',
 employees.last_name) as employee_name, employees.job_title, employees.salary,
 offices.state, offices.city, offices.address
from employees
join offices
on employees.office_id = offices.office_id
-- where employee_id is not null
order by salary Desc
)

select city,
 count(city) as number_of_employees
from cte_employee_data
group by city;

