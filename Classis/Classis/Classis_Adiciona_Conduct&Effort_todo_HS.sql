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
Where	UMatAlun.CodMat = '300top'

