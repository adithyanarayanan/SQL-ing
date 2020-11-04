-- A simple loop that creates a small table with numbers 1-10
with temp_loop as 
(
select 1 as id

union ALL

select id+1
from temp_loop
where id <10
)
select * from temp_loop