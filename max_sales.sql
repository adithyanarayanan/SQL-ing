-- Generate max sales for a store

select store_no, customer_id, max(sales) as sales from

(select A.store_no, B.customer_id, sum(A.sales) as sales from transaction_info A
inner join 
customer_info B
where (A.visit_nbr = B.visit_nbr) and (A.visit_date = B.visit_date) and (A.store_no = B.store_no)
group by A.store_no, B.customer_id) X


group by store_no