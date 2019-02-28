Select Top 1
'Corporate K on' as Enrollment,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AugustEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AugustEnd and A_DataSaidaISC > AugustBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AugustEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AugustEnd and A_LeftISC_2 > AugustBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%' and UMatricPL.Status not in ('09','10','16','18')) as August,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= SeptemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= SeptemberEnd and A_DataSaidaISC > SeptemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= SeptemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= SeptemberEnd and A_LeftISC_2 > SeptemberBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%' and UMatricPL.Status not in ('09','10','16','18')) as September,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= OctoberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= OctoberEnd and A_DataSaidaISC > OctoberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= OctoberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= OctoberEnd and A_LeftISC_2 > OctoberBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%' and UMatricPL.Status not in ('09','10','16','18')) as October,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= NovemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= NovemberEnd and A_DataSaidaISC > NovemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= NovemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= NovemberEnd and A_LeftISC_2 > NovemberBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%' and UMatricPL.Status not in ('09','10','16','18')) as November,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= DecemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= DecemberEnd and A_DataSaidaISC > DecemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= DecemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= DecemberEnd and A_LeftISC_2 > DecemberBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%' and UMatricPL.Status not in ('09','10','16','18')) as December,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JanuaryEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JanuaryEnd and A_DataSaidaISC > JanuaryBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JanuaryEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JanuaryEnd and A_LeftISC_2 > JanuaryBegin))
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%' and UMatricPL.Status not in ('09','10','16','18')) as January,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= FebruaryEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= FebruaryEnd and A_DataSaidaISC > FebruaryEnd)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= FebruaryEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= FebruaryEnd and A_LeftISC_2 > FebruaryEnd )) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%' and UMatricPL.Status not in ('09','10','16','18')) as February,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MarchEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MarchEnd and A_DataSaidaISC > MarchBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MarchEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MarchEnd and A_LeftISC_2 > MarchBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%' and UMatricPL.Status not in ('09','10','16','18')) as March,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AprilEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AprilEnd and A_DataSaidaISC > AprilBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AprilEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AprilEnd and A_LeftISC_2 > AprilBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%' and UMatricPL.Status not in ('09','10','16','18')) as April,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MayEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MayEnd and A_DataSaidaISC > MayBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MayEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MayEnd and A_LeftISC_2 > MayBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%' and UMatricPL.Status not in ('09','10','16','18')) as May,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JuneEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JuneEnd and A_DataSaidaISC > JuneBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JuneEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JuneEnd and A_LeftISC_2 > JuneBegin))
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%' and UMatricPL.Status not in ('09','10','16','18')) as June,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JulyEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JulyEnd and A_DataSaidaISC > JulyBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JulyEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JulyEnd and A_LeftISC_2 > JulyBegin))
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%' and UMatricPL.Status not in ('09','10','16','18')) as July
From UmatAlun
Where UMatAlun.PerLetivo = '17/18' and UMATALUN.STATUS <> '18'

