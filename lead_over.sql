-- Easy lead over

select store_no, customer_id, visit_date, lead(visit_date, 1) over(PARTITION by customer_id order by visit_date) as temp
from store_cust_date