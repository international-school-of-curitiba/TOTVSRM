--
Insert into UDataAval 
	(Codcoligada, 
	Codfilial,
	Codperlet, 
	CodMat, 
	CodTur, 
	NumProva, 
	PontNum, 
	Notafalta, 
	CodEtapa, 
	MediaProva,
	Descricao) 
Select distinct
	UMatAlun.CodColigada,
	UMatAlun.CodFilial,
	UMatAlun.PerLetivo,
	UMatAlun.CodMat,
	UMatAlun.CodTur,
	'2', --Numero da Prova
	'100', -- Pontos Numericos
	'A', --Nota Falta
	'7', --CodEtapa  /* TROCAR APENAS O CODETAPA 1=Q1/ 2=Q2/ 6=Q3 / 7=Q4 */
	'1', --MediaProva
	'Effort' --Descricao	
from 
	UMatAlun
	INNER JOIN UMATERIAS (NOLOCK) ON (UMATERIAS.CODMAT = UMATALUN.CODMAT)
Where	(UMatAlun.Perletivo = '06/07' and UMatAlun.CodCur = '2' and UMatAlun.CodPer = '2') or
(UMatAlun.Perletivo = '06/07' and UMatAlun.CodCur = '3' and UMatAlun.CodPer = '1')
and	UMatAlun.CodMat IN (SELECT CODMAT FROM UMATERIAS WHERE SEGUNDONOME = 'US')


-- 
-- select 'Participation' = 
-- case 
-- WHEN P1 >= 0 and P1 <= 59 then 'NI'
-- WHEN P1 >= 60 and P1 <= 99 then 'M'
-- WHEN P1 = 100 then 'E'
-- ELSE '-'
-- END 
--  from ealunotpr where codetp = '1' and mataluno = '00268' and codmat=:Espelho#3


