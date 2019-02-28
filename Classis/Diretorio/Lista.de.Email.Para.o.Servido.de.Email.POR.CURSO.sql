Declare @SchooLYear as nvarchar(5)
Declare @EmailLanguage as nvarchar(15)

Set @SchoolYear = '15/16'
Set @EmailLanguage = '%'


Select Distinct
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.NOME From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select PPessoa.NOME From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as Nome,

	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.Email From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select PPessoa.Email From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as Email,
	EAcompl.A_Emailing,
	(SELECT TOP 1 UMAT2.CODTUR FROM UMATALUN UMAT2 WHERE UMAT2.STATUS IN('01','07','04') AND UMAT2.MATALUNO = EALUNOS.MATRICULA AND UMAT2.PERLETIVO = UMatricPL.PerLetivo GROUP BY UMAT2.CODTUR ORDER BY COUNT(UMAT2.CODTUR) DESC)as Classlist

from ZFamilia
Inner Join EAlunos (NoLock) on (Ealunos.Matricula = ZFamilia.Matricula) 
Inner Join EACompl (NoLock) on (EACompl.Matricula = ZFamilia.Matricula)
inner join UMatricpl (NoLock) on (Ealunos.Matricula = Umatricpl.MataLuno and Umatricpl.Perletivo =  ZFamilia.Perletivo)
where ZFamilia.Perletivo =@SchoolYear  and ZFamilia.Status in ('01','07')
and EAcompl.A_Emailing like @EmailLanguage
--and ZFAMILIA.CLASS_PESSOA1 = 'MAE'
and UMATRICPL.CODCUR = 2 and UMATRICPL.CODPER = 1 and UMATRICPL.PERIODO between 1 and 5

union

Select Distinct
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select FCFO.NOME From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select PPessoa.NOME From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as Nome, 

	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select FCFO.Email From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select PPessoa.Email From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as Email, 
	EAcompl.A_Emailing,
	(SELECT TOP 1 UMAT2.CODTUR FROM UMATALUN UMAT2 WHERE UMAT2.STATUS IN('01','07','04') AND UMAT2.MATALUNO = EALUNOS.MATRICULA AND UMAT2.PERLETIVO = UMatricPL.PerLetivo GROUP BY UMAT2.CODTUR ORDER BY COUNT(UMAT2.CODTUR) DESC)as Classlist
from ZFamilia
Inner Join EAlunos (NoLock) on (Ealunos.Matricula = ZFamilia.Matricula) 
Inner Join EACompl (NoLock) on (EACompl.Matricula = ZFamilia.Matricula)
inner join UMatricpl (NoLock) on (Ealunos.Matricula = Umatricpl.MataLuno and Umatricpl.Perletivo =  ZFamilia.Perletivo )
where ZFamilia.Perletivo =@SchoolYear  and ZFamilia.Status in ('01','07')
and EAcompl.A_Emailing like @EmailLanguage
--and ZFAMILIA.CLASS_PESSOA2 = 'MAE'
and UMATRICPL.CODCUR = 2 and UMATRICPL.CODPER = 1 and UMATRICPL.PERIODO between 1 and 5
order by ClassList, A_EMAILING

