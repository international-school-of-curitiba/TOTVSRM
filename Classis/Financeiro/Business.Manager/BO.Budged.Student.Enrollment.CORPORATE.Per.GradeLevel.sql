Declare @SchoolYear as Varchar(5)
Declare @CodCur as varchar (1)
Declare @CodPer as varchar (1)
Declare @Periodo as varchar (2)

Set @SchoolYear = '09/10'
Set @CodCur = '3'
Set @CodPer = '1'
Set @Periodo = '12'

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
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%'
and UMatricpl.CodCur =@CodCur and Umatricpl.CodPer =@CodPer and Umatricpl.Periodo  like @Periodo) as August,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= SeptemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= SeptemberEnd and A_DataSaidaISC > SeptemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= SeptemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= SeptemberEnd and A_LeftISC_2 > SeptemberBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%'
and UMatricpl.CodCur =@CodCur and Umatricpl.CodPer =@CodPer and Umatricpl.Periodo  like @Periodo) as September,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= OctoberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= OctoberEnd and A_DataSaidaISC > OctoberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= OctoberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= OctoberEnd and A_LeftISC_2 > OctoberBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%'
and UMatricpl.CodCur =@CodCur and Umatricpl.CodPer =@CodPer and Umatricpl.Periodo  like @Periodo) as October,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= NovemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= NovemberEnd and A_DataSaidaISC > NovemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= NovemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= NovemberEnd and A_LeftISC_2 > NovemberBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%'
and UMatricpl.CodCur =@CodCur and Umatricpl.CodPer =@CodPer and Umatricpl.Periodo  like @Periodo) as November,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= DecemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= DecemberEnd and A_DataSaidaISC > DecemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= DecemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= DecemberEnd and A_LeftISC_2 > DecemberBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%'
and UMatricpl.CodCur =@CodCur and Umatricpl.CodPer =@CodPer and Umatricpl.Periodo  like @Periodo) as December,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JanuaryEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JanuaryEnd and A_DataSaidaISC > JanuaryBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JanuaryEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JanuaryEnd and A_LeftISC_2 > JanuaryBegin))
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%'
and UMatricpl.CodCur =@CodCur and Umatricpl.CodPer =@CodPer and Umatricpl.Periodo  like @Periodo) as January,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= FebruaryEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= FebruaryEnd and A_DataSaidaISC > FebruaryBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= FebruaryEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= FebruaryEnd and A_LeftISC_2 > FebruaryBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%'
and UMatricpl.CodCur =@CodCur and Umatricpl.CodPer =@CodPer and Umatricpl.Periodo  like @Periodo) as February,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MarchEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MarchEnd and A_DataSaidaISC > MarchBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MarchEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MarchEnd and A_LeftISC_2 > MarchBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%'
and UMatricpl.CodCur =@CodCur and Umatricpl.CodPer =@CodPer and Umatricpl.Periodo  like @Periodo) as March,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AprilEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AprilEnd and A_DataSaidaISC > AprilBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AprilEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AprilEnd and A_LeftISC_2 > AprilBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%'
and UMatricpl.CodCur =@CodCur and Umatricpl.CodPer =@CodPer and Umatricpl.Periodo  like @Periodo) as April,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MayEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MayEnd and A_DataSaidaISC > MayBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MayEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MayEnd and A_LeftISC_2 > MayBegin)) 
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%'
and UMatricpl.CodCur =@CodCur and Umatricpl.CodPer =@CodPer and Umatricpl.Periodo  like @Periodo) as May,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JuneEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JuneEnd and A_DataSaidaISC > JuneBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JuneEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JuneEnd and A_LeftISC_2 > JuneBegin))
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%'
and UMatricpl.CodCur =@CodCur and Umatricpl.CodPer =@CodPer and Umatricpl.Periodo  like @Periodo) as June,
(Select distinct COUNT(EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JulyEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JulyEnd and A_DataSaidaISC > JulyBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JulyEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JulyEnd and A_LeftISC_2 > JulyBegin))
and (Select Descricao from UtabTipo where CodTipo = EAlunos.TipoAluno) like 'Corporate%'
and UMatricpl.CodCur =@CodCur and Umatricpl.CodPer =@CodPer and Umatricpl.Periodo  like @Periodo) as July
From UmatAlun
Where UMatAlun.PerLetivo =@SchoolYear