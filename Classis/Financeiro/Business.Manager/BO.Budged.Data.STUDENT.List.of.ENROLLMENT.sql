Select distinct Nome from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = '08/09' and A_DataEntradaISC <= DecemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = '08/09' and A_DataEntradaISC <= DecemberEnd and A_DataSaidaISC > DecemberBegin)
OR 	(UMatricPL.PerLetivo = '08/09' and A_ReturnedToISC <= DecemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = '08/09' and A_ReturnedToISC <= DecemberEnd and A_LeftISC_2 > DecemberBegin)) 
and (Select Top 1 codbol from EaluBolsa where Perletivo = '08/09' and EaluBolsa.MatAluno = EAlunos.Matricula) = 100
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Staff%'
and EAlunos.matricula not in(
Select distinct EAlunos.Matricula from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = '08/09' and A_DataEntradaISC <= JanuaryEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = '08/09' and A_DataEntradaISC <= JanuaryEnd and A_DataSaidaISC > JanuaryBegin)
OR 	(UMatricPL.PerLetivo = '08/09' and A_ReturnedToISC <= JanuaryEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = '08/09' and A_ReturnedToISC <= JanuaryEnd and A_LeftISC_2 > JanuaryBegin))
and (Select Top 1 codbol from EaluBolsa where Perletivo = '08/09' and EaluBolsa.MatAluno = EAlunos.Matricula) = 100
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Staff%')