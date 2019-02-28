Declare @SchoolYear as Varchar(5)
Declare @CodCur as varchar (1)
Declare @CodPer as varchar (1)
Declare @Periodo as varchar (2)
Declare @CodTur as varchar (15)

Set @SchoolYear = '10/11'
Set @CodCur = '1'
Set @CodPer = '1'
Set @Periodo = '0'
Set @CodTur = 'Pre-Toddler A'

Select Top 1
@CodTur,
(Select COUNT(distinct EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
	Inner Join UMatAlun (NoLock) on (UMatAlun.Perletivo = @SchoolYear and UMatAlun.MATALUNO = EACOMPL.MATRICULA and UMATALUN.CODTUR = @CodTur) 
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AugustEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AugustEnd and A_DataSaidaISC > AugustBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AugustEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AugustEnd and A_LeftISC_2 > AugustBegin))
and UMatricpl.CodCur =@CodCur and Umatricpl.CodPer =@CodPer and Umatricpl.Periodo like @Periodo
and UMatricpl.Status not in('09','16','18','19')) as August,
(Select COUNT(distinct EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
	Inner Join UMatAlun (NoLock) on (UMatAlun.Perletivo = @SchoolYear and UMatAlun.MATALUNO = EACOMPL.MATRICULA and UMATALUN.CODTUR = @CodTur) 
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= SeptemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= SeptemberEnd and A_DataSaidaISC > SeptemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= SeptemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= SeptemberEnd and A_LeftISC_2 > SeptemberBegin))
and UMatricpl.CodCur =@CodCur and Umatricpl.CodPer =@CodPer and Umatricpl.Periodo  like @Periodo
and UMatricpl.Status not in('09','16','18','19'))  as September,
(Select COUNT(distinct EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
	Inner Join UMatAlun (NoLock) on (UMatAlun.Perletivo = @SchoolYear and UMatAlun.MATALUNO = EACOMPL.MATRICULA and UMATALUN.CODTUR = @CodTur) 
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= OctoberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= OctoberEnd and A_DataSaidaISC > OctoberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= OctoberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= OctoberEnd and A_LeftISC_2 > OctoberBegin))
and UMatricpl.CodCur =@CodCur and Umatricpl.CodPer =@CodPer and Umatricpl.Periodo  like @Periodo
and UMatricpl.Status not in('09','16','18','19'))  as October,
(Select COUNT(distinct EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
	Inner Join UMatAlun (NoLock) on (UMatAlun.Perletivo = @SchoolYear and UMatAlun.MATALUNO = EACOMPL.MATRICULA and UMATALUN.CODTUR = @CodTur) 
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= NovemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= NovemberEnd and A_DataSaidaISC > NovemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= NovemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= NovemberEnd and A_LeftISC_2 > NovemberBegin))
and UMatricpl.CodCur =@CodCur and Umatricpl.CodPer =@CodPer and Umatricpl.Periodo  like @Periodo
and UMatricpl.Status not in('09','16','18','19'))  as November,
(Select COUNT(distinct EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
	Inner Join UMatAlun (NoLock) on (UMatAlun.Perletivo = @SchoolYear and UMatAlun.MATALUNO = EACOMPL.MATRICULA and UMATALUN.CODTUR = @CodTur) 
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= DecemberEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= DecemberEnd and A_DataSaidaISC > DecemberBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= DecemberEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= DecemberEnd and A_LeftISC_2 > DecemberBegin))
and UMatricpl.CodCur =@CodCur and Umatricpl.CodPer =@CodPer and Umatricpl.Periodo  like @Periodo
and UMatricpl.Status not in('09','16','18','19')) as December,
(Select COUNT(distinct EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
	Inner Join UMatAlun (NoLock) on (UMatAlun.Perletivo = @SchoolYear and UMatAlun.MATALUNO = EACOMPL.MATRICULA and UMATALUN.CODTUR = @CodTur) 
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JanuaryEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JanuaryEnd and A_DataSaidaISC > JanuaryBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JanuaryEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JanuaryEnd and A_LeftISC_2 > JanuaryBegin))
and UMatricpl.CodCur =@CodCur and Umatricpl.CodPer =@CodPer and Umatricpl.Periodo  like @Periodo
and UMatricpl.Status not in('09','16','18','19')) as January,
(Select COUNT(distinct EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
	Inner Join UMatAlun (NoLock) on (UMatAlun.Perletivo = @SchoolYear and UMatAlun.MATALUNO = EACOMPL.MATRICULA and UMATALUN.CODTUR = @CodTur) 
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= FebruaryEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= FebruaryEnd and A_DataSaidaISC > FebruaryBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= FebruaryEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= FebruaryEnd and A_LeftISC_2 > FebruaryBegin))
and UMatricpl.CodCur =@CodCur and Umatricpl.CodPer =@CodPer and Umatricpl.Periodo  like @Periodo
and UMatricpl.Status not in('09','16','18','19'))  as February,
(Select COUNT(distinct EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
	Inner Join UMatAlun (NoLock) on (UMatAlun.Perletivo = @SchoolYear and UMatAlun.MATALUNO = EACOMPL.MATRICULA and UMATALUN.CODTUR = @CodTur) 
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MarchEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MarchEnd and A_DataSaidaISC > MarchBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MarchEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MarchEnd and A_LeftISC_2 > MarchBegin))
and UMatricpl.CodCur =@CodCur and Umatricpl.CodPer =@CodPer and Umatricpl.Periodo  like @Periodo
and UMatricpl.Status not in('09','16','18','19')) as March,
(Select COUNT(distinct EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
	Inner Join UMatAlun (NoLock) on (UMatAlun.Perletivo = @SchoolYear and UMatAlun.MATALUNO = EACOMPL.MATRICULA and UMATALUN.CODTUR = @CodTur) 
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AprilEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= AprilEnd and A_DataSaidaISC > AprilBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AprilEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= AprilEnd and A_LeftISC_2 > AprilBegin))
and UMatricpl.CodCur =@CodCur and Umatricpl.CodPer =@CodPer and Umatricpl.Periodo  like @Periodo
and UMatricpl.Status not in('09','16','18','19')) as April,
(Select COUNT(distinct EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
	Inner Join UMatAlun (NoLock) on (UMatAlun.Perletivo = @SchoolYear and UMatAlun.MATALUNO = EACOMPL.MATRICULA and UMATALUN.CODTUR = @CodTur) 
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MayEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= MayEnd and A_DataSaidaISC > MayBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MayEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= MayEnd and A_LeftISC_2 > MayBegin)) 
and UMatricpl.CodCur =@CodCur and Umatricpl.CodPer =@CodPer and Umatricpl.Periodo  like @Periodo
and UMatricpl.Status not in('09','16','18','19'))  as May,
(Select COUNT(distinct EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
	Inner Join UMatAlun (NoLock) on (UMatAlun.Perletivo = @SchoolYear and UMatAlun.MATALUNO = EACOMPL.MATRICULA and UMATALUN.CODTUR = @CodTur) 
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JuneEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JuneEnd and A_DataSaidaISC > JuneBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JuneEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JuneEnd and A_LeftISC_2 > JuneBegin)) 
and UMatricpl.CodCur =@CodCur and Umatricpl.CodPer =@CodPer and Umatricpl.Periodo  like @Periodo
and UMatricpl.Status not in('09','16','18','19')) as June,
(Select COUNT(distinct EACompl.Matricula) from 	UMatricPL
	Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMatricPL.MatAluno)
	Inner Join Z_SchoolCalendar (NoLock) on (UMatricpl.Perletivo = Z_SchoolCalendar.CodPerlet)
	Inner Join UMatAlun (NoLock) on (UMatAlun.Perletivo = @SchoolYear and UMatAlun.MATALUNO = EACOMPL.MATRICULA and UMATALUN.CODTUR = @CodTur) 
