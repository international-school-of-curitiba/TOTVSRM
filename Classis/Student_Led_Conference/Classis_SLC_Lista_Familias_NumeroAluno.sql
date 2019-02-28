Select distinct 
	Zfamilia.Nome,
	(Select Nome from PPessoa where codigo = Zfamilia.Pessoa1), 
	(Select Nome from PPessoa where codigo = Zfamilia.Pessoa2),
	(Select Count(Matricula) from VW_Info_Familia right Join Umatricpl (NoLock) on (UMatricpl.MatAluno = ZFamilia.Matricula and UMatricpl.Perletivo = '07/08') where VW_Info_Familia.Nome_Familia = Zfamilia.Nome and VW_Info_Familia.pessoa1= ZFamilia.pessoa1 and VW_Info_Familia.pessoa2 = Zfamilia.pessoa2 ) as Num_Filhos,
	EACompl.A_NomeReduzido,
	(Select top 1 '(' + UMATALUN.CODTUR + ')' from UMatAlun where UMatAlun.MatAluno = ZFamilia.Matricula and UMatAlun.Perletivo = '07/08' Group by UMatAlun.CodTur Order by count(UMatAlun.CodTur) desc) as Grade_Level,
	Zfamilia.Matricula,Umatricpl.CodCur, Umatricpl.CodPer, UMatricpl.Periodo
from Zfamilia 
inner join EAlunos (Nolock) on (Ealunos.Matricula = ZFamilia.Matricula)
inner join EACompl (Nolock) on (EACompl.Matricula = ZFamilia.Matricula)
inner Join Umatricpl (NoLock) on (UMatricpl.MatAluno = ZFamilia.Matricula and UMatricpl.Perletivo = '07/08')
where ZFamilia.Perletivo = '07/08'
and UmatricPL.CodCur < 3 
Order by Num_Filhos desc





