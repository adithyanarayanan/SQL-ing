-- Transposing Table using case when


select student,
max(CASE WHEN subject in ('Math') then marks else NULL  end)  as Math,
max(CASE WHEN subject in ('History') then marks else NULL  end)  as History,
max(CASE WHEN subject in ('Science') then marks else NULL  end)  as Science
	
from student
group by student