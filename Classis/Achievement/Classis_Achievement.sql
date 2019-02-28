select top 3 * from isc.dbo.achiev_data
Select * from isc.dbo.Measure
Select Top 3 * from isc.dbo.Subject order by su_id
Select Top 3 * from isc.dbo.score
Select * from isc.dbo.criteria

Select 
	ad_id,
	cr_name,
	me_Name,
	me_description,
	su_description,
	sc_description,
	ad_value,
	ad_schoolyear
from isc.dbo.achiev_data
inner join isc.dbo.Subject (NoLock) on (SU_ID = AD_SUBJECT)
inner join isc.dbo.score (NoLock) on (SC_ID = AD_SCORE)
inner join isc.dbo.measure (NoLock) on (SU_Measure = ME_ID)
inner join isc.dbo.criteria (NoLock) on (CR_ID = ME_Criteria) 
Order by ME_ID, SU_ID
