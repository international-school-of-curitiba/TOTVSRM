Select 
	A_NOMEING, 
	Substring(SUBSTRING(rtrim(EACompl.A_NomeING), 0, (LEN(rtrim(EACompl.A_NomeING))- (PATINDEX('%,%', REVERSE(rtrim(rtrim(EACompl.A_NomeING))))-1))), 0 ,(PATINDEX('%,%', rtrim(EACompl.A_NomeING)))) AS 'Student Last Name',
	Substring(rtrim(EACompl.A_NomeING), LEN(rtrim(EACompl.A_NomeING)) - (PATINDEX('%,%', REVERSE(rtrim(EACompl.A_NomeING)))) + 3, LEN(rtrim(EACompl.A_NomeING))) as 'Student First Name'
	,(Select top 1 UMATALUN.CODTUR from UMatAlun where UMatAlun.MatAluno = UMATRICPL.MatAluno and UMatAlun.Perletivo = UMATRICPL.PERLETIVO and UMatAlun.Status not in ('09','08','18','19') Group by UMatAlun.CodTur Order by count(UMatAlun.CodTur) desc) as Grade_Level
    ,codcur, codper, periodo
from Eacompl
Inner Join UMATRICPL (NoLock) on (EACOMPL.MATRICULA = UMATRICPL.MATALUNO )
Where 
	UMATRICPL.PERLETIVO = '10/11'
and UMATRICPL.STATUS in ('01','07')
and UMATRICPL.CODCUR in (2,3) and PERIODO >= 6
Order by codcur, codper, periodo, A_NOMEING