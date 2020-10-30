-- Using case when with multiple when

select SSN, Name, ethnicities,
CASE WHEN SSN > 2.5
	then 1 
	WHEN ((ethnicities in ('Asian', 'Indian')) and (SSN < 2.5))
	then 2
	else 3
	end as flag 
from ethnic