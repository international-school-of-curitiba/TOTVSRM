Declare @SchooLYear as nvarchar(5)
Declare @EmailLanguage as nvarchar(15)

Set @SchoolYear = '15/16'
Set @EmailLanguage = '%'


Select Distinct
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.Email From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select PPessoa.Email From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as Email,
	EAcompl.A_Emailing,
	(select UMATRICPL.periodo from umatricpl where MATALUNO = EALUNOS.MATRICULA and UMATRICPL.PERLETIVO = @SchooLYear)
from ZFamilia
Inner Join EAlunos (NoLock) on (Ealunos.Matricula = ZFamilia.Matricula) 
Inner Join EACompl (NoLock) on (EACompl.Matricula = ZFamilia.Matricula)
where ZFamilia.Perletivo =@SchoolYear  and ZFamilia.Status in ('01','07','18')
and ZFAMILIA.MATRICULA in 
	(
			select 
				Matricula
			from UMATRICPL
			inner Join EACOMPL (NoLock) on (EAcompl.Matricula = UMatricpl.MatAluno)
			inner Join UMATRICPLLIVRE (NoLock) on (UMATRICPLLIVRE.PERLETIVO = UMATRICPL.PERLETIVO and UMATRICPLLIVRE.MATALUNO = UMATRICPL.MATALUNO and UMATRICPLLIVRE.GRADE= UMATRICPL.GRADE)
			where UMATRICPL.PERLETIVO =@SchoolYear
			and UMATRICPL.STATUS in ('01','07','18')
			and (A_DATAENTRADAISC >= (Select AugustBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) 
			or  A_RETURNEDTOISC >= (Select AugustBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) )
			and (A_DATAENTRADAISC between (case when 1 =1 then (Select AugustBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) else  (Select JanuaryBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) end) and (case when 1 =1 then (Select DecemberEnd from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) else  (Select JulyEnd from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) end)
			or A_RETURNEDTOISC between (case when 1 =1 then (Select AugustBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) else  (Select JanuaryBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) end) and (case when 1 =1 then (Select DecemberEnd from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) else  (Select JulyEnd from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) end))
	)

and EAcompl.A_Emailing like @EmailLanguage


union

Select Distinct
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select FCFO.Email From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select PPessoa.Email From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as Email, 
	EAcompl.A_Emailing,
	(select UMATRICPL.periodo from umatricpl where MATALUNO = EALUNOS.MATRICULA and UMATRICPL.PERLETIVO = @SchooLYear)
from ZFamilia
Inner Join EAlunos (NoLock) on (Ealunos.Matricula = ZFamilia.Matricula) 
Inner Join EACompl (NoLock) on (EACompl.Matricula = ZFamilia.Matricula)
where ZFamilia.Perletivo =@SchoolYear  and ZFamilia.Status in ('01','07','18')
and ZFAMILIA.MATRICULA in 
	(
			select 
				Matricula
			from UMATRICPL
			inner Join EACOMPL (NoLock) on (EAcompl.Matricula = UMatricpl.MatAluno)
			inner Join UMATRICPLLIVRE (NoLock) on (UMATRICPLLIVRE.PERLETIVO = UMATRICPL.PERLETIVO and UMATRICPLLIVRE.MATALUNO = UMATRICPL.MATALUNO and UMATRICPLLIVRE.GRADE= UMATRICPL.GRADE)
			where UMATRICPL.PERLETIVO =@SchoolYear
			and UMATRICPL.STATUS in ('01','07','18')
			and (A_DATAENTRADAISC >= (Select AugustBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) 
			or  A_RETURNEDTOISC >= (Select AugustBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) )
			and (A_DATAENTRADAISC between (case when 1 =1 then (Select AugustBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) else  (Select JanuaryBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) end) and (case when 1 =1 then (Select DecemberEnd from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) else  (Select JulyEnd from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) end)
			or A_RETURNEDTOISC between (case when 1 =1 then (Select AugustBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) else  (Select JanuaryBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) end) and (case when 1 =1 then (Select DecemberEnd from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) else  (Select JulyEnd from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) end))
	)

