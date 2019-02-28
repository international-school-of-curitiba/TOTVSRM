
--Create View VW_Info_Familia AS
Select Distinct
	ZFamilia.Nome as Nome_Familia,
	ZFamilia.Pessoa1, 
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.Nome From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select PPessoa.Nome From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)	
	End as Nome_Pessoa1, 
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		''
	Else 
		(SELECT DESCRICAO FROM PCODNACAO 
		Inner Join PPessoa (NoLock) On (PPessoa.Codigo = ZFamilia.Pessoa1) 
		WHERE PPessoa.Nacionalidade = PCODNACAO.CODCLIENTE)
	End AS Nacionalidade_Pessoa1,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.DTNascimento From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select PPessoa.DtNascimento From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End DTNascimento_Pessoa1,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.CGCCFO  From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select Substring(PPessoa.CPF,1,3)+ '.' + Substring(PPessoa.CPF,4,3)+ '.'+ Substring(PPessoa.CPF,7,3)+ '-' + Substring(PPessoa.CPF,10,2) From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as CPF_Pessoa1,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		' '
	Else 
		(Select PPessoa.CartIdentidade From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as RG_Pessoa1,
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
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select CASE WHEN (FCFO.ComplementoPGTO is null) THEN FCFO.RuaPGTO + ', ' + FCFO.NumeroPGTO
	   		ELSE FCFO.RuaPGTO + ', ' + FCFO.NumeroPGTO + ' - ' + FCFO.ComplementoPGTO End
		From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select CASE WHEN (GEndereco.Complemento is null) THEN GEndereco.Rua + ', ' + GEndereco.Numero
		 ELSE GEndereco.Rua + ', ' + GEndereco.Numero + ' - ' + GEndereco.Complemento End
		 from GEndereco, PEndPessoa where GEndereco.IDEndereco = PEndPessoa.IDEndereco and PEndPessoa.Codpessoa = ZFamilia.Pessoa1) 
	End as End_Comercial1_Pessoa1,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.BairroPGTO + ' - ' + FCFO.CidadePGTO + ' - ' + FCFO.CodEtdPGTO
		From FCFO  Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select GEndereco.Bairro + ' - ' + GEndereco.Cidade + ' - ' + GEndereco.Estado 
		 from GEndereco, PEndPessoa where GEndereco.IDEndereco = PEndPessoa.IDEndereco and PEndPessoa.Codpessoa = ZFamilia.Pessoa1) 
	End as End_Comercial2_Pessoa1,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select  FCFO.CaixaPostalPagamento From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select GEndereco.CEP from GEndereco, PEndPessoa where GEndereco.IDEndereco = PEndPessoa.IDEndereco and PEndPessoa.Codpessoa = ZFamilia.Pessoa1) 
	End as End_ComercialCEP_Pessoa1,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select  FCFO.TelefonePGTO From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select GEndereco.DDD + GEndereco.Telefone from GEndereco, PEndPessoa where GEndereco.IDEndereco = PEndPessoa.IDEndereco and PEndPessoa.Codpessoa = ZFamilia.Pessoa1) 
	End as End_ComercialTEL_Pessoa1,
	ZFamilia.Pessoa2, 


	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select FCFO.Nome From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select PPessoa.Nome From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)	
	End as Nome_Pessoa2, 
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		''
	Else 
		(SELECT DESCRICAO FROM PCODNACAO 
		Inner Join PPessoa (NoLock) On (PPessoa.Codigo = ZFamilia.Pessoa2) 
		WHERE PPessoa.Nacionalidade = PCODNACAO.CODCLIENTE)
	End AS Nacionalidade_Pessoa2,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select FCFO.DTNascimento From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select PPessoa.DtNascimento From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End DTNascimento_Pessoa2,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select FCFO.CGCCFO  From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select Substring(PPessoa.CPF,1,3)+ '.' + Substring(PPessoa.CPF,4,3)+ '.'+ Substring(PPessoa.CPF,7,3)+ '-' + Substring(PPessoa.CPF,10,2) From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as CPF_Pessoa2,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		' '
	Else 
		(Select PPessoa.CartIdentidade From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as RG_Pessoa2,
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
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select CASE WHEN (FCFO.ComplementoPGTO is null) THEN FCFO.RuaPGTO + ', ' + FCFO.NumeroPGTO
	   		ELSE FCFO.RuaPGTO + ', ' + FCFO.NumeroPGTO + ' - ' + FCFO.ComplementoPGTO End
		From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select CASE WHEN (GEndereco.Complemento is null) THEN GEndereco.Rua + ', ' + GEndereco.Numero
		 ELSE GEndereco.Rua + ', ' + GEndereco.Numero + ' - ' + GEndereco.Complemento End
		 from GEndereco, PEndPessoa where GEndereco.IDEndereco = PEndPessoa.IDEndereco and PEndPessoa.Codpessoa = ZFamilia.Pessoa2) 
	End as End_Comercial1_Pessoa2,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select FCFO.BairroPGTO + ' - ' + FCFO.CidadePGTO + ' - ' + FCFO.CodEtdPGTO
		From FCFO  Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select GEndereco.Bairro + ' - ' + GEndereco.Cidade + ' - ' + GEndereco.Estado 
		 from GEndereco, PEndPessoa where GEndereco.IDEndereco = PEndPessoa.IDEndereco and PEndPessoa.Codpessoa = ZFamilia.Pessoa2) 
	End as End_Comercial2_Pessoa2,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select  FCFO.CaixaPostalPagamento From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select GEndereco.CEP from GEndereco, PEndPessoa where GEndereco.IDEndereco = PEndPessoa.IDEndereco and PEndPessoa.Codpessoa = ZFamilia.Pessoa2) 
	End as End_ComercialCEP_Pessoa2,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select  FCFO.TelefonePGTO From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select GEndereco.DDD + GEndereco.Telefone from GEndereco, PEndPessoa where GEndereco.IDEndereco = PEndPessoa.IDEndereco and PEndPessoa.Codpessoa = ZFamilia.Pessoa2) 
	End as End_ComercialTEL_Pessoa2
	--Zfamilia.Matricula
from ZFamilia 
where ZFamilia.Perletivo = '08/09'
and ZFamilia.Lingua = 'ENGLISH'
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