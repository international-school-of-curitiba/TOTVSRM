

select distinct
	ZFamilia.Nome,
	isnull(Eacompl.A_publica, 'No') as Publica,
	case when Eacompl.A_publica = 'No' then  'Not Authorized' end Autorization,
	/* Pessoa 1 */
	case when Eacompl.A_publica = 'Yes' then vw_info_familia.Pessoa1 end Pessoa1,
	Case when Eacompl.A_publica = 'Yes' and Zfamilia.Class_Pessoa1 = 'Mãe' then 'Mother'
	     when Eacompl.A_publica = 'Yes' and Zfamilia.Class_Pessoa1 = 'Pai' then 'Father'
	     when Eacompl.A_publica = 'Yes' and zfamilia.Class_Pessoa1 like 'Respons&' then 'Responsable'
  	End as Class_Pessoa1,
	case when Eacompl.A_publica = 'Yes' then vw_info_familia.Nome_Pessoa1 end Nome_Pessoa1,
	Case When Eacompl.A_publica = 'Yes' then vw_info_familia.HomePhone_Pessoa1 end HomePhone1,
	Case When Eacompl.A_publica = 'Yes' then vw_info_familia.CellPhone_Pessoa1 end CellPhone1,
	Case When Eacompl.A_publica = 'Yes' then vw_info_familia.FaxPhone_Pessoa1 end FaxPhone1,
	Case When Eacompl.A_publica = 'Yes' then vw_info_familia.Email_Pessoa1 end E_mail1,
	/* Pessoa 2 */
	case when Eacompl.A_publica = 'Yes' then vw_info_familia.Pessoa2 end Pessoa2,
	Case when Eacompl.A_publica = 'Yes' and Zfamilia.Class_Pessoa2 = 'Mãe' then 'Mother'
	     when Eacompl.A_publica = 'Yes' and Zfamilia.Class_Pessoa2 = 'Pai' then 'Father'
	     when Eacompl.A_publica = 'Yes' and zfamilia.Class_Pessoa2 like 'Respons&' then 'Responsable'
  	End as Class_Pessoa2,
	case when Eacompl.A_publica = 'Yes' then vw_info_familia.Nome_Pessoa2 end Nome_Pessoa2,	
	Case When Eacompl.A_publica = 'Yes' then vw_info_familia.HomePhone_Pessoa2 end HomePhone2,
	Case When Eacompl.A_publica = 'Yes' then vw_info_familia.CellPhone_Pessoa2 end CellPhone2,
	Case When Eacompl.A_publica = 'Yes' then vw_info_familia.FaxPhone_Pessoa2 end FaxPhone2,
	Case When Eacompl.A_publica = 'Yes' then vw_info_familia.Email_Pessoa2 end E_mail2,
	Case When Eacompl.A_publica = 'Yes' then
		CASE When (Ealunos.Compendal is null) THEN Ealunos.EndAluno + ', ' + EAlunos.Numendalun
	   	     ELSE Ealunos.EndAluno + ', ' + EAlunos.Numendalun + ' - ' + Ealunos.Compendal
		End 
	End As End_Principal, 
	Case When Eacompl.A_publica = 'Yes' then
		Ealunos.BairroAlun + ' - ' + Ealunos.Cidaluno + ' - ' +	Ealunos.ufAluno end End_Secundario,
	Case When Eacompl.A_publica = 'Yes' then Ealunos.Cepaluno end CepAluno
from Umatricpl
inner join Eacompl (nolock) on (Eacompl.matricula = Umatricpl.MatAluno)
inner join Ealunos (nolock) on (Ealunos.matricula = Umatricpl.MatAluno)
inner join vw_info_familia on (vw_info_familia.matricula = Umatricpl.MatAluno)
inner join ZFamilia (Nolock) on (Zfamilia.Matricula = UMatricpl.MatAluno and Zfamilia.Perletivo = Umatricpl.Perletivo)
where Umatricpl.Perletivo = '09/10' and Umatricpl.Status in ('01', '07')
Order by ZFamilia.Nome, Pessoa1

