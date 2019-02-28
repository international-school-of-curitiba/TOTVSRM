Select Distinct
	ZFamilia.Nome,
	ZFamilia.Pessoa1, 
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.Nome From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select PPessoa.Nome From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)	
	End as Pessoa_Nome, 
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		''
	Else 
		(SELECT DESCRICAO FROM PCODNACAO 
		Inner Join PPessoa (NoLock) On (PPessoa.Codigo = ZFamilia.Pessoa1) 
		WHERE PPessoa.Nacionalidade = PCODNACAO.CODCLIENTE)
	End AS Nacionalidade,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		' '
	Else 
		(Select PPessoa.DtNascimento From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End DTNascimento,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.CGCCFO  From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select PPessoa.CPF From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as CPF,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		' '
	Else 
		(Select PPessoa.CartIdentidade From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as RG,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select CASE WHEN (FCFO.Complemento is null) THEN FCFO.Rua + ', ' + FCFO.Numero
	   		ELSE FCFO.Rua + ', ' + FCFO.Numero + ' - ' + FCFO.Complemento End
		From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select CASE WHEN (PPessoa.Complemento is null) THEN PPessoa.Rua + ', ' + PPessoa.Numero
	   		ELSE PPessoa.Rua + ', ' + PPessoa.Numero + ' - ' + PPessoa.Complemento End
		From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as Endereco1,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select Top 1 FCFO.Bairro + ' - ' + GMunicipio.NomeMunicipio + ' - ' + FCFO.CodEtd 
		From FCFO, GMunicipio Where GMunicipio.CodMunicipio = FCFO.CodMunicipio and FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select PPessoa.Bairro + ' - ' + PPessoa.Cidade + ' - ' + PPessoa.Estado From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as Endereco2,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.CEP From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select PPessoa.Cep From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as CEP,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.Telefone From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select PPessoa.Telefone1 From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as HomePhone,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		' '
	Else 
		(Select PPessoa.Telefone2 From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as CellPhone,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.Fax From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select PPessoa.Fax From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as FaxPhone,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.Email From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select PPessoa.Email From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as Email,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select CASE WHEN (FCFO.ComplementoPGTO is null) THEN FCFO.RuaPGTO + ', ' + FCFO.NumeroPGTO
	   		ELSE FCFO.RuaPGTO + ', ' + FCFO.NumeroPGTO + ' - ' + FCFO.ComplementoPGTO End
		From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select CASE WHEN (GEndereco.Complemento is null) THEN GEndereco.Rua + ', ' + GEndereco.Numero
		 ELSE GEndereco.Rua + ', ' + GEndereco.Numero + ' - ' + GEndereco.Complemento End
		 from GEndereco, PEndPessoa where GEndereco.IDEndereco = PEndPessoa.IDEndereco and PEndPessoa.Codpessoa = ZFamilia.Pessoa1) 
	End as End_Comercial1,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.BairroPGTO + ' - ' + FCFO.CidadePGTO + ' - ' + FCFO.CodEtdPGTO
		From FCFO  Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select GEndereco.Bairro + ' - ' + GEndereco.Cidade + ' - ' + GEndereco.Estado 
		 from GEndereco, PEndPessoa where GEndereco.IDEndereco = PEndPessoa.IDEndereco and PEndPessoa.Codpessoa = ZFamilia.Pessoa1) 
	End as End_Comercial2,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select  FCFO.CaixaPostalPagamento From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select GEndereco.CEP from GEndereco, PEndPessoa where GEndereco.IDEndereco = PEndPessoa.IDEndereco and PEndPessoa.Codpessoa = ZFamilia.Pessoa1) 
	End as End_ComercialCEP,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select  FCFO.TelefonePGTO From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select GEndereco.DDD + GEndereco.Telefone from GEndereco, PEndPessoa where GEndereco.IDEndereco = PEndPessoa.IDEndereco and PEndPessoa.Codpessoa = ZFamilia.Pessoa1) 
	End as End_ComercialTEL
