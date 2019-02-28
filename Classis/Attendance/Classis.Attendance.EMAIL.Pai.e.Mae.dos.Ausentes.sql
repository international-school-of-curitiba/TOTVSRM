Select
A_NOMEREDUZIDO, A_EMAILING, A_PESSOA1,
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.Nome From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select Case when PPessoa.Apelido is null then PPessoa.Nome  when substring(PPessoa.Apelido,1,4) = 'Mr.' then PPessoa.Nome else PPessoa.Apelido end From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)	
	End as Nome_Pessoa1, 
	
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.Email From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select PPessoa.Email From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as Email_Pessoa1,
	
	A_PESSOA2, 
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select FCFO.Nome From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select Case when PPessoa.Apelido is null then PPessoa.Nome  when substring(PPessoa.Apelido,1,4) = 'Ms.' then PPessoa.Nome else PPessoa.Apelido end From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)	
	End as Nome_Pessoa2, 
	
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.Email From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select PPessoa.Email From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as Email_Pessoa2

 
from EALUOCOR 
Inner join EACOMPL (NoLock) on (EACOMPL.MATRICULA = EALUOCOR.MATALUNO)
Inner join ZFamilia (Nolock) on (ZFamilia.PERLETIVO = EALuocor.Codperlet and ZFamilia.Matricula = EALUOCOR.MATALUNO)
where CODPERLET = '10/11'
and Ealuocor.DATA = '02/18/2011'
order by A_EMAILING, A_NOMEING