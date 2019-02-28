select 
	(Select top 1 Apelido      from PPessoa, Eprofes, UprofMatturma where PPessoa.Codigo = Eprofes.Codpessoa and Eprofes.codprof = Uprofmatturma.codprof and Uprofmatturma.Codmat = UmatAlun.codmat and  Apelido is not null and UprofMatturma.codperlet = UmatAlun.perletivo and UprofMatturma.Tipoprof = 'T' and UprofmatTurma.codtur = UMatAlun.codtur) as Teacher,
	CodTur,
	(Select Materia from Umaterias where UMaterias.CodMat = UMatAlun.CodMat), 
	Count(UMatAlun.MatAluno) as Total
from UMatAlun
left join UMaterias (Nolock) on (UMatAlun.CodMat = UMaterias.Codmat)
where UMatAlun.Perletivo = '09/10'
and UMatAlun.codmat in (Select codmat from UMaterias where SegundoNome ='US')
and UMatAlun.a6 is null -- 1st quarter
and UMatAlun.CodCur> ='2' -- '2' and CodPer = '1'
--and (Select top 1 Apelido from PPessoa, Eprofes, UprofMatturma where PPessoa.Codigo = Eprofes.Codpessoa and Eprofes.codprof = Uprofmatturma.codprof and Uprofmatturma.Codmat = UmatAlun.codmat and  Apelido is not null and UprofMatturma.codperlet = UmatAlun.perletivo and UprofMatturma.Tipoprof = 'T' and UprofmatTurma.codtur = UMatAlun.codtur) = @APelido
and UMatAlun.status in ('01', '07')
and umatalun.matAluno <> 833
and UMatAlun.codmat not in ('206REA', '207REA', '208REA', '206LSL','207LSL','208LSL','206WRI', '207WRI', '208WRI' )
Group by PerLetivo, UMatAlun.CodMat, CodTur
Order By Teacher

