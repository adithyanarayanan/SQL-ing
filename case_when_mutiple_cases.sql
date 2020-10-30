-- Example using multiple case whens and multiple flags

select 
sum(CASE WHEN ethnicities in ('Asian', 'Indian') then 1 else 0  end)  as flag_cont,
sum(CASE WHEN ethnicities in ('Caucasian') then 1 else 0 end) as cauc,
sum(CASE WHEN ethnicities in ('African American') then 1 else 0 end) as afr
from ethnic