select distinct
	(Select top 1 Apelido      from PPessoa, Eprofes, UprofMatturma where PPessoa.Codigo = Eprofes.Codpessoa and Eprofes.codprof = Uprofmatturma.codprof and Uprofmatturma.Codmat = UmatAlun.codmat and  Apelido is not null and UprofMatturma.codperlet = UmatAlun.perletivo and UprofMatturma.Tipoprof = 'T' and UprofmatTurma.codtur = UMatAlun.codtur) as Teacher,
	(Select top 1 PPessoa.Nome from PPessoa, Eprofes, UprofMatturma where PPessoa.Codigo = Eprofes.Codpessoa and Eprofes.codprof = Uprofmatturma.codprof and Uprofmatturma.Codmat = UmatAlun.codmat and  Apelido is not null and UprofMatturma.codperlet = UmatAlun.perletivo and UprofMatturma.Tipoprof = 'T' and UprofmatTurma.codtur = UMatAlun.codtur) as Teacher,
 	(Select top 1 email        from PPessoa, Eprofes, UprofMatturma where PPessoa.Codigo = Eprofes.Codpessoa and Eprofes.codprof = Uprofmatturma.codprof and Uprofmatturma.Codmat = UmatAlun.codmat and  Apelido is not null and UprofMatturma.codperlet = UmatAlun.perletivo and UprofMatturma.Tipoprof = 'T' and UprofmatTurma.codtur = UMatAlun.codtur) as email,
    -- UMatAlun.CodMat, 
	UMatAlun.CodTur ,
	A_NomeReduzido,
	UMaterias.Materia,  a1, a2, a6, a7,  
    UMatAlun.CodCur, UMatAlun.CodPer, 
    UMatAlun.CodTur, UMatricpl.Periodo,
    UMatAlun.MatALuno
from UMatAlun
left join EACompl (NoLock) on ( Eacompl.Matricula = UMatAlun.MatAluno)
left join UMaterias (Nolock) on (UMatAlun.CodMat = UMaterias.Codmat)
left join UMatricpl (NoLock) on (UMatricpl.MATALUNO =  Eacompl.Matricula and UMatricpl.Perletivo = UMatAlun.Perletivo and UMatricpl.Codcur = UMatAlun.CodCur and UMatricpl.CodPer = UMatAlun.CodPer)
where UMatAlun.Perletivo = '08/09'
and UMatAlun.codmat in (Select codmat from UMaterias where Segundonome ='US')
and (UMatAlun.a1 = 1 or UMatAlun.a2 = 1 or UMatAlun.a6 = 1 or UMatAlun.a7 = 1)
and (UMatAlun.CodCur ='2' and UMatAlun.CodPer = '2' or UMatAlun.CodCur ='3' and UMatAlun.CodPer = '1')
and UMatAlun.status in ('01', '07')
Order By UMatAlun.CodCur, UMatAlun.CodPer, Periodo, UMatAlun.CodTur, A_NomeReduzido, Teacher,Materia --teacher--, A_NomeReduzido
