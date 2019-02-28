-- Select * from score where sc_measure = 11


-- insert into score values ('Total', '12')

Select * from measure

update measure
set me_name = 'IB Extended  Essay'
where me_id = 1


Select
	su_Description,
	(Select ad_Value from isc.dbo.achiev_data where ad_subject = su_id and ad_score = '99') as '%',
(Select ad_Value from isc.dbo.achiev_data where ad_subject = su_id and ad_score = '86') as 'Total'
from isc.dbo.subject
where su_measure = '18'
order by su_id
