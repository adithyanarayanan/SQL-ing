-- Mapping every unique store to its oldest id
select old_id as Original, new_id as Final from 
(
select old_id, new_id, dense_rank() over (partition by new_id order by old_id asc) as keeps from
(with loop as (
select old_id, new_id from oldstore

union ALL

select A.old_id, B.new_id
from 

((select old_id, new_id from oldstore) as A
inner JOIN
loop as B
on A.new_id = B.old_id))
select old_id, new_id, dense_rank() over(partition  by old_id order by new_id desc) as final from loop)
where final = 1
order by old_id
)
where keeps = 1

