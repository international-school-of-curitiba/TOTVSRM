
select distinct
 	Umatricpl.MatAluno,
	ZFamilia.Nome,
	isnull(Eacompl.A_publica, 'No') as Publica,
	vw_info_familia.Pessoa1,
 	Case when Zfamilia.Class_Pessoa1 = 'Mãe' then 'Mother'
 	     when Zfamilia.Class_Pessoa1 = 'Pai' then 'Father'
 	     else 'Responsable'
   	End as Class_Pessoa1,
	vw_info_familia.Nome_Pessoa1,	
	Case When Eacompl.A_publica = 'No' then 'Not Authorized' else  vw_info_familia.HomePhone_Pessoa1 end HomePhone1,
	Case When Eacompl.A_publica = 'No' then 'Not Authorized' else  vw_info_familia.CellPhone_Pessoa1 end CellPhone1,
	Case When Eacompl.A_publica = 'No' then 'Not Authorized' else  vw_info_familia.FaxPhone_Pessoa1 end FaxPhone1,
	Case When Eacompl.A_publica = 'No' then 'Not Authorized' else  vw_info_familia.Email_Pessoa1 end E_mail1,
	vw_info_familia.Pessoa2,
-- 	Case when Zfamilia.Class_Pessoa2 = 'Mãe' then 'Mother'
-- 	     when Zfamilia.Class_Pessoa2 = 'Pai' then 'Father'
-- 	     else 'Responsable'
--   	End as Class_Pessoa2,
	vw_info_familia.Nome_Pessoa2,	
	Case When Eacompl.A_publica = 'No' then 'Not Authorized' else  vw_info_familia.HomePhone_Pessoa2 end HomePhone2,
	Case When Eacompl.A_publica = 'No' then 'Not Authorized' else  vw_info_familia.CellPhone_Pessoa2 end CellPhone2,
	Case When Eacompl.A_publica = 'No' then 'Not Authorized' else  vw_info_familia.FaxPhone_Pessoa2 end FaxPhone2,
	Case When Eacompl.A_publica = 'No' then 'Not Authorized' else  vw_info_familia.Email_Pessoa2 end E_mail2,
	Case When Eacompl.A_publica = 'No' then 'Not Authorized' else 
		CASE When (Ealunos.Compendal is null) THEN Ealunos.EndAluno + ', ' + EAlunos.Numendalun
	   	ELSE Ealunos.EndAluno + ', ' + EAlunos.Numendalun + ' - ' + Ealunos.Compendal
		End End As End_Principal, 
	Case When Eacompl.A_publica = 'No' then 'Not Authorized' else 
		Ealunos.BairroAlun + ' - ' + Ealunos.Cidaluno + ' - ' +	Ealunos.ufAluno end End_Secundario,
	Case When Eacompl.A_publica = 'No' then 'Not Authorized' else Ealunos.Cepaluno end CepAluno,

    rtrim(EACompl.A_NomeReduzido) + ' ' + (Select top 1 '(' + UMATALUN.CODTUR + ')' from UMatAlun where UMatAlun.MatAluno = ZFamilia.Matricula and UMatAlun.Perletivo = '09/10' Group by UMatAlun.CodTur Order by count(UMatAlun.CodTur) desc)
	, a_DataEntradaISC,
	Ealunos.Telaluno
from Umatricpl
inner join Eacompl (nolock) on (Eacompl.matricula = Umatricpl.MatAluno)
inner join Ealunos (nolock) on (Ealunos.matricula = Umatricpl.MatAluno)
inner join vw_info_familia on (vw_info_familia.matricula = Umatricpl.MatAluno)
inner join ZFamilia (Nolock) on (Zfamilia.Matricula = UMatricpl.MatAluno and Zfamilia.Perletivo = Umatricpl.Perletivo)
where Umatricpl.Perletivo = '13/14' and Umatricpl.Status in ('01', '07') 
--and (Eacompl.a_DataEntradaISC >= '09/15/2008' or EAcompl.A_ReturnedToISC >= '09/15/2008')
--and (Nacionalidade_Pessoa1 = 'Brasileira' or Nacionalidade_Pessoa2 = 'Brasileira')
-- and UMatricpl.CodCur = 1 and UMatricPl.CodPer = 1 and Umatricpl.Periodo = 4
Order by ZFamilia.Nome, vw_info_familia.Nome_Pessoa1

