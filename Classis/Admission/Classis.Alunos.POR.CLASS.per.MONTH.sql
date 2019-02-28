	
Select distinct EACompl.Matricula, A_NOMEREDUZIDO,  SeptemberEnd , UMatricpl.CodCur from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
	Inner Join UMatAlun (NoLock) on (UMatAlun.Perletivo = '09/10' and UMatAlun.MATALUNO = EACOMPL.MATRICULA 
	and UMATALUN.CODTUR = '2B') 
Where 
((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= SeptemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= SeptemberEnd and A_DataSaidaISC > SeptemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= SeptemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= SeptemberEnd and A_LeftISC_2 > SeptemberBegin))
and UMatricpl.CodCur = 2 and Umatricpl.CodPer = 1 and Umatricpl.Periodo  = 2
and UMATRICPL.PERLETIVO = '09/10'
and UMatricpl.Status in (Select CodSitMat from USitMat where AluPerLetivo = 'S')
order by A_NOMEREDUZIDO