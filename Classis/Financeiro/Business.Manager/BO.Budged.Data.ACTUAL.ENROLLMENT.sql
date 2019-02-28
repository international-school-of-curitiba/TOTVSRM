

Select Top 1
'1. Actual Total' as Enrollment,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AugustEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AugustEnd and A_DataSaidaISC > AugustBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AugustEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AugustEnd and A_LeftISC_2 > AugustBegin))
and UMatricpl.CodCur = 1 and Umatricpl.Periodo = 4) as August,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= SeptemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= SeptemberEnd and A_DataSaidaISC > SeptemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= SeptemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= SeptemberEnd and A_LeftISC_2 > SeptemberBegin))
and UMatricpl.CodCur = 1 and Umatricpl.Periodo = 4) as September,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= OctoberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= OctoberEnd and A_DataSaidaISC > OctoberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= OctoberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= OctoberEnd and A_LeftISC_2 > OctoberBegin))
and UMatricpl.CodCur = 1 and Umatricpl.Periodo = 4) as October,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= NovemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= NovemberEnd and A_DataSaidaISC > NovemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= NovemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= NovemberEnd and A_LeftISC_2 > NovemberBegin))
and UMatricpl.CodCur = 1 and Umatricpl.Periodo = 4) as November,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= DecemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= DecemberEnd and A_DataSaidaISC > DecemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= DecemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= DecemberEnd and A_LeftISC_2 > DecemberBegin))
and UMatricpl.CodCur = 1 and Umatricpl.Periodo = 4) as December,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JanuaryEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JanuaryEnd and A_DataSaidaISC > JanuaryBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JanuaryEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JanuaryEnd and A_LeftISC_2 > JanuaryBegin))
and UMatricpl.CodCur = 1 and Umatricpl.Periodo = 4) as January,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= FebruaryEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= FebruaryEnd and A_DataSaidaISC > FebruaryBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= FebruaryEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= FebruaryEnd and A_LeftISC_2 > FebruaryBegin))
and UMatricpl.CodCur = 1 and Umatricpl.Periodo = 4) as February,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MarchEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MarchEnd and A_DataSaidaISC > MarchBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MarchEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MarchEnd and A_LeftISC_2 > MarchBegin))
and UMatricpl.CodCur = 1 and Umatricpl.Periodo = 4) as March,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AprilEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AprilEnd and A_DataSaidaISC > AprilBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AprilEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AprilEnd and A_LeftISC_2 > AprilBegin))
and UMatricpl.CodCur = 1 and Umatricpl.Periodo = 4) as April,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MayEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MayEnd and A_DataSaidaISC > MayBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MayEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MayEnd and A_LeftISC_2 > MayBegin)) 
and UMatricpl.CodCur = 1 and Umatricpl.Periodo = 4) as May,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JuneEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JuneEnd and A_DataSaidaISC > JuneBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JuneEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JuneEnd and A_LeftISC_2 > JuneBegin)) 
and UMatricpl.CodCur = 1 and Umatricpl.Periodo = 4) as June,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JulyEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JulyEnd and A_DataSaidaISC > JulyBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JulyEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JulyEnd and A_LeftISC_2 > JulyBegin))
and UMatricpl.CodCur = 1 and Umatricpl.Periodo = 4) as July
From UmatAlun
Where UMatAlun.PerLetivo = '08/09'


