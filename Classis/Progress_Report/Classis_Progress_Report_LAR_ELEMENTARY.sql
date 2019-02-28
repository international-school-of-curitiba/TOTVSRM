

Select
	PR.pr_id, 
	PR.pr_acadprogress,
	cast(Round(
		(case 
			when PRE.pe_reading = 'NA' then 0
			else isnull(cast(PRE.pe_reading as int), 0) * 0.35
		end) +
		(case 
			when pre.pe_writing = 'NA' then 0
			else isnull(cast(pre.pe_writing as int), 0) * 0.35
		end) +
		(case 
			when pre.pe_oralcomunication = 'NA' then 0
			else isnull(cast(pre.pe_oralcomunication as int), 0) * 0.30
		end), 0) as int)
from dbo.progress_report PR
left join dbo.progress_report_extra PRE on (PRE.pe_progress_report = pr_id)
where pr_subject like ('20%LAR')

