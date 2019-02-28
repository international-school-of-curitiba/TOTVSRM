
Select * from isc.dbo.score 
where sc_measure = '2'

Select * from isc.dbo.measure where me_criteria
achiev_data

Select *,
	su_Description,
	(Select ad_Value from isc.dbo.achiev_data where ad_subject = su_id and ad_score = '1') as 'A', 
	(Select ad_Value from isc.dbo.achiev_data where ad_subject = su_id and ad_score = '2') as 'B', 
	(Select ad_Value from isc.dbo.achiev_data where ad_subject = su_id and ad_score = '3') as 'C', 
	(Select ad_Value from isc.dbo.achiev_data where ad_subject = su_id and ad_score = '4') as 'D', 
	(Select ad_Value from isc.dbo.achiev_data where ad_subject = su_id and ad_score = '5') as 'N', 
	(Select ad_Value from isc.dbo.achiev_data where ad_subject = su_id and ad_score = '6') as 'Total#'	
from isc.dbo.subject
where su_measure = '1'
order by su_id