/*
union 

Select Top 1
'2. Actual Corporat Paying' as Enrollment,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AugustEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AugustEnd and A_DataSaidaISC > AugustBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AugustEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AugustEnd and A_LeftISC_2 > AugustBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%') as August,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= SeptemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= SeptemberEnd and A_DataSaidaISC > SeptemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= SeptemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= SeptemberEnd and A_LeftISC_2 > SeptemberBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%') as September,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= OctoberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= OctoberEnd and A_DataSaidaISC > OctoberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= OctoberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= OctoberEnd and A_LeftISC_2 > OctoberBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%') as October,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= NovemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= NovemberEnd and A_DataSaidaISC > NovemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= NovemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= NovemberEnd and A_LeftISC_2 > NovemberBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%') as November,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= DecemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= DecemberEnd and A_DataSaidaISC > DecemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= DecemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= DecemberEnd and A_LeftISC_2 > DecemberBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%') as December,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JanuaryEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JanuaryEnd and A_DataSaidaISC > JanuaryBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JanuaryEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JanuaryEnd and A_LeftISC_2 > JanuaryBegin))
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%') as January,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= FebruaryEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= FebruaryEnd and A_DataSaidaISC > FebruaryBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= FebruaryEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= FebruaryEnd and A_LeftISC_2 > FebruaryBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%') as February,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MarchEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MarchEnd and A_DataSaidaISC > MarchBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MarchEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MarchEnd and A_LeftISC_2 > MarchBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%') as March,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AprilEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AprilEnd and A_DataSaidaISC > AprilBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AprilEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AprilEnd and A_LeftISC_2 > AprilBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%') as April,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MayEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MayEnd and A_DataSaidaISC > MayBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MayEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MayEnd and A_LeftISC_2 > MayBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%') as May,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JuneEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JuneEnd and A_DataSaidaISC > JuneBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JuneEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JuneEnd and A_LeftISC_2 > JuneBegin))
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%') as June,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JulyEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JulyEnd and A_DataSaidaISC > JulyBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JulyEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JulyEnd and A_LeftISC_2 > JulyBegin))
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%') as July
From UmatAlun
Where UMatAlun.PerLetivo = '08/09'

Union

Select Top 1
'3. Actual Temporary Paying' as Enrollment,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AugustEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AugustEnd and A_DataSaidaISC > AugustBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AugustEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AugustEnd and A_LeftISC_2 > AugustBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Tempora%') as August,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= SeptemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= SeptemberEnd and A_DataSaidaISC > SeptemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= SeptemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= SeptemberEnd and A_LeftISC_2 > SeptemberBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Tempora%') as September,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= OctoberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= OctoberEnd and A_DataSaidaISC > OctoberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= OctoberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= OctoberEnd and A_LeftISC_2 > OctoberBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Tempora%') as October,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= NovemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= NovemberEnd and A_DataSaidaISC > NovemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= NovemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= NovemberEnd and A_LeftISC_2 > NovemberBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Tempora%') as November,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= DecemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= DecemberEnd and A_DataSaidaISC > DecemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= DecemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= DecemberEnd and A_LeftISC_2 > DecemberBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Tempora%') as December,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JanuaryEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JanuaryEnd and A_DataSaidaISC > JanuaryBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JanuaryEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JanuaryEnd and A_LeftISC_2 > JanuaryBegin))
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Tempora%') as January,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= FebruaryEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= FebruaryEnd and A_DataSaidaISC > FebruaryBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= FebruaryEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= FebruaryEnd and A_LeftISC_2 > FebruaryBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Tempora%') as February,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MarchEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MarchEnd and A_DataSaidaISC > MarchBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MarchEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MarchEnd and A_LeftISC_2 > MarchBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Tempora%') as March,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AprilEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AprilEnd and A_DataSaidaISC > AprilBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AprilEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AprilEnd and A_LeftISC_2 > AprilBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Tempora%') as April,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MayEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MayEnd and A_DataSaidaISC > MayBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MayEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MayEnd and A_LeftISC_2 > MayBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Tempora%') as May,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JuneEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JuneEnd and A_DataSaidaISC > JuneBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JuneEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JuneEnd and A_LeftISC_2 > JuneBegin))
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Tempora%') as June,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JulyEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JulyEnd and A_DataSaidaISC > JulyBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JulyEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JulyEnd and A_LeftISC_2 > JulyBegin))
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Tempora%') as July
From UmatAlun
Where UMatAlun.PerLetivo = '08/09'

Union

Select Top 1
'4. Actual Local Paying' as Enrollment,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AugustEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AugustEnd and A_DataSaidaISC > AugustBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AugustEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AugustEnd and A_LeftISC_2 > AugustBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Local%') as August,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= SeptemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= SeptemberEnd and A_DataSaidaISC > SeptemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= SeptemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= SeptemberEnd and A_LeftISC_2 > SeptemberBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Local%') as September,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= OctoberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= OctoberEnd and A_DataSaidaISC > OctoberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= OctoberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= OctoberEnd and A_LeftISC_2 > OctoberBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Local%') as October,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= NovemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= NovemberEnd and A_DataSaidaISC > NovemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= NovemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= NovemberEnd and A_LeftISC_2 > NovemberBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Local%') as November,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= DecemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= DecemberEnd and A_DataSaidaISC > DecemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= DecemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= DecemberEnd and A_LeftISC_2 > DecemberBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Local%') as December,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JanuaryEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JanuaryEnd and A_DataSaidaISC > JanuaryBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JanuaryEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JanuaryEnd and A_LeftISC_2 > JanuaryBegin))
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Local%') as January,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= FebruaryEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= FebruaryEnd and A_DataSaidaISC > FebruaryBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= FebruaryEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= FebruaryEnd and A_LeftISC_2 > FebruaryBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Local%') as February,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MarchEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MarchEnd and A_DataSaidaISC > MarchBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MarchEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MarchEnd and A_LeftISC_2 > MarchBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Local%') as March,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AprilEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AprilEnd and A_DataSaidaISC > AprilBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AprilEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AprilEnd and A_LeftISC_2 > AprilBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Local%') as April,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MayEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MayEnd and A_DataSaidaISC > MayBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MayEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MayEnd and A_LeftISC_2 > MayBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Local%') as May,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JuneEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JuneEnd and A_DataSaidaISC > JuneBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JuneEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JuneEnd and A_LeftISC_2 > JuneBegin))
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Local%') as June,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JulyEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JulyEnd and A_DataSaidaISC > JulyBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JulyEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JulyEnd and A_LeftISC_2 > JulyBegin))
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Local%') as July
From UmatAlun
Where UMatAlun.PerLetivo = '08/09'

Union

Select Top 1
'5. Actual Staff Not Paying' as Enrollment,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AugustEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AugustEnd and A_DataSaidaISC > AugustBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AugustEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AugustEnd and A_LeftISC_2 > AugustBegin)) 
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) = 100
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Staff%') as August,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= SeptemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= SeptemberEnd and A_DataSaidaISC > SeptemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= SeptemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= SeptemberEnd and A_LeftISC_2 > SeptemberBegin)) 
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) = 100
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Staff%') as September,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= OctoberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= OctoberEnd and A_DataSaidaISC > OctoberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= OctoberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= OctoberEnd and A_LeftISC_2 > OctoberBegin)) 
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) = 100
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Staff%') as October,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= NovemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= NovemberEnd and A_DataSaidaISC > NovemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= NovemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= NovemberEnd and A_LeftISC_2 > NovemberBegin)) 
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) = 100
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Staff%') as November,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= DecemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= DecemberEnd and A_DataSaidaISC > DecemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= DecemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= DecemberEnd and A_LeftISC_2 > DecemberBegin)) 
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) = 100
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Staff%') as December,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JanuaryEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JanuaryEnd and A_DataSaidaISC > JanuaryBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JanuaryEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JanuaryEnd and A_LeftISC_2 > JanuaryBegin))
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) = 100
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Staff%') as January,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= FebruaryEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= FebruaryEnd and A_DataSaidaISC > FebruaryBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= FebruaryEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= FebruaryEnd and A_LeftISC_2 > FebruaryBegin)) 
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) = 100
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Staff%') as February,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MarchEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MarchEnd and A_DataSaidaISC > MarchBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MarchEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MarchEnd and A_LeftISC_2 > MarchBegin)) 
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) = 100
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Staff%') as March,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AprilEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AprilEnd and A_DataSaidaISC > AprilBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AprilEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AprilEnd and A_LeftISC_2 > AprilBegin)) 
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) = 100
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Staff%') as April,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MayEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MayEnd and A_DataSaidaISC > MayBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MayEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MayEnd and A_LeftISC_2 > MayBegin)) 
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) = 100
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Staff%') as May,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JuneEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JuneEnd and A_DataSaidaISC > JuneBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JuneEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JuneEnd and A_LeftISC_2 > JuneBegin))
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) = 100
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Staff%') as June,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JulyEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JulyEnd and A_DataSaidaISC > JulyBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JulyEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JulyEnd and A_LeftISC_2 > JulyBegin))
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) = 100
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Staff%') as July
From UmatAlun
Where UMatAlun.PerLetivo = '08/09'

Union

Select Top 1
'6. Actual Staff Paying' as Enrollment,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AugustEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AugustEnd and A_DataSaidaISC > AugustBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AugustEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AugustEnd and A_LeftISC_2 > AugustBegin)) 
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) != 100
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Staff%') as August,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= SeptemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= SeptemberEnd and A_DataSaidaISC > SeptemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= SeptemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= SeptemberEnd and A_LeftISC_2 > SeptemberBegin)) 
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) != 100
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Staff%') as September,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= OctoberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= OctoberEnd and A_DataSaidaISC > OctoberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= OctoberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= OctoberEnd and A_LeftISC_2 > OctoberBegin)) 
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) != 100
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Staff%') as October,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= NovemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= NovemberEnd and A_DataSaidaISC > NovemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= NovemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= NovemberEnd and A_LeftISC_2 > NovemberBegin)) 
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) != 100
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Staff%') as November,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= DecemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= DecemberEnd and A_DataSaidaISC > DecemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= DecemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= DecemberEnd and A_LeftISC_2 > DecemberBegin)) 
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) != 100
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Staff%') as December,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JanuaryEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JanuaryEnd and A_DataSaidaISC > JanuaryBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JanuaryEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JanuaryEnd and A_LeftISC_2 > JanuaryBegin))
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) != 100
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Staff%') as January,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= FebruaryEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= FebruaryEnd and A_DataSaidaISC > FebruaryBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= FebruaryEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= FebruaryEnd and A_LeftISC_2 > FebruaryBegin)) 
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) != 100
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Staff%') as February,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MarchEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MarchEnd and A_DataSaidaISC > MarchBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MarchEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MarchEnd and A_LeftISC_2 > MarchBegin)) 
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) != 100
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Staff%') as March,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AprilEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AprilEnd and A_DataSaidaISC > AprilBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AprilEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AprilEnd and A_LeftISC_2 > AprilBegin)) 
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) != 100
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Staff%') as April,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MayEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MayEnd and A_DataSaidaISC > MayBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MayEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MayEnd and A_LeftISC_2 > MayBegin)) 
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) != 100
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Staff%') as May,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JuneEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JuneEnd and A_DataSaidaISC > JuneBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JuneEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JuneEnd and A_LeftISC_2 > JuneBegin))
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) != 100
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Staff%') as June,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JulyEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JulyEnd and A_DataSaidaISC > JulyBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JulyEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JulyEnd and A_LeftISC_2 > JulyBegin))
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) != 100
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Staff%') as July
From UmatAlun
Where UMatAlun.PerLetivo = '08/09'

[BudgetDataOperatingExpenditures]

Select Top 1
	'1. Tuitions & School Fees' as OpperatingRevCollection,
	(Select  sum(August)    from BudgetDataRevCollectionfee('08/09')) as August, 
	(Select  sum(September) from BudgetDataRevCollectionfee('08/09')) as September, 
	(Select  sum(October)   from BudgetDataRevCollectionfee('08/09')) as October, 
	(Select  sum(November)  from BudgetDataRevCollectionfee('08/09')) as November, 
	(Select  sum(December)  from BudgetDataRevCollectionfee('08/09')) as December, 
	(Select  sum(January)   from BudgetDataRevCollectionfee('08/09')) as January, 
	(Select  sum(February)  from BudgetDataRevCollectionfee('08/09')) as February, 
	(Select  sum(March)     from BudgetDataRevCollectionfee('08/09')) as March, 
	(Select  sum(April)     from BudgetDataRevCollectionfee('08/09')) as April, 
	(Select  sum(May)  from BudgetDataRevCollectionfee('08/09')) as May, 
	(Select  sum(June) from BudgetDataRevCollectionfee('08/09')) as June, 
	(Select  sum(July) from BudgetDataRevCollectionfee('08/09')) as July	
from Glogin 

Union

Select Top 1
	'2. Investments Fees' as OpperatingRevCollection, 
	(Select  sum(August)    from BudgetDataRevCollectionInvestments('08/09')) as August, 
	(Select  sum(September) from BudgetDataRevCollectionInvestments('08/09')) as September, 
	(Select  sum(October)   from BudgetDataRevCollectionInvestments('08/09')) as October, 
	(Select  sum(November)  from BudgetDataRevCollectionInvestments('08/09')) as November, 
	(Select  sum(December)  from BudgetDataRevCollectionInvestments('08/09')) as December, 
	(Select  sum(January)   from BudgetDataRevCollectionInvestments('08/09')) as January, 
	(Select  sum(February)  from BudgetDataRevCollectionInvestments('08/09')) as February, 
	(Select  sum(March)     from BudgetDataRevCollectionInvestments('08/09')) as March, 
	(Select  sum(April)     from BudgetDataRevCollectionInvestments('08/09')) as April, 
	(Select  sum(May)  from BudgetDataRevCollectionInvestments('08/09')) as May, 
	(Select  sum(June) from BudgetDataRevCollectionInvestments('08/09')) as June, 
	(Select  sum(July) from BudgetDataRevCollectionInvestments('08/09')) as July	
from Glogin 



Select 
	'3. Budgetd' as OpperatingRevCollection,
	Sum(ValorOrcado)/12 + (Select Sum(ValorOrcado) from Titmorcamento where IDOrcamento in (Select IDOrcamento from TOrcamento where CodTBOrcamento = '11.01.002' and IDPeriodo = 2)) as Aug,
	Sum(ValorOrcado)/12 as Sep,
	Sum(ValorOrcado)/12 as Oct,
	Sum(ValorOrcado)/12 as Nov,
	Sum(ValorOrcado)/12 as Dec,
	Sum(ValorOrcado)/12 as Jan,
	Sum(ValorOrcado)/12 as Feb,
	Sum(ValorOrcado)/12 as Mar,
	Sum(ValorOrcado)/12 as Apr,
	Sum(ValorOrcado)/12 as May,
	Sum(ValorOrcado)/12 as Jun,
	Sum(ValorOrcado)/12 as Jul
from Titmorcamento
where IDOrcamento in (
Select IDOrcamento from TOrcamento where CodTBOrcamento = '11.01.001' and IDPeriodo = (
Select IdPeriodo from TPeriodoOrcamento where Descricao like '%08/09'))


Select IdPeriodo from TPeriodoOrcamento where Descricao like '%'+ '08/09'






Select 
	'1. S & B Budgeted ' as OpperatingRevCollection,
	Sum(ValorOrcado)/12 as Aug,
	Sum(ValorOrcado)/12 as Sep,
	Sum(ValorOrcado)/12 as Oct,
	Sum(ValorOrcado)/12 as Nov,
	Sum(ValorOrcado)/12 as Dec,
	Sum(ValorOrcado)/12 as Jan,
	Sum(ValorOrcado)/12 as Feb,
	Sum(ValorOrcado)/12 as Mar,
	Sum(ValorOrcado)/12 as Apr,
	Sum(ValorOrcado)/12 as May,
	Sum(ValorOrcado)/12 as Jun,
	Sum(ValorOrcado)/12 as Jul
from Titmorcamento
where IDOrcamento in (
Select IDOrcamento from TOrcamento where CodTBOrcamento like '00.%' and IDPeriodo = (
Select IdPeriodo from TPeriodoOrcamento where Descricao like '%08/09'))

Union

Select 
	'2. NERC - Budgeted ' as OpperatingRevCollection,
	Sum(ValorOrcado)/12 as Aug,
	Sum(ValorOrcado)/12 as Sep,
	Sum(ValorOrcado)/12 as Oct,
	Sum(ValorOrcado)/12 as Nov,
	Sum(ValorOrcado)/12 as Dec,
	Sum(ValorOrcado)/12 as Jan,
	Sum(ValorOrcado)/12 as Feb,
	Sum(ValorOrcado)/12 as Mar,
	Sum(ValorOrcado)/12 as Apr,
	Sum(ValorOrcado)/12 as May,
	Sum(ValorOrcado)/12 as Jun,
	Sum(ValorOrcado)/12 as Jul
from Titmorcamento
where 
IDOrcamento in (
Select IDOrcamento from TOrcamento where CodTBOrcamento like '01.%' and IDPeriodo = (
Select IdPeriodo from TPeriodoOrcamento where Descricao like '%08/09')) 
or 
IDOrcamento in (
Select IDOrcamento from TOrcamento where CodTBOrcamento like '05.%' and IDPeriodo = (
Select IdPeriodo from TPeriodoOrcamento where Descricao like '%08/09')) 





Select Top 1
	'4. Actual' as OpperatingRevCollection,
	(Select  sum(August)    from BudgetDataOperatingExpenditures('08/09')) as August, 
	(Select  sum(September) from BudgetDataOperatingExpenditures('08/09')) as September, 
	(Select  sum(October)   from BudgetDataOperatingExpenditures('08/09')) as October, 
	(Select  sum(November)  from BudgetDataOperatingExpenditures('08/09')) as November, 
	(Select  sum(December)  from BudgetDataOperatingExpenditures('08/09')) as December, 
	(Select  sum(January)   from BudgetDataOperatingExpenditures('08/09')) as January, 
	(Select  sum(February)  from BudgetDataOperatingExpenditures('08/09')) as February, 
	(Select  sum(March)     from BudgetDataOperatingExpenditures('08/09')) as March, 
	(Select  sum(April)     from BudgetDataOperatingExpenditures('08/09')) as April, 
	(Select  sum(May)  from BudgetDataOperatingExpenditures('08/09')) as May, 
	(Select  sum(June) from BudgetDataOperatingExpenditures('08/09')) as June, 
	(Select  sum(July) from BudgetDataOperatingExpenditures('08/09')) as July	
from Glogin 



Select Top 1
	'Dev. Fund Income' as OpperatingRevCollection,
	(Select  sum(August)    from BudgetDataDevFund('08/09')) as August, 
	(Select  sum(September) from BudgetDataDevFund('08/09')) as September, 
	(Select  sum(October)   from BudgetDataDevFund('08/09')) as October, 
	(Select  sum(November)  from BudgetDataDevFund('08/09')) as November, 
	(Select  sum(December)  from BudgetDataDevFund('08/09')) as December, 
	(Select  sum(January)   from BudgetDataDevFund('08/09')) as January, 
	(Select  sum(February)  from BudgetDataDevFund('08/09')) as February, 
	(Select  sum(March)     from BudgetDataDevFund('08/09')) as March, 
	(Select  sum(April)     from BudgetDataDevFund('08/09')) as April, 
	(Select  sum(May)  from BudgetDataDevFund('08/09')) as May, 
	(Select  sum(June) from BudgetDataDevFund('08/09')) as June, 
	(Select  sum(July) from BudgetDataDevFund('08/09')) as July	
from Glogin 



Select Top 1
	'BudgetDataOEActualSalBen' as BudgetDataOEActualSalBen,
	(Select  sum(August)    from BudgetDataOEActualSalBen('09/10')) as August, 
	(Select  sum(September) from BudgetDataOEActualSalBen('08/09')) as September, 
	(Select  sum(October)   from BudgetDataOEActualSalBen('08/09')) as October, 
	(Select  sum(November)  from BudgetDataOEActualSalBen('08/09')) as November, 
	(Select  sum(December)  from BudgetDataOEActualSalBen('08/09')) as December, 
	(Select  sum(January)   from BudgetDataOEActualSalBen('08/09')) as January, 
	(Select  sum(February)  from BudgetDataOEActualSalBen('08/09')) as February, 
	(Select  sum(March)     from BudgetDataOEActualSalBen('08/09')) as March, 
	(Select  sum(April)     from BudgetDataOEActualSalBen('08/09')) as April, 
	(Select  sum(May)  from BudgetDataOEActualSalBen('08/09')) as May, 
	(Select  sum(June) from BudgetDataOEActualSalBen('08/09')) as June, 
	(Select  sum(July) from BudgetDataOEActualSalBen('08/09')) as July	
from Glogin 



Select Top 1
	'BudgetDataOEActualSalBen' as BudgetDataOEActualNERCs,
	(Select  sum(August)    from BudgetDataOEActualNERCs('09/10')) as August, 
	(Select  sum(September) from BudgetDataOEActualNERCs('08/09')) as September, 
	(Select  sum(October)   from BudgetDataOEActualNERCs('08/09')) as October, 
	(Select  sum(November)  from BudgetDataOEActualNERCs('08/09')) as November, 
	(Select  sum(December)  from BudgetDataOEActualNERCs('08/09')) as December, 
	(Select  sum(January)   from BudgetDataOEActualNERCs('08/09')) as January, 
	(Select  sum(February)  from BudgetDataOEActualNERCs('08/09')) as February, 
	(Select  sum(March)     from BudgetDataOEActualNERCs('08/09')) as March, 
	(Select  sum(April)     from BudgetDataOEActualNERCs('08/09')) as April, 
	(Select  sum(May)  from BudgetDataOEActualNERCs('08/09')) as May, 
	(Select  sum(June) from BudgetDataOEActualNERCs('08/09')) as June, 
	(Select  sum(July) from BudgetDataOEActualNERCs('08/09')) as July	
from Glogin 

*/