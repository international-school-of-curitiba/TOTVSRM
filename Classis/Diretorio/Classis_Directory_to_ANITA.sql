Select Distinct
	Substring(ZFamilia.Nome,1, len(ZFamilia.Nome)) as Nome_Familia,
	A_PUBLICA,
	rtrim(EACompl.A_NomeReduzido)as Nome,
	(Select top 1 '(' + UMATALUN.CODTUR + ')' from UMatAlun where UMatAlun.MatAluno = EAlunos.Matricula and UMatAlun.Perletivo =ZFamilia.Perletivo  Group by UMatAlun.CodTur Order by count(UMatAlun.CodTur) desc) as Grade_Level,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.Nome From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select Case when PPessoa.Apelido is null then PPessoa.Nome  when substring(PPessoa.Apelido,1,4) = 'Mr.' then PPessoa.Nome else PPessoa.Apelido end From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)	
	End as Nome_Pessoa1, 
/*	Case 
	When ZFamilia.Class_Pessoa1= 'Pai' then
		(Select rtrim(EACOMPL.A_NACIONALPAI) From EACOMPL Where  EACOMPL.MATRICULA = ZFAMILIA.MATRICULA)
	When ZFamilia.Class_Pessoa1= 'Mae' then
		(Select rtrim(EACOMPL.A_NACIONALMAE) From EACOMPL Where  EACOMPL.MATRICULA = ZFAMILIA.MATRICULA) 
	When ZFamilia.Class_Pessoa1= 'Responsável Academico' then
		(Select rtrim(EACOMPL.A_NACIONALPAI) From EACOMPL Where  EACOMPL.MATRICULA = ZFAMILIA.MATRICULA)
    End as Nacionalidade1,
*/
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.Email From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select PPessoa.Email From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as Email_Pessoa1,
	
/*	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.Telefone From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select '(' + Substring(PPessoa.Telefone1,1,2) + ')' +
				Substring(PPessoa.Telefone1,3,4) + '-' +
				Substring(PPessoa.Telefone1,7,4)
		 From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as HomePhone_Pessoa1, */
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		' '
	Else 
		(Select '(' + Substring(PPessoa.Telefone2,1,2) + ')' +
				Substring(PPessoa.Telefone2,3,4) + '-' +
				Substring(PPessoa.Telefone2,7,4) 
		From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as CellPhone_Pessoa1,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.Fax From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select '(' + Substring(PPessoa.Telefone3,1,2) + ')' +
				Substring(PPessoa.Telefone3,3,4) + '-' +
				Substring(PPessoa.Telefone3,7,4) 
		From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as WORKPhone_Pessoa1,

	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select FCFO.Nome From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select Case when PPessoa.Apelido is null then PPessoa.Nome  when substring(PPessoa.Apelido,1,4) = 'Ms.' then PPessoa.Nome else PPessoa.Apelido end From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)	
	End as Nome_Pessoa2, 