Where ((UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JulyEnd and A_DataSaidaISC is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_DataEntradaISC <= JulyEnd and A_DataSaidaISC > JulyBegin)
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JulyEnd and A_LeftISC_2 is null) 
OR 	(UMatricPL.PerLetivo = UMatAlun.PerLetivo and A_ReturnedToISC <= JulyEnd and A_LeftISC_2 > JulyBegin))
and UMatricpl.CodCur =@CodCur and Umatricpl.CodPer =@CodPer and Umatricpl.Periodo  like @Periodo
and UMatricpl.Status not in('09','16','18','19'))  as July
From UmatAlun 
Where UMatAlun.PerLetivo =@SchoolYear


/*
select distinct
     Ealubolsa.MatAluno,  
     (Select top 1 Nome from FCFO where CodCFo = respons) as Responsavel_$,
     Rtrim(A_NomeReduzido)as Nome,
     (Select top 1 CodTur from UMatAlun  where UMatAlun.MatAluno = Eacompl.Matricula  and Ealubolsa.perletivo = UMatAlun.Perletivo Group by UMatAlun.CodTur Order by count(UMatAlun.CodTur) desc) as Grade_Level, 
      DescBolsa, Ealubolsa.CodBol, SERVICO_DESC,
	Ealubolsa.PercDesc
from Ealubolsa 
inner Join ETipobols (NoLock) on (ETipobols.CodBolsa = Ealubolsa.CodBol)
inner join Eservicos (NoLock) on (EServicos.Servico_Cod = Ealubolsa.CodServico)
inner join Ealunos (NoLock) on (Ealunos.Matricula =  Ealubolsa.MatAluno)
inner Join EACompl (NoLock) on (Eacompl.Matricula = Ealubolsa.MatAluno)
inner Join UMatricpl (NoLock) on (UMatricpl.Perletivo = Ealubolsa.perletivo)
where Ealubolsa.perletivo ='08/09'
--and codbolsa in (25, 50, 75, 100)
Order By grade_level

*/