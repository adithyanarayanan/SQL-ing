-- Formative store querying logic

select tails.store_no as store_no, tails.sales as sales, tails.customer_id as customer_id from 

(select M.store_no, M.sales, N.customer_id from
(select store_no, max(sales) as sales from

(select A.store_no, B.customer_id, sum(A.sales) as sales from transaction_info A
inner join 
customer_info B
where (A.visit_nbr = B.visit_nbr) and (A.visit_date = B.visit_date) and (A.store_no = B.store_no)
group by A.store_no, B.customer_id) X


group by store_no) as M

inner JOIN

(select A.store_no, B.customer_id, sum(A.sales) as sales from transaction_info A
inner join 
customer_info B
where (A.visit_nbr = B.visit_nbr) and (A.visit_date = B.visit_date) and (A.store_no = B.store_no)
group by A.store_no, B.customer_id)  as N

on (M.sales = N.sales) and (M.store_no = N.store_no)) maxes

inner JOIN

(select A.store_no as store_no, B.customer_id as customer_id, sum(A.sales) as sales from transaction_info A
 join 
customer_info B
where (A.visit_nbr = B.visit_nbr) and (A.visit_date = B.visit_date) and (A.store_no = B.store_no)
group by A.store_no, B.customer_id) tails

where (maxes.sales < tails.sales)




