-- Null exclusion of elements 

select item1.item_id as item_id FROM
item1
left join

(select A.item_id
from item1 A
inner join 
item2 B
on A.item_id = B.item_id) as misses

on item1.item_id = misses.item_id
where misses.item_id IS NULL



