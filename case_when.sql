-- Example Using Case when

select SSN, Name,
CASE WHEN ethnicities in ('Asian', 'Indian') 
	then 1 
	else 0 
	end as flag 
from ethnic

	