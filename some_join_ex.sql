-- select * from store_state
-- create table store_with_sales as 
-- select distinct store_no from sales_data
select * 
from store_state A
inner join 
store_with_sales B
on A.store_id = B.store_no