-- Exampe parsing multiple masks in Case When

select SSN, Name, ethnicities,
CASE WHEN ((ethnicities in ('Asian', 'Indian')) and (SSN < 2.5)) or SSN > 2.5
	then 1 
	else 0 
	end as flag 
from ethnic

	