union
/*
Select Top 1
'Corporate T/N/PK' as Enrollment,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AugustEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AugustEnd and A_DataSaidaISC > AugustBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AugustEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AugustEnd and A_LeftISC_2 > AugustBegin)) 
and UMatricpl.CodCur = 1 and UMatricPL.CodPer = 1 and UMatricpl.Periodo in (1,2,3)
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%' and UMatricPL.Status not in ('09','10','16','18')) as August,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= SeptemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= SeptemberEnd and A_DataSaidaISC > SeptemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= SeptemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= SeptemberEnd and A_LeftISC_2 > SeptemberBegin)) 
and UMatricpl.CodCur = 1 and UMatricPL.CodPer = 1 and UMatricpl.Periodo in (1,2,3)
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%' and UMatricPL.Status not in ('09','10','16','18')) as September,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= OctoberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= OctoberEnd and A_DataSaidaISC > OctoberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= OctoberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= OctoberEnd and A_LeftISC_2 > OctoberBegin)) 
and UMatricpl.CodCur = 1 and UMatricPL.CodPer = 1 and UMatricpl.Periodo in (1,2,3)
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%' and UMatricPL.Status not in ('09','10','16','18')) as October,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= NovemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= NovemberEnd and A_DataSaidaISC > NovemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= NovemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= NovemberEnd and A_LeftISC_2 > NovemberBegin)) 
and UMatricpl.CodCur = 1 and UMatricPL.CodPer = 1 and UMatricpl.Periodo in (1,2,3)
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%' and UMatricPL.Status not in ('09','10','16','18')) as November,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= DecemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= DecemberEnd and A_DataSaidaISC > DecemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= DecemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= DecemberEnd and A_LeftISC_2 > DecemberBegin)) 
and UMatricpl.CodCur = 1 and UMatricPL.CodPer = 1 and UMatricpl.Periodo in (1,2,3)
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%' and UMatricPL.Status not in ('09','10','16','18')) as December,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JanuaryEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JanuaryEnd and A_DataSaidaISC > JanuaryBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JanuaryEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JanuaryEnd and A_LeftISC_2 > JanuaryBegin))
and UMatricpl.CodCur = 1 and UMatricPL.CodPer = 1 and UMatricpl.Periodo in (1,2,3)
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%' and UMatricPL.Status not in ('09','10','16','18')) as January,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= FebruaryEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= FebruaryEnd and A_DataSaidaISC > FebruaryBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= FebruaryEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= FebruaryEnd and A_LeftISC_2 > FebruaryBegin)) 
and UMatricpl.CodCur = 1 and UMatricPL.CodPer = 1 and UMatricpl.Periodo in (1,2,3)
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%' and UMatricPL.Status not in ('09','10','16','18')) as February,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MarchEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MarchEnd and A_DataSaidaISC > MarchBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MarchEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MarchEnd and A_LeftISC_2 > MarchBegin)) 
and UMatricpl.CodCur = 1 and UMatricPL.CodPer = 1 and UMatricpl.Periodo in (1,2,3)
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%' and UMatricPL.Status not in ('09','10','16','18')) as March,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AprilEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AprilEnd and A_DataSaidaISC > AprilBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AprilEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AprilEnd and A_LeftISC_2 > AprilBegin)) 
and UMatricpl.CodCur = 1 and UMatricPL.CodPer = 1 and UMatricpl.Periodo in (1,2,3)
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%' and UMatricPL.Status not in ('09','10','16','18')) as April,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MayEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MayEnd and A_DataSaidaISC > MayBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MayEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MayEnd and A_LeftISC_2 > MayBegin)) 
and UMatricpl.CodCur = 1 and UMatricPL.CodPer = 1 and UMatricpl.Periodo in (1,2,3)
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%' and UMatricPL.Status not in ('09','10','16','18')) as May,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JuneEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JuneEnd and A_DataSaidaISC > JuneBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JuneEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JuneEnd and A_LeftISC_2 > JuneBegin))
and UMatricpl.CodCur = 1 and UMatricPL.CodPer = 1 and UMatricpl.Periodo in (1,2,3)
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%' and UMatricPL.Status not in ('09','10','16','18')) as June,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JulyEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JulyEnd and A_DataSaidaISC > JulyBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JulyEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JulyEnd and A_LeftISC_2 > JulyBegin))
and UMatricpl.CodCur = 1 and UMatricPL.CodPer = 1 and UMatricpl.Periodo in (1,2,3)
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%' and UMatricPL.Status not in ('09','10','16','18')) as July
From UmatAlun
Where UMatAlun.PerLetivo = '17/18' and UMATALUN.STATUS <> '18'

union
*/


Select Top 1
'Local/Temporary' as Enrollment,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AugustEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AugustEnd and A_DataSaidaISC > AugustBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AugustEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AugustEnd and A_LeftISC_2 > AugustBegin)) 
and     (Ealunos.TipoAluno in ('1','2') and UMatricPL.Status not in ('09','10','16','18'))) as August,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= SeptemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= SeptemberEnd and A_DataSaidaISC > SeptemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= SeptemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= SeptemberEnd and A_LeftISC_2 > SeptemberBegin)) 
and     (Ealunos.TipoAluno in ('1','2')and UMatricPL.Status not in ('09','10','16','18'))) as September,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= OctoberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= OctoberEnd and A_DataSaidaISC > OctoberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= OctoberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= OctoberEnd and A_LeftISC_2 > OctoberBegin)) 
and     (Ealunos.TipoAluno in ('1','2')and UMatricPL.Status not in ('09','10','16','18'))) as October,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= NovemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= NovemberEnd and A_DataSaidaISC > NovemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= NovemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= NovemberEnd and A_LeftISC_2 > NovemberBegin)) 
and     (Ealunos.TipoAluno in ('1','2')and UMatricPL.Status not in ('09','10','16','18'))) as November,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= DecemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= DecemberEnd and A_DataSaidaISC > DecemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= DecemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= DecemberEnd and A_LeftISC_2 > DecemberBegin)) 
and     (Ealunos.TipoAluno in ('1','2')and UMatricPL.Status not in ('09','10','16','18'))) as December,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JanuaryEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JanuaryEnd and A_DataSaidaISC > JanuaryBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JanuaryEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JanuaryEnd and A_LeftISC_2 > JanuaryBegin))
and     (Ealunos.TipoAluno in ('1','2')and UMatricPL.Status not in ('09','10','16','18')))  as January,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= FebruaryEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= FebruaryEnd and A_DataSaidaISC > FebruaryEnd )
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= FebruaryEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= FebruaryEnd and A_LeftISC_2 > FebruaryEnd )) 
and     (Ealunos.TipoAluno in ('1','2') and UMatricPL.Status not in ('09','10','16','18'))) as February,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MarchEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MarchEnd and A_DataSaidaISC > MarchBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MarchEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MarchEnd and A_LeftISC_2 > MarchBegin)) 
and     (Ealunos.TipoAluno in ('1','2')and UMatricPL.Status not in ('09','10','16','18'))) as March,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AprilEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AprilEnd and A_DataSaidaISC > AprilBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AprilEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AprilEnd and A_LeftISC_2 > AprilBegin)) 
and     (Ealunos.TipoAluno in ('1','2')and UMatricPL.Status not in ('09','10','16','18'))) as April,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MayEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MayEnd and A_DataSaidaISC > MayBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MayEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MayEnd and A_LeftISC_2 > MayBegin)) 
and     (Ealunos.TipoAluno in ('1','2')and UMatricPL.Status not in ('09','10','16','18'))) as May,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JuneEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JuneEnd and A_DataSaidaISC > JuneBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JuneEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JuneEnd and A_LeftISC_2 > JuneBegin))
and     (Ealunos.TipoAluno in ('1','2')and UMatricPL.Status not in ('09','10','16','18'))) as June,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JulyEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JulyEnd and A_DataSaidaISC > JulyBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JulyEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JulyEnd and A_LeftISC_2 > JulyBegin))
and     (Ealunos.TipoAluno in ('1','2')and UMatricPL.Status not in ('09','10','16','18'))) as July
From UmatAlun
where UMatAlun.PerLetivo = '17/18' and UMATALUN.STATUS <> '18'

