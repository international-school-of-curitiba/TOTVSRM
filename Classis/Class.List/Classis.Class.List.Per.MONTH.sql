Select  A_NomeReduzido, CodCur, CodPer, PERIODO from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = '09/10' and A_DataEntradaISC <= MarchEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = '09/10' and A_DataEntradaISC <= MarchEnd and A_DataSaidaISC > MarchBegin)
OR 	(UMatricPL.PerLetivo = '09/10' and A_ReturnedToISC <= MarchEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = '09/10' and A_ReturnedToISC <= MarchEnd and A_LeftISC_2 > MarchBegin)) 
order by CodCur, CodPer, Periodo

Select A_NomeReduzido, CodCur, CodPer, PERIODO, A_DataEntradaISC, A_DataSaidaISC, AprilEnd, AprilBegin from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = '09/10' and A_DataEntradaISC <= AprilEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = '09/10' and A_DataEntradaISC <= AprilEnd and A_DataSaidaISC > AprilBegin)
OR 	(UMatricPL.PerLetivo = '09/10' and A_ReturnedToISC <= AprilEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = '09/10' and A_ReturnedToISC <= AprilEnd and A_LeftISC_2 > AprilBegin)) 
order by CodCur, CodPer, Periodo
