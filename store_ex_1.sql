
select store_no, sales, days 
from
	(select store_no, sum(sales) as sales, count(open) as days 
	from 
		(select store_no, date as open, sum(order_amt) as sales 
		from sales_data
		group by 1, 2) Y
	group by store_no) Z
where days > 2 and sales > 500
group by store_no;