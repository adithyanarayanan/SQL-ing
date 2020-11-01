-- Cumulative sum

select store_no, week, sales, sum(sales) over(PARTITION by store_no order by week) as sales_part
from store_week_sales