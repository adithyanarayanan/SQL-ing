-- Generate second largest buying customer for every store by exclusive logic

select store_no, max(Sales) from

(select full.store_no, full.customer_id, full.sales, second.max_sales from

(select A.store_no as store_no, B.customer_id as customer_id, sum(A.sales) as sales from transaction_info A
inner join 
customer_info B
where (A.visit_nbr = B.visit_nbr) and (A.visit_date = B.visit_date) and (A.store_no = B.store_no)
group by A.store_no, B.customer_id) as full

left join

(select store_no, max(sales) as max_sales from

(select A.store_no as store_no, B.customer_id as customer_id, sum(A.sales) as sales from transaction_info A
inner join 
customer_info B
where (A.visit_nbr = B.visit_nbr) and (A.visit_date = B.visit_date) and (A.store_no = B.store_no)
group by A.store_no, B.customer_id) as maxes


group by store_no) as second

on (full.store_no = second.store_no)

where sales != max_sales) as nonmaxed

group by store_no
 


