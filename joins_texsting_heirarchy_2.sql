-- displaying first gen heirarchy in office to understand joins

select A.employee_name, B.manager_name from

employee as A

inner join 

employee as B

on A.manager_name = B.employee_name