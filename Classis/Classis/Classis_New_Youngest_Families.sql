/*
-- Drop View VW_Family
-- Go
-- Create Table ly as
Select Distinct
	EACompl.A_Familia as Family, 
	Case 
	When EACompl.A_Pessoa1= 'Pai' then Ealunos.Pai
	When EACompl.A_Pessoa1= 'Mãe' then Ealunos.Mae
	When EACompl.A_Pessoa1= 'Responsável Financeiro' then Ealunos.Respons
	When EACompl.A_Pessoa1= 'Responsável Acadêmico' then Ealunos.RespAcad
	Else '0'
	End as Pessoa1,
	EACompl.A_Pessoa1 as Tipo_Pessoa1,
	Case
	When EACompl.A_Pessoa2= 'Pai' then Ealunos.Pai
	When EACompl.A_Pessoa2= 'Mãe' then Ealunos.Mae
	When EACompl.A_Pessoa2= 'Responsável Financeiro' then Ealunos.Respons
	When EACompl.A_Pessoa2= 'Responsável Acadêmico' then Ealunos.RespAcad
	Else '0'
	End as Pessoa2,
	EACompl.A_Pessoa2 as Tipo_Pessoa2,
	EAcompl.A_EmailIng as Lingua,
	EAcompl.A_RecebeEMail,
	EAcompl.A_Publica,
	EACompl.A_Propaganda
from 	EAcompl (Nolock), Ealunos (nolock), UMatricPL (Nolock)
where	EAcompl.matricula = Ealunos.matricula
	and UMatricPL.Mataluno = Ealunos.matricula
	and UMatricPL.Perletivo = '05/06'
	and UMatricPL.status in ('01','07')
	and EACompl.A_Familia is not Null
*/


Select Distinct 
	ZFamilia.Nome, 
	ZFamilia.Pessoa1, 
	ZFamilia.Class_Pessoa1, 
	ZFamilia.Pessoa2, 
	ZFamilia.Class_Pessoa2
from 	ZFamilia (Nolock)
	Left Join EAlunos (Nolock) on (EAlunos.Matricula = ZFamilia.Matricula)
	




/* Correção da Base Oficial ISC 26 april 2006
Update EAlunos Set Ealunos.Pai = '404' where Ealunos.Matricula = '00184'
Update EAcompl Set A_Pessoa1 = 'PAI', A_Pessoa2 = 'Mãe' where EAcompl.Matricula = '00464'
Update Ealunos Set EAlunos.RespAcad = '575' where EAlunos.Matricula = '00032'
Update Eacompl Set A_Pessoa1 = 'Responsável Acadêmico' where EAcompl.Matricula = '00032'
Update PPessoa Set Telefone3 = '(41)3233-7211', Fax = '(41)3222-8613', Bairro = 'Santa Felicidade' where PPessoa.Codigo = '482'
Update EAlunos Set Ealunos.Pai = '482' where Ealunos.Matricula = '00303'
Delete PPessoa where Codigo = '706'
Update EAcompl Set A_Pessoa1 = 'PAI', A_Pessoa2 = 'Mãe' where EAcompl.Matricula = '00461'
Update EAlunos Set Ealunos.Pai = '602' where Ealunos.Matricula = '00261'
Delete PPessoa where Codigo = '606'
Update EAcompl Set A_Pessoa1 = 'PAI', A_Pessoa2 = 'Mãe' where EAcompl.Matricula = '00429'
Update EAcompl Set A_Pessoa1 = 'PAI', A_Pessoa2 = 'Mãe' where EAcompl.Matricula = '00450'
*/