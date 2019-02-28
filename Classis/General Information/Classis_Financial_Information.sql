Select  Distinct 
	ZFamilia.Nome, ZFamilia.Pessoa1, 
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
		(Select 
			Case when (PPessoa.EstadoCivil='C') then 'Casado'
			when (PPessoa.EstadoCivil='I') then 'Divorciado' 
			when (PPessoa.EstadoCivil='D') then 'Desquitado' 
			when (PPessoa.EstadoCivil='S') then 'Solteiro' 
			when (PPessoa.EstadoCivil='V') then 'Viúvo'
			when (PPessoa.EstadoCivil='O') then 'Outros' End
		 From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)	
	End as EstadoCivil1, 
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		' '
	Else 
		(Select PPessoa.CartIdentidade From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)	
	End as RG1,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		' '
	Else 
		(Select PPessoa.CPF From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)	
	End as CPF1,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select CASE WHEN (FCFO.Complemento is null) THEN FCFO.Rua + ', ' + FCFO.Numero
	   		ELSE FCFO.Rua + ', ' + FCFO.Numero + ' - ' + FCFO.Complemento End
		From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select CASE WHEN (PPessoa.Complemento is null) THEN PPessoa.Rua + ', ' + PPessoa.Numero
	   		ELSE PPessoa.Rua + ', ' + PPessoa.Numero + ' - ' + PPessoa.Complemento End
		From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as Endereco11,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select Top 1 FCFO.Bairro + ' - ' + GMunicipio.NomeMunicipio + ' - ' + FCFO.CodEtd 
		From FCFO, GMunicipio Where GMunicipio.CodMunicipio = FCFO.CodMunicipio and FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select PPessoa.Bairro + ' - ' + PPessoa.Cidade + ' - ' + PPessoa.Estado From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as Endereco12,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.CEP From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select PPessoa.Cep From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as CEP1,
	ZFamilia.Pessoa2,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select FCFO.Nome From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select PPessoa.Nome From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)	
	End as Pessoa_Nome2, 
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		''
	Else 
		(SELECT DESCRICAO FROM PCODNACAO 
		Inner Join PPessoa (NoLock) On (PPessoa.Codigo = ZFamilia.Pessoa2) 
		WHERE PPessoa.Nacionalidade = PCODNACAO.CODCLIENTE)
	End AS Nacionalidade2,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		' '
	Else 
		(Select 
			Case when (PPessoa.EstadoCivil='C') then 'Casado'
			when (PPessoa.EstadoCivil='I') then 'Divorciado' 
			when (PPessoa.EstadoCivil='D') then 'Desquitado' 
			when (PPessoa.EstadoCivil='S') then 'Solteiro' 
			when (PPessoa.EstadoCivil='V') then 'Viúvo'
			when (PPessoa.EstadoCivil='O') then 'Outros' End
		 From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)	
	End as EstadoCivil2,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		' '
	Else 
		(Select PPessoa.CartIdentidade From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)	
	End as RG2,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		' '
	Else 
		(Select PPessoa.CPF From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)	
	End as CPF2,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select CASE WHEN (FCFO.Complemento is null) THEN FCFO.Rua + ', ' + FCFO.Numero
	   		ELSE FCFO.Rua + ', ' + FCFO.Numero + ' - ' + FCFO.Complemento End
		From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select CASE WHEN (PPessoa.Complemento is null) THEN PPessoa.Rua + ', ' + PPessoa.Numero
	   		ELSE PPessoa.Rua + ', ' + PPessoa.Numero + ' - ' + PPessoa.Complemento End
		From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as Endereco21,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select Top 1 FCFO.Bairro + ' - ' + GMunicipio.NomeMunicipio + ' - ' + FCFO.CodEtd 
		From FCFO, GMunicipio Where GMunicipio.CodMunicipio = FCFO.CodMunicipio and FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select PPessoa.Bairro + ' - ' + PPessoa.Cidade + ' - ' + PPessoa.Estado From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as Endereco22,
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select FCFO.CEP From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select PPessoa.Cep From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as CEP2,
	 (Select Ealunos.Nome from Ealunos where Ealunos.Matricula = ZFamilia.Matricula)
From ZFamilia
Where ZFamilia.Perletivo = '05/06'
and ZFamilia.Status in ('01','07') 
Order by ZFamilia.Nome

Select Nome, Matricula, (Select Ealunos.Nome from Ealunos where Ealunos.Matricula = ZFamilia.Matricula),
(Select Umatricpl.CodCur from Umatricpl where Umatricpl.Mataluno = ZFamilia.Matricula),
(Select Umatricpl.CodPer from Umatricpl where Umatricpl.Mataluno = ZFamilia.Matricula),
(Select Umatricpl.Periodo + 1  from Umatricpl where Umatricpl.Mataluno = ZFamilia.Matricula)
From ZFamilia
Where ZFamilia.Perletivo = '05/06'
and ZFamilia.Status in ('01','07') 
Order by ZFamilia.Nome