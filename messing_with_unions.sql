

select student, Math_Marks as subject, Math as Marks  from Temp
UNION 
select student, History_Marks as subject, History as Marks  from temp
UNION  
select student, Science_Marks as subject ,Science as Marks from temp
