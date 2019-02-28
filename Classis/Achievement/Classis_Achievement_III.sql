
Select
	su_Description,
	(Select ad_Value from isc.dbo.achiev_data where ad_subject = su_id and ad_score = '74') as '10--8.0', 
	(Select ad_Value from isc.dbo.achiev_data where ad_subject = su_id and ad_score = '75') as '7.9--6.0', 
	(Select ad_Value from isc.dbo.achiev_data where ad_subject = su_id and ad_score = '76') as '0--5.9', 
	(Select ad_Value from isc.dbo.achiev_data where ad_subject = su_id and ad_score = '77') as 'Total #'
from isc.dbo.subject
where su_measure = '2'
order by su_id

Select * from isc.dbo.achiev_data 
inner join isc.dbo.Subject (NoLock) on (SU_ID = AD_SUBJECT)
inner join isc.dbo.score (NoLock) on (SC_ID = AD_SCORE)
inner join isc.dbo.measure (NoLock) on (SU_Measure = ME_ID)
where su_measure = '2'