from ZFamilia
Where ZFamilia.Pessoa1 in (Select Distinct Pessoa1 From ZFamilia where Perletivo= '05/06'and Status in ('01','07'))
Union
Select Distinct
	ZFamilia.Nome,
	ZFamilia.Pessoa2, 
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select FCFO.Nome From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select PPessoa.Nome From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)	
	End as Pessoa_Nome, 
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		''
	Else 
		(SELECT DESCRICAO FROM PCODNACAO 
		Inner Join PPessoa (NoLock) On (PPessoa.Codigo = ZFamilia.Pessoa2) 
		WHERE PPessoa.Nacionalidade = PCODNACAO.CODCLIENTE)
	End AS Nacionalidade,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		' '
	Else 
		(Select PPessoa.DtNascimento From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End DTNascimento,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select FCFO.CGCCFO  From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select PPessoa.CPF From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as CPF,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		' '
	Else 
		(Select PPessoa.CartIdentidade From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as RG,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select CASE WHEN (FCFO.Complemento is null) THEN FCFO.Rua + ', ' + FCFO.Numero
	   		ELSE FCFO.Rua + ', ' + FCFO.Numero + ' - ' + FCFO.Complemento End
		From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select CASE WHEN (PPessoa.Complemento is null) THEN PPessoa.Rua + ', ' + PPessoa.Numero
	   		ELSE PPessoa.Rua + ', ' + PPessoa.Numero + ' - ' + PPessoa.Complemento End
		From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as Endereco1,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select Top 1 FCFO.Bairro + ' - ' + GMunicipio.NomeMunicipio + ' - ' + FCFO.CodEtd 
		From FCFO, GMunicipio Where GMunicipio.CodMunicipio = FCFO.CodMunicipio and FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select PPessoa.Bairro + ' - ' + PPessoa.Cidade + ' - ' + PPessoa.Estado From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as Endereco2,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select FCFO.CEP From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select PPessoa.Cep From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as CEP,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select FCFO.Telefone From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select PPessoa.Telefone1 From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as HomePhone,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		' '
	Else 
		(Select PPessoa.Telefone2 From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as CellPhone,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select FCFO.Fax From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select PPessoa.Fax From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as FaxPhone,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select FCFO.Email From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select PPessoa.Email From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as Email,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select CASE WHEN (FCFO.ComplementoPGTO is null) THEN FCFO.RuaPGTO + ', ' + FCFO.NumeroPGTO
	   		ELSE FCFO.RuaPGTO + ', ' + FCFO.NumeroPGTO + ' - ' + FCFO.ComplementoPGTO End
		From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select CASE WHEN (GEndereco.Complemento is null) THEN GEndereco.Rua + ', ' + GEndereco.Numero
		 ELSE GEndereco.Rua + ', ' + GEndereco.Numero + ' - ' + GEndereco.Complemento End
		 from GEndereco, PEndPessoa where GEndereco.IDEndereco = PEndPessoa.IDEndereco and PEndPessoa.Codpessoa = ZFamilia.Pessoa2) 
	End as End_Comercial1,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select FCFO.BairroPGTO + ' - ' + FCFO.CidadePGTO + ' - ' + FCFO.CodEtdPGTO
		From FCFO  Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select GEndereco.Bairro + ' - ' + GEndereco.Cidade + ' - ' + GEndereco.Estado 
		 from GEndereco, PEndPessoa where GEndereco.IDEndereco = PEndPessoa.IDEndereco and PEndPessoa.Codpessoa = ZFamilia.Pessoa2) 
	End as End_Comercial2,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select  FCFO.CaixaPostalPagamento From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select GEndereco.CEP from GEndereco, PEndPessoa where GEndereco.IDEndereco = PEndPessoa.IDEndereco and PEndPessoa.Codpessoa = ZFamilia.Pessoa2) 
	End as End_ComercialCEP,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select  FCFO.TelefonePGTO From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select GEndereco.DDD + GEndereco.Telefone from GEndereco, PEndPessoa where GEndereco.IDEndereco = PEndPessoa.IDEndereco and PEndPessoa.Codpessoa = ZFamilia.Pessoa2) 
	End as End_ComercialTEL
from ZFamilia
Where ZFamilia.Pessoa2 in (Select Distinct Pessoa2 From ZFamilia where Perletivo= '05/06'and Status in ('01','07'))
