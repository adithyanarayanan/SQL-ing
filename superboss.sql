-- loop that delivers the super boss- the top most manager in a tree of managers for a given employee

select manager_name FROM
(
with loop as (
select employee_name, manager_name, 1 as level from employee
where employee_name = "nikita"

union ALL

select A.employee_name, B.manager_name, A.level+1 as level
from loop A
inner JOIN
(select employee_name, manager_name from employee) B
on A.manager_name = B.employee_name
)

select manager_name, row_number() over (order by level DESC) as top from loop
-- where top = 1
) X
where top = 1


