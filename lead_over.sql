-- Lead over hard way

select * from

(select store_no, customer_id, visit_date, rank() over(PARTITION by customer_id order by visit_date) as rank_1
from store_cust_date) A
inner join 
(select store_no, customer_id, visit_date, rank() over(PARTITION by customer_id order by visit_date) as rank_2
from store_cust_date) B
on (A.customer_id = B.customer_id) and (rank_2 - rank_1  = 1)