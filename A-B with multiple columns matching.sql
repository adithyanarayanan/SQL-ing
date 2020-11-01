-- cretaing a table with cust id to days, then removing values that occur in oroginal table

select customer_id, days from
(select X.customer_id as customer_id, X.days as days, Y.visit_date as visit_date FROM

(select A.customer_id as customer_id, B.days as days
from
(select customer_id from store_cust_date
group by customer_id) A
inner JOIN
(select days from days) B) X

left  JOIN

(select customer_id, visit_date from 
store_cust_date) Y

on (X.customer_id = Y.customer_id) and (X.days = Y.visit_date) )

where visit_date is NULL

