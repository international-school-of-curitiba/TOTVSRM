Select distinct 
	Zfamilia.Nome, 
	
	Case
	when (ZFamilia.Class_Pessoa1 = 'Pai' or ZFamilia.Class_Pessoa1 = 'Responsável Acadêmico')  and (Select Top 1 PVivo from Ealunos where EAlunos.Pai = ZFamilia.Pessoa1) = 'S' then
		(Select PPessoa.Nome From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)	
	when (ZFamilia.Class_Pessoa1 = 'Mãe' or ZFamilia.Class_Pessoa1 = 'Responsável Acadêmico')  and	(Select Top 1 MViva from Ealunos where EAlunos.Mae = ZFamilia.Pessoa1) = 'S' then
		(Select PPessoa.Nome From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	When ZFamilia.Class_Pessoa1 = 'Responsável Financeiro' then
		(Select FCFO.Nome From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	End as 'Pessoa1 e Viva',

	Case
	when (ZFamilia.Class_Pessoa2 = 'Pai' or ZFamilia.Class_Pessoa2 = 'Responsável Acadêmico') and (Select Top 1 PVivo from Ealunos where EAlunos.Pai = ZFamilia.Pessoa2) = 'S' then
		(Select PPessoa.Nome From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)	
	when (ZFamilia.Class_Pessoa2 = 'Mãe' or ZFamilia.Class_Pessoa2 = 'Responsável Acadêmico') and	(Select Top 1 MViva from Ealunos where EAlunos.Mae = ZFamilia.Pessoa2) = 'S' then
		(Select PPessoa.Nome From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	When ZFamilia.Class_Pessoa2 = 'Responsável Financeiro' then
		(Select FCFO.Nome From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	End as 'Pessoa2 e Viva',
	ZFamilia.Lingua

from Zfamilia
where Perletivo = '06/07'
and Zfamilia.Status in ('01', '07')
order by ZFAmilia.Nome