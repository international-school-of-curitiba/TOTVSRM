Select 
	(Select materia from  UMaterias where  UMaterias.CodMat = ZProgressReport.CodMat) as Subject,
	Cast((select Apelido from PPessoa where codigo = Eprofes.codpessoa) as Varchar) as Teacher, 
	ZProgressReport.AcadAchiev,
	ZProgressReport.Conduct,
	ZProgressReport.Effort,
	ZProgressReport.Comment,
	Case when ZProgressReport.Meeting = 'N' then '' 
	Else 'V' end as Meeting
from 
	ZProgressReport, EProfes
where ZProgressReport.CodProf = Eprofes.CodProf
and ZProgressReport.Perletivo = '07/08'
and ZProgressReport.Matricula = '00143'
and ZProgressReport.CodEtapa = 1
Order by Subject

Select
	(Select materia from  UMaterias where  UMaterias.CodMat = PR.pr_subject) as Subject,
	Cast((select Apelido from PPessoa where codigo = Eprofes.codpessoa) as Varchar) as Teacher, 
	PR.pr_AcadAchievement,
	PR.pr_Conduct,
	PR.pr_Effort,
	PR.pr_Comment,
	Case when PR.pr_Meeting = 'N' then '' 
	Else 'V' end as Meeting
from 
	isc.dbo.progress_report PR
left join isc.dbo.login login (NoLock) on (login.lo_id = PR.pr_loginadd)
left join UProfMatTurma (NoLock) on (CodPerLet = PR.pr_schoolyear and CodMat = PR.pr_subject and CodTur = PR.pr_grade and TipoProf = 'T')
left join EProfes (NoLock) on (Eprofes.CodProf = UProfMatTurma.CodProf)
where PR.pr_Schoolyear ='07/08'
and PR.pr_Matricula = '00143'
and PR.pr_quarter = '1'
Order by Subject
