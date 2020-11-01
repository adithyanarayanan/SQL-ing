-- Number of days a store is open
select store_no, customer_id, 365-max(temp) as days
FROM

(select store_no, customer_id, visit_date, rank() over(PARTITION by store_no, customer_id order by visit_date) as temp
from store_cust_date)

group by store_no, customer_id


