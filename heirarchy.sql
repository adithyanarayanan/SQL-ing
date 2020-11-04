-- Heirarchy idenfitication using a join inside a loop
with loop as (
select child, father, 1 as gen from 
father_child
where child=10

union ALL

select A.child as child, B.father as father, A.gen+1 as gen
 from loop A
inner join
(select father, child from father_child) B
on A.father = B.child
)
select * from loop
where gen < 5



