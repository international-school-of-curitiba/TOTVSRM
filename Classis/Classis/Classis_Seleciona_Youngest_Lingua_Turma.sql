/*
Select 	Distinct
	ZFamilia.Nome, 
	ZFamilia.Pessoa1, 
	ZFamilia.Pessoa2, 
	Count(ZFamilia.matricula),
	Case 
	When ZFamilia.Class_Pessoa1 = 'Pai' and ZFamilia.Class_Pessoa2 = 'Mãe' then
		(Select top 1 Ealunos.matricula from Ealunos, Eacompl where EAlunos.Matricula = EACompl.Matricula 
		and EAlunos.Pai = ZFamilia.Pessoa1
		and EAlunos.Mae = ZFamilia.Pessoa2
		and EACompl.A_Familia = ZFamilia.Nome Order by EAlunos.DtNasc desc)
	When ZFamilia.Class_Pessoa1 = 'Pai' and ZFamilia.Class_Pessoa2 = 'Responsável Financeiro' then
		(Select top 1 Ealunos.matricula from Ealunos, Eacompl where EAlunos.Matricula = EACompl.Matricula 
		and EAlunos.Pai = ZFamilia.Pessoa1
		and EAlunos.Respons = ZFamilia.Pessoa2
		and EACompl.A_Familia = ZFamilia.Nome Order by EAlunos.DtNasc desc)
	When ZFamilia.Class_Pessoa1 = 'Pai' and ZFamilia.Class_Pessoa2 = 'Responsável Acadêmico' then
		(Select top 1 Ealunos.matricula from Ealunos, Eacompl where EAlunos.Matricula = EACompl.Matricula 
		and EAlunos.Pai = ZFamilia.Pessoa1
		and EAlunos.RespAcad = ZFamilia.Pessoa2
		and EACompl.A_Familia = ZFamilia.Nome Order by EAlunos.DtNasc desc)
	End As Matricula
from ZFamilia (Nolock)
	Left Join EAlunos (NoLock) on (Ealunos.Matricula = ZFamilia.Matricula)
Where ZFamilia.Perletivo = '05/06'
Group by ZFamilia.Nome, ZFamilia.Pessoa1, ZFamilia.Class_Pessoa1, ZFamilia.Pessoa2, ZFamilia.Class_Pessoa2

*/

Select 	Distinct
	ZFamilia.Nome, 
	ZFamilia.Pessoa1, 
	ZFamilia.Pessoa2,
	(Select Count(ZYoungest.Matricula) from ZYoungest where ZYoungest.Pessoa1 = ZFamilia.Pessoa1 and ZYoungest.Pessoa2 = ZFamilia.Pessoa2) as Quantidade,
	(Select Top 1 ZYoungest.Matricula from ZYoungest where ZYoungest.Pessoa1 = ZFamilia.Pessoa1 and ZYoungest.Pessoa2 = ZFamilia.Pessoa2 Order by ZYoungest.DtNasc desc ) as Matricula,
	(Select Top 1 ZYoungest.NomeReduzido from ZYoungest where ZYoungest.Pessoa1 = ZFamilia.Pessoa1 and ZYoungest.Pessoa2 = ZFamilia.Pessoa2 Order by ZYoungest.DtNasc desc ) as NomeReduzido
from ZFamilia (Nolock)
	Left Join EAlunos (NoLock) on (Ealunos.Matricula = ZFamilia.Matricula)
Where ZFamilia.Perletivo = '05/06'
Group by ZFamilia.Nome, ZFamilia.Pessoa1, ZFamilia.Class_Pessoa1, ZFamilia.Pessoa2, ZFamilia.Class_Pessoa2

Select * from ZYoungest 

Create View ZYoungest as 
Select Distinct
	EAcompl.Matricula, 
	EAlunos.Nome as Nome,
	EACompl.A_NomeReduzido as NomeReduzido, 
	Case 
	When EACompl.A_Pessoa1= 'Pai' then Ealunos.Pai
	When EACompl.A_Pessoa1= 'Mãe' then Ealunos.Mae
	When EACompl.A_Pessoa1= 'Responsável Financeiro' then Ealunos.Respons
	When EACompl.A_Pessoa1= 'Responsável Acadêmico' then Ealunos.RespAcad
	Else '0'
	End as Pessoa1,
	Case
	When EACompl.A_Pessoa2= 'Pai' then Ealunos.Pai
	When EACompl.A_Pessoa2= 'Mãe' then Ealunos.Mae
	When EACompl.A_Pessoa2= 'Responsável Financeiro' then Ealunos.Respons
	When EACompl.A_Pessoa2= 'Responsável Acadêmico' then Ealunos.RespAcad
	Else '0'
	End as Pessoa2,
	EAcompl.A_EmailIng as Lingua,
	EAcompl.A_RecebeEMail,
	EAcompl.A_Publica,
	EACompl.A_Propaganda,
	EAlunos.DTNasc
from 	EAcompl (Nolock), Ealunos (nolock), UMatricPL (Nolock)
where	EAcompl.matricula = Ealunos.matricula
	and UMatricPL.Mataluno = Ealunos.matricula
	and UMatricPL.Perletivo = '05/06'
	and UMatricPL.status in ('01','07')
	and EACompl.A_Familia is not Null
