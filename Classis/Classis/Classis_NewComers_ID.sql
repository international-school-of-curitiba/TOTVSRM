Exec UPDATE_ZFAMILIA
Select  Umatricpl.MatAluno as Matricula_$$,
	(Select top 1 Umatalun.CodTur from UMatAlun where EAlunos.matricula = UMatAlun.MatAluno) as Grade_Level,
	Ealunos.Nome, Ealunos.DtNasc,
	DateDiff(yy, Ealunos.DtNasc, GETDATE()) -
		(case when (datepart(m, Ealunos.DtNasc) > datepart(m, GetDate())) or
			(datepart(m, Ealunos.DtNasc) = datepart(m, Getdate()) And 
			 datepart(d, Ealunos.DtNasc) > datepart(d, Getdate()))
			 then 1
	  		 else 0
		end) 
	as Idade,
	Case When EACompl.A_Nacional3 is null and EACompl.A_Nacional2 is null then EACompl.A_Nacional1
		When EACompl.A_Nacional3 is null and EACompl.A_Nacional2 is not null then EACompl.A_Nacional1 + '/'+ EACompl.A_Nacional2
		When EACompl.A_Nacional3 is not null and EACompl.A_Nacional2 is not null then EACompl.A_Nacional1 + '/'+ EACompl.A_Nacional2 + '/' + Eacompl.A_Nacional3
		end as Nationality,
	EACompl.A_LinguaCasa, 
	Case when ZFamilia.Class_Pessoa1 = 'Pai' then 'Father'
	when ZFamilia.Class_Pessoa1 = 'Mãe' then 'Mother'
	else 'Responsable' end as Class_Pessoa1,
	ZFamilia.Pessoa1,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.Nome From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select PPessoa.Nome From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)	
	End as Nome_Pessoa1, 
	EAcompl.A_NacionalPai,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select CASE WHEN (FCFO.Complemento is null) THEN FCFO.Rua + ', ' + FCFO.Numero
	   		ELSE FCFO.Rua + ', ' + FCFO.Numero + ' - ' + FCFO.Complemento End
		From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select CASE WHEN (PPessoa.Complemento is null) THEN PPessoa.Rua + ', ' + PPessoa.Numero
	   		ELSE PPessoa.Rua + ', ' + PPessoa.Numero + ' - ' + PPessoa.Complemento End
		From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as Endereco1_Pessoa1,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select Top 1 FCFO.Bairro + ' - ' + GMunicipio.NomeMunicipio + ' - ' + FCFO.CodEtd
		From FCFO, GMunicipio Where GMunicipio.CodMunicipio = FCFO.CodMunicipio and FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)) and GMunicipio.CodETDMunicipio = FCFO.CODETD)
	Else 
		(Select PPessoa.Bairro + ' - ' + PPessoa.Cidade + ' - ' + PPessoa.Estado From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as Endereco2_Pessoa1,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.CEP From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select PPessoa.Cep From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as CEP_Pessoa1,
		Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.Telefone From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select PPessoa.Telefone1 From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as HomePhone_Pessoa1,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		' '
	Else 
		(Select PPessoa.Telefone2 From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as CellPhone_Pessoa1,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.Fax From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select PPessoa.Fax From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as FaxPhone_Pessoa1,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.Email From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select PPessoa.Email From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as Email_Pessoa1,
	Case when ZFamilia.Class_Pessoa2 = 'Pai' then 'Father'
	when ZFamilia.Class_Pessoa2 = 'Mãe' then 'Mother'
	else 'Responsable' end as Class_Pessoa2,
	ZFamilia.Pessoa2,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select FCFO.Nome From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select PPessoa.Nome From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)	
	End as Nome_Pessoa2, 
	EAcompl.A_NacionalMae,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select CASE WHEN (FCFO.Complemento is null) THEN FCFO.Rua + ', ' + FCFO.Numero
	   		ELSE FCFO.Rua + ', ' + FCFO.Numero + ' - ' + FCFO.Complemento End
		From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select CASE WHEN (PPessoa.Complemento is null) THEN PPessoa.Rua + ', ' + PPessoa.Numero
	   		ELSE PPessoa.Rua + ', ' + PPessoa.Numero + ' - ' + PPessoa.Complemento End
		From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as Endereco1_Pessoa2,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select Top 1 FCFO.Bairro + ' - ' + GMunicipio.NomeMunicipio + ' - ' + FCFO.CodEtd
		From FCFO, GMunicipio Where GMunicipio.CodMunicipio = FCFO.CodMunicipio and FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)) and GMunicipio.CodETDMunicipio = FCFO.CODETD)
	Else 
		(Select PPessoa.Bairro + ' - ' + PPessoa.Cidade + ' - ' + PPessoa.Estado From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as Endereco2_Pessoa2,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select FCFO.CEP From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select PPessoa.Cep From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as CEP_Pessoa2,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select FCFO.Telefone From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select PPessoa.Telefone1 From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as HomePhone_Pessoa2,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		' '
	Else 
		(Select PPessoa.Telefone2 From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as CellPhone_Pessoa2,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select FCFO.Fax From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select PPessoa.Fax From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as FaxPhone_Pessoa2,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select FCFO.Email From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select PPessoa.Email From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as Email_Pessoa2,
	UMatricPl.CodPer,
	(Select Top 1 Case when CodMat is not null then 'ESL' Else ' ' end  from UMatAlun where UMatAlun.CodMat like '%ESL' and UMatAlun.MatAluno = UmatricPl.MatAluno)as ESL,
	(Select Top 1 Case when CodMat is not null then '/PSL' Else ' ' end  from UMatAlun where UMatAlun.CodMat like '%PSL' and UMatAlun.MatAluno = UmatricPl.MatAluno)as PSL
from Umatricpl 
Inner Join Ealunos (Nolock) on (EAlunos.Matricula  = UMatricPl.MatAluno)
Inner Join EACompl (Nolock) on  (EAcompl.matricula = UMatricPl.MatAluno)
Inner Join ZFamilia (NoLock) on (ZFamilia.Matricula = UMatricPl.MatAluno)
Where Umatricpl.MatAluno in (Select Umatricpl.MatAluno
				from Umatricpl 
				Inner Join UAluCurso (NoLock) on (UAlucurso.MatAluno = UmatricPl.MatAluno)
				where Umatricpl.status in ('01','14','07','04', '06') and UAlucurso.Status in ('01','07','04', '06')
				Group by Umatricpl.MatAluno
				Having Count(Umatricpl.Perletivo) < 2 and Count(UAlucurso.CodPer) < 2
				)
Order By Ealunos.Nome




