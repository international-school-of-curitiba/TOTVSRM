select distinct umatalun.STATUS,
	(Select top 1 Apelido      from PPessoa, Eprofes, UprofMatturma where PPessoa.Codigo = Eprofes.Codpessoa and Eprofes.codprof = Uprofmatturma.codprof and Uprofmatturma.Codmat = UmatAlun.codmat and  Apelido is not null and UprofMatturma.codperlet = UmatAlun.perletivo and UprofMatturma.Tipoprof = 'T' and UprofmatTurma.codtur = UMatAlun.codtur) as Teacher1,
	(Select top 1 PPessoa.Nome from PPessoa, Eprofes, UprofMatturma where PPessoa.Codigo = Eprofes.Codpessoa and Eprofes.codprof = Uprofmatturma.codprof and Uprofmatturma.Codmat = UmatAlun.codmat and  Apelido is not null and UprofMatturma.codperlet = UmatAlun.perletivo and UprofMatturma.Tipoprof = 'T' and UprofmatTurma.codtur = UMatAlun.codtur) as Teacher,
 	(Select top 1 email        from PPessoa, Eprofes, UprofMatturma where PPessoa.Codigo = Eprofes.Codpessoa and Eprofes.codprof = Uprofmatturma.codprof and Uprofmatturma.Codmat = UmatAlun.codmat and  Apelido is not null and UprofMatturma.codperlet = UmatAlun.perletivo and UprofMatturma.Tipoprof = 'T' and UprofmatTurma.codtur = UMatAlun.codtur) as email,
    UMatAlun.CodMat, 
	Matricula,
	rtrim(A_NomeReduzido),
	UMatAlun.CodTur ,
	UMaterias.Materia,     
    UMatAlun.CodCur, UMatAlun.CodPer, 
    UMatAlun.CodTur
  , MatALuno
from UMatAlun
left join EACompl (NoLock) on ( Eacompl.Matricula = UMatAlun.MatAluno)
left join UMaterias (Nolock) on (UMatAlun.CodMat = UMaterias.Codmat)
where UMatAlun.Perletivo = '11/12'
and UMatAlun.codmat in (Select codmat from UMaterias where SegundoNome ='US')
and UMatAlun.a2 is null -- 1st quarter
and UMatAlun.CodCur ='2' and CodPer = '1'
and UMatAlun.status in ('01', '07')
and umatalun.matAluno not in ('01116', '01125')
--and UMatAlun.codmat not in ('206REA', '207REA', '208REA', '206LSL','207LSL','208LSL','206WRI', '207WRI', '208WRI' )
Order By Teacher,Materia --teacher--, A_NomeReduzido


