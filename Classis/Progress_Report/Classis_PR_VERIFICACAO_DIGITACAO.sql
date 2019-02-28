Select 
	(Select top 1 Apelido from PPessoa, Eprofes, UprofMatturma where PPessoa.Codigo = Eprofes.Codpessoa and Eprofes.codprof = Uprofmatturma.codprof and Uprofmatturma.Codmat = UmatAlun.codmat and  Apelido is not null and UprofMatturma.codperlet = UmatAlun.perletivo and UprofMatturma.Tipoprof = 'T' and UprofmatTurma.codtur = UMatAlun.codtur) as Teacher,
	UMatAlun.Mataluno, A_NomeReduzido, UMatAlun.CodMat, UMaterias.Materia, PR.pr_AcadAchievement, PR.pr_Conduct, PR.pr_Effort
From 
	UMatAlun
	 Left Join isc.dbo.progress_report PR (NoLock) on 
	(PR.pr_Matricula = UMatAlun.Mataluno and PR.pr_Subject = UMatAlun.CodMat
	and PR.pr_SchoolYear = UMatAlun.Perletivo and PR.pr_Quarter = '7')
	left join EACompl (NoLock) on ( Eacompl.Matricula = UMatAlun.MatAluno)
	left join UMaterias (Nolock) on (UMatAlun.CodMat = UMaterias.Codmat)
Where
	 UMatAlun.Perletivo = '08/09'
and 	 UMatAlun.codmat in (Select codmat from UMaterias where Segundonome ='US')
and 	 (UMatAlun.CodCur  = '2' and UMatalun.CodPer = '2' or UMatAlun.CodCur  = '3')
and 	 UMatAlun.status in ('01', '07')
and 	 UMatAlun.CodMat not like ('%ADV')
and 	 UMatAlun.CodMat not like ('%TEC')
and 	 PR.pr_AcadAchievement is null
Order By Teacher, UMatAlun.CodMat,  A_NomeReduzido



Select distinct
	(Select top 1 Apelido from PPessoa, Eprofes, UprofMatturma where PPessoa.Codigo = Eprofes.Codpessoa and Eprofes.codprof = Uprofmatturma.codprof and Uprofmatturma.Codmat = UmatAlun.codmat and  Apelido is not null and UprofMatturma.codperlet = UmatAlun.perletivo and UprofMatturma.Tipoprof = 'T' and UprofmatTurma.codtur = UMatAlun.codtur) as Teacher
--	,UMatAlun.Mataluno, A_NomeReduzido 
	,UMatAlun.CodMat 
	,UMaterias.Materia--, ZProgressReport.ACADACHIEV, Conduct, Effort
from
	 UMatAlun
	 Left Join isc.dbo.progress_report PR (NoLock) on 
	(PR.pr_Matricula = UMatAlun.Mataluno and PR.pr_Subject = UMatAlun.CodMat
	and PR.pr_SchoolYear = UMatAlun.Perletivo and PR.pr_Quarter = '7')
	left join EACompl (NoLock) on ( Eacompl.Matricula = UMatAlun.MatAluno)
	left join UMaterias (Nolock) on (UMatAlun.CodMat = UMaterias.Codmat)
Where
	 UMatAlun.Perletivo = '08/09'
and 	 UMatAlun.codmat in (Select codmat from UMaterias where Segundonome ='US')
and 	 (UMatAlun.CodCur  = '2' and UMatalun.CodPer = '2' or UMatAlun.CodCur  = '3')
and 	 UMatAlun.status in ('01', '07')
and 	 UMatAlun.CodMat not like ('%ADV')
and 	 UMatAlun.CodMat not like ('%TEC')
and 	 PR.pr_AcadAchievement is null
Order By Teacher--, UMatAlun.CodMat,  A_NomeReduzido
