 Select 
		MatAluno,
	(Select MediaProva from corpore.dbo.UDataAval as UDAV where UDAV.NumProva = 1 and UDAV.CodPerLet = RMUMA.PerLetivo and UDAV.CodTur = RMUMA.CodTur and UDAV.Codmat = RMUMA.CodMat and UDAV.CodEtapa = RMETAPAS.CodEtapa ) *
	(Select (Round(AVG(Round((4/(cast(as_score as decimal(5,2)))) * (cast(gr_score as decimal(5,2))),2)),1)) 
	from vw_gradebook where as_numprova = 1 and as_subject = RMUMA.CodMat and as_grade = RMUMA.CodTur 
	and as_schoolyear = RMUMA.PerLetivo and as_quarter = RMETAPAS.CodEtapa and gr_matricula = RMUMA.MatAluno 
	Group by gr_matricula, Descricao, as_grade, as_subject, as_grade, as_quarter, as_numprova, as_schoolyear) + 

	(Select MediaProva from corpore.dbo.UDataAval as UDAV where UDAV.NumProva = 2 and UDAV.CodPerLet = RMUMA.PerLetivo and UDAV.CodTur = RMUMA.CodTur and UDAV.Codmat = RMUMA.CodMat and UDAV.CodEtapa = RMETAPAS.CodEtapa ) *
	(Select (Round(AVG(Round((4/(cast(as_score as decimal(5,2)))) * (cast(gr_score as decimal(5,2))),2)),1)) 
	from vw_gradebook where as_numprova = 2 and as_subject = RMUMA.CodMat and as_grade = RMUMA.CodTur 
	and as_schoolyear = RMUMA.PerLetivo and as_quarter = RMETAPAS.CodEtapa and gr_matricula = RMUMA.MatAluno 
	Group by gr_matricula, Descricao, as_grade, as_subject, as_grade, as_quarter, as_numprova, as_schoolyear) +

	(Select MediaProva from corpore.dbo.UDataAval as UDAV where UDAV.NumProva = 3 and UDAV.CodPerLet = RMUMA.PerLetivo and UDAV.CodTur = RMUMA.CodTur and UDAV.Codmat = RMUMA.CodMat and UDAV.CodEtapa = RMETAPAS.CodEtapa ) *
	(Select (Round(AVG(Round((4/(cast(as_score as decimal(5,2)))) * (cast(gr_score as decimal(5,2))),2)),1)) 
	from vw_gradebook where as_numprova = 3 and as_subject = RMUMA.CodMat and as_grade = RMUMA.CodTur 
	and as_schoolyear = RMUMA.PerLetivo and as_quarter = RMETAPAS.CodEtapa and gr_matricula = RMUMA.MatAluno 
	Group by gr_matricula, Descricao, as_grade, as_subject, as_grade, as_quarter, as_numprova, as_schoolyear) as P3
from corpore.dbo.UMatalun as RMUMA 
join corpore.dbo.UEtapas as RMETAPAS (NoLock) on (RMETAPAS.CODPERLET = RMUMA.PerLetivo) 
where RMETAPAS.CodEtapa = '06' 
and RMUMA.CodMat = '204PCO' 
and RMUMA.CodTur = '4B' 
and RMUMA.PerLetivo = '09/10'
and RMUMA.mataluno like '%' 
AND RMUMA.Status in ('01', '07')
