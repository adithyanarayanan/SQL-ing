-- Ranking Queries

select store_no, customer_id, sales, dense_rank() over(PARTITION by store_no order by sales DESC) as cust_rank
from

	(select A.store_no as store_no, B.customer_id as customer_id, sum(A.sales) as sales from transaction_info A
	inner join 
	customer_info B
	where (A.visit_nbr = B.visit_nbr) and (A.visit_date = B.visit_date) and (A.store_no = B.store_no)
	group by A.store_no, B.customer_id) X
	

-- Can pust asc or leave empty for default