/*	Case 
	When ZFamilia.Class_Pessoa2= 'Pai' then
		(Select rtrim(EACOMPL.A_NACIONALPAI) From EACOMPL Where  EACOMPL.MATRICULA = ZFAMILIA.MATRICULA)
	When ZFamilia.Class_Pessoa2= 'Mae' then
		(Select rtrim(EACOMPL.A_NACIONALMAE) From EACOMPL Where  EACOMPL.MATRICULA = ZFAMILIA.MATRICULA) 
	When ZFamilia.Class_Pessoa2= 'Responsável Academico' then
		(Select rtrim(EACOMPL.A_NACIONALPAI) From EACOMPL Where  EACOMPL.MATRICULA = ZFAMILIA.MATRICULA)
    End as Nacionalidade2,
*/	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select FCFO.Email From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select PPessoa.Email From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as Email_Pessoa2, 
/*	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select FCFO.Telefone From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select '(' + Substring(PPessoa.Telefone1,1,2) + ')' +
				Substring(PPessoa.Telefone1,3,4) + '-' +
				Substring(PPessoa.Telefone1,7,4) 		
		From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as HomePhone_Pessoa2, */
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		' '
	Else 
		(Select '(' + Substring(PPessoa.Telefone2,1,2) + ')' +
				Substring(PPessoa.Telefone2,3,4) + '-' +
				Substring(PPessoa.Telefone2,7,4) 
		From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as CellPhone_Pessoa2,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select FCFO.Fax From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select '(' + Substring(PPessoa.Fax,1,2) + ')' +
				Substring(PPessoa.Telefone3,3,4) + '-' +
				Substring(PPessoa.Telefone3,7,4) 
	From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as WORKPhone_Pessoa2,
	Case 
	when EAlunos.CompEndAl is null then 
		EAlunos.EndAluno + ', '+ EAlunos.NumEndAlun
	Else
		EAlunos.EndAluno + ', '+ EAlunos.NumEndAlun + ' - ' + EAlunos.CompEndAl  
	End as Endereco,
	Case 
	when Ealunos.BairroAlun is null then
		EAlunos.CidAluno + ' - ' + EAlunos.UFAluno
	else
		Ealunos.BairroAlun +' - ' + EAlunos.CidAluno + ' - ' + EAlunos.UFAluno
	end as Complemento,
	EAlunos.CepAluno,
	EAlunos.TelAluno as HomePhone,
	Zfamilia.Matricula,
	A_DATAENTRADAISC, EACOMPL.A_RETURNEDTOISC, CODCUR, CODPER, PERIODO
from ZFamilia
Inner Join EAlunos (NoLock) on (Ealunos.Matricula = ZFamilia.Matricula) 
Inner Join EACompl (NoLock) on (EACompl.Matricula = ZFamilia.Matricula)
Join UMatricpl (NoLock) on (UMatricpl.Perletivo = ZFamilia.Perletivo and UMatricpl.MatAluno = ZFamilia.Matricula)
where ZFamilia.Perletivo = '14/15'  and ZFamilia.Status in ('01','07')
--and (EAcompl.A_DataEntradaISC >= '01/01/2011' or EACOMPL.A_RETURNEDTOISC >= '01/01/2011')
--and UMatricpl.DataMat >= '08/01/2009'
--Order by EACOMPL.A_RETURNEDTOISC, A_DATAENTRADAISC,  EACompl.A_NomeReduzido
Order by grade_level, Nome_Familia
/*
Select distinct 
	Zfamilia.Nome,
	Zfamilia.Pessoa1, 
	Zfamilia.Pessoa2,
	(Select Count(Matricula) from VW_Info_Familia where VW_Info_Familia.Nome_Familia = Zfamilia.Nome and VW_Info_Familia.pessoa1= ZFamilia.pessoa1 and VW_Info_Familia.pessoa2 = Zfamilia.pessoa2) as Num_Filhos,
	Zfamilia.Matricula,Umatricpl.CodCur, Umatricpl.CodPer, UMatricpl.Periodo,
	EACompl.A_NomeReduzido,
	(Select top 1 '(' + UMATALUN.CODTUR + ')' from UMatAlun where UMatAlun.MatAluno = ZFamilia.Matricula and UMatAlun.Perletivo = '06/07' Group by UMatAlun.CodTur Order by count(UMatAlun.CodTur) desc) as Grade_Level
from Zfamilia 
inner join EAlunos (Nolock) on (Ealunos.Matricula = ZFamilia.Matricula)
inner join EACompl (Nolock) on (EACompl.Matricula = ZFamilia.Matricula)
inner Join Umatricpl (NoLock) on (UMatricpl.MatAluno = ZFamilia.Matricula and UMatricpl.Perletivo = '06/07')
where ZFamilia.Perletivo = '06/07' 
Order by Num_Filhos desc

*/ 