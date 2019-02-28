Select distinct
		ZFamilia.Nome,
		EACompl.A_NomeIng, 
		EAlunos.DTNasc    
from EACompl(NoLock), EAlunos(NoLock), UMatricPL(NoLock), ZFamilia(NoLock)
where
	UMatricpl.PerLetivo = '05/06' 
	and UMatricpl.Status in ('01','07') 
	and UMatricpl.CodCur = '1'
	and UMatricpl.CodPer = '1' 
	and EACompl.Matricula = EALunos.Matricula 
	and EACompl.Matricula = UMatricPL.MatAluno 
	and ZFamilia.Nome = EACompl.A_Familia 
	and ZFamilia.Pessoa1 = EACompl.A_CodPessoa1 
	and ZFamilia.Pessoa2 = EACompl.A_CodPessoa2
Group by ZFamilia.Nome,
		 EACompl.A_NomeIng,
		 EAlunos.DTNasc
Order by ZFamilia.Nome, Ealunos.DTNasc desc