Select UMaterias.CodMat,
	(Select materia from  UMaterias where  UMaterias.CodMat = PR.pr_subject) as Subject,
	Cast((select Apelido from PPessoa where codigo = Eprofes.codpessoa) as Varchar) as Teacher, 
	PR.pr_AcadProgress,
	PR.pr_Comment,
	Case when PR.pr_Meeting = 'N' then '' 
	Else 'V' end as Meeting, PR.pr_id
from 
	isc.dbo.progress_report PR
left join isc.dbo.login login (NoLock) on (login.lo_id = PR.pr_loginadd)
left join UProfMatTurma (NoLock) on (UProfMatTurma.CodPerLet = PR.pr_schoolyear and UProfMatTurma.CodMat = PR.pr_subject and UProfMatTurma.CodTur = PR.pr_grade and TipoProf = 'T')
left join EProfes (NoLock) on (Eprofes.CodProf = UProfMatTurma.CodProf)
left join UMaterias (Nolock) on (UMaterias.CodMat = PR.pr_subject)
where PR.pr_Schoolyear ='07/08'
and PR.pr_Matricula =00508
and PR.pr_quarter =2
Order by Umaterias.PosHist