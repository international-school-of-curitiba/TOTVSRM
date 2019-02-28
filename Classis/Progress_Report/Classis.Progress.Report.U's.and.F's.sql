Select 
	pr_grade,
	(Select A_NomeReduzido from EAcompl where EAcompl.Matricula = pr_matricula) as nome,
	(Select Materia from UMaterias where CodMat = pr_subject) as Subject, 
	pr_acadAchievement,
	pr_conduct,
	pr_effort,
	pr_comment
from isc.dbo.progress_report
where pr_schoolyear = '08/09'
and pr_quarter =7
and pr_acadachievement in ('U','F')
order by substring(pr_subject,1,1), substring(pr_subject,3,1), pr_grade