and EAcompl.A_Emailing like @EmailLanguage



--===========================================================
--JANEIRO


Declare @SchooLYear as nvarchar(5)
Declare @EmailLanguage as nvarchar(15)

Set @SchoolYear = '15/16'
Set @EmailLanguage = '%'


Select Distinct
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.Email From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select PPessoa.Email From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as Email,
	EAcompl.A_Emailing
from ZFamilia
Inner Join EAlunos (NoLock) on (Ealunos.Matricula = ZFamilia.Matricula) 
Inner Join EACompl (NoLock) on (EACompl.Matricula = ZFamilia.Matricula)
where ZFamilia.Perletivo =@SchoolYear  and ZFamilia.Status in ('01','07','18')
and ZFAMILIA.MATRICULA in 
	(
			select 
				Matricula
			from UMATRICPL
			inner Join EACOMPL (NoLock) on (EAcompl.Matricula = UMatricpl.MatAluno)
			inner Join UMATRICPLLIVRE (NoLock) on (UMATRICPLLIVRE.PERLETIVO = UMATRICPL.PERLETIVO and UMATRICPLLIVRE.MATALUNO = UMATRICPL.MATALUNO and UMATRICPLLIVRE.GRADE= UMATRICPL.GRADE)
			where UMATRICPL.PERLETIVO =@SchoolYear
			and UMATRICPL.STATUS in ('01','07','18')
			and (A_DATAENTRADAISC >= (Select JanuaryBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) 
			or  A_RETURNEDTOISC >= (Select JanuaryBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) )
/*			and (A_DATAENTRADAISC between (case when 2 =1 then (Select JanuaryBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) else  (Select JanuaryBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) end) and (case when 1 =1 then (Select DecemberEnd from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) else  (Select JulyEnd from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) end)
			or A_RETURNEDTOISC between (case when 2 =1 then (Select JanuaryBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) else  (Select JanuaryBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) end) and (case when 1 =1 then (Select DecemberEnd from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) else  (Select JulyEnd from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) end))
*/
	)

and EAcompl.A_Emailing LIKE @EmailLanguage

union

Select Distinct
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select FCFO.Email From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select PPessoa.Email From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as Email, 
	EAcompl.A_Emailing
from ZFamilia
Inner Join EAlunos (NoLock) on (Ealunos.Matricula = ZFamilia.Matricula) 
Inner Join EACompl (NoLock) on (EACompl.Matricula = ZFamilia.Matricula)
where ZFamilia.Perletivo =@SchoolYear  and ZFamilia.Status in ('01','07','18')
and ZFAMILIA.MATRICULA in 
	(
			select 
				Matricula
			from UMATRICPL
			inner Join EACOMPL (NoLock) on (EAcompl.Matricula = UMatricpl.MatAluno)
			inner Join UMATRICPLLIVRE (NoLock) on (UMATRICPLLIVRE.PERLETIVO = UMATRICPL.PERLETIVO and UMATRICPLLIVRE.MATALUNO = UMATRICPL.MATALUNO and UMATRICPLLIVRE.GRADE= UMATRICPL.GRADE)
			where UMATRICPL.PERLETIVO =@SchoolYear
			and UMATRICPL.STATUS in ('01','07')
			and (A_DATAENTRADAISC >= (Select JanuaryBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) 
			or  A_RETURNEDTOISC >= (Select JanuaryBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) )
 /*			and (A_DATAENTRADAISC between (case when 2 =1 then (Select JanuaryBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) else  (Select JanuaryBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) end) and (case when 1 =1 then (Select DecemberEnd from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) else  (Select JulyEnd from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) end)
			or A_RETURNEDTOISC between (case when 2 =1 then (Select JanuaryBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) else  (Select JanuaryBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) end) and (case when 1 =1 then (Select DecemberEnd from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) else  (Select JulyEnd from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) end))
*/	)

and EAcompl.A_Emailing LIKE	@EmailLanguage

