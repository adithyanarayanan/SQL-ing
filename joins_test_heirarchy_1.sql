-- testing joins on heirarchy tables
select * from

(select * from employee 
limit 2) as A

inner JOIN

(select * from employee limit 2) as B

on A.manager_name = B.employee_name
