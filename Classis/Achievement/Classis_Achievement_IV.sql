Select
	su_Description,
	(Select ad_Value from isc.dbo.achiev_data where ad_subject = su_id and ad_score = '68') as 'Q1',
	(Select ad_Value from isc.dbo.achiev_data where ad_subject = su_id and ad_score = '69') as 'Q2',
	(Select ad_Value from isc.dbo.achiev_data where ad_subject = su_id and ad_score = '70') as 'Q3',
	(Select ad_Value from isc.dbo.achiev_data where ad_subject = su_id and ad_score = '71') as 'Q4',
	(Select ad_Value from isc.dbo.achiev_data where ad_subject = su_id and ad_score = '72') as 'Q5',
	(Select ad_Value from isc.dbo.achiev_data where ad_subject = su_id and ad_score = '73') as 'Q6'
from isc.dbo.subject
where su_measure = '15'
order by su_id


Select * from  isc.dbo.subject where su_measure = 15


-- update isc.dbo.subject set su_description = 'IB Certificates' where su_measure = 12


Select * from isc.dbo.Score where sc_measure = 15 order by sc_id
Select * from isc.dbo.Measure order by me_id