union

Select Top 1
'Sports Scholarship' as Enrollment,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AugustEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AugustEnd and A_DataSaidaISC > AugustBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AugustEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AugustEnd and A_LeftISC_2 > AugustBegin)) 
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) = 101
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like '%') as August,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= SeptemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= SeptemberEnd and A_DataSaidaISC > SeptemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= SeptemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= SeptemberEnd and A_LeftISC_2 > SeptemberBegin)) 
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) =101
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like '%') as September,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= OctoberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= OctoberEnd and A_DataSaidaISC > OctoberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= OctoberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= OctoberEnd and A_LeftISC_2 > OctoberBegin)) 
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) =101
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like '%') as October,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= NovemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= NovemberEnd and A_DataSaidaISC > NovemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= NovemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= NovemberEnd and A_LeftISC_2 > NovemberBegin)) 
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) =101
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like '%') as November,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= DecemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= DecemberEnd and A_DataSaidaISC > DecemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= DecemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= DecemberEnd and A_LeftISC_2 > DecemberBegin)) 
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) =101
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like '%') as December,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JanuaryEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JanuaryEnd and A_DataSaidaISC > JanuaryBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JanuaryEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JanuaryEnd and A_LeftISC_2 > JanuaryBegin))
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) =101
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like '%') as January,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= FebruaryEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= FebruaryEnd and A_DataSaidaISC > FebruaryBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= FebruaryEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= FebruaryEnd and A_LeftISC_2 > FebruaryBegin)) 
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) =101
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like '%') as February,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MarchEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MarchEnd and A_DataSaidaISC > MarchBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MarchEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MarchEnd and A_LeftISC_2 > MarchBegin)) 
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) =101
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like '%') as March,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AprilEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AprilEnd and A_DataSaidaISC > AprilBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AprilEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AprilEnd and A_LeftISC_2 > AprilBegin)) 
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) =101
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like '%') as April,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MayEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MayEnd and A_DataSaidaISC > MayBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MayEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MayEnd and A_LeftISC_2 > MayBegin)) 
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) =101
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like '%') as May,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JuneEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JuneEnd and A_DataSaidaISC > JuneBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JuneEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JuneEnd and A_LeftISC_2 > JuneBegin))
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) =101
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like '%') as June,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JulyEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JulyEnd and A_DataSaidaISC > JulyBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JulyEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JulyEnd and A_LeftISC_2 > JulyBegin))
and (Select Top 1 codbol from EaluBolsa where Perletivo = UMatAlun.PerLetivo and EaluBolsa.MatAluno = EAlunos.Matricula) =101
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like '%') as July
From UmatAlun
Where UMatAlun.PerLetivo = '17/18'

union

Select Top 1
'Staff (50% Tuition)' as Enrollment,
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
Where UMatAlun.PerLetivo = '17/18'

union

Select Top 1
'Staff Non Paying' as Enrollment,
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
Where UMatAlun.PerLetivo = '17/18'
