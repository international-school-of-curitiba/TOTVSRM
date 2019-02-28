
select distinct
	rtrim(ZFamilia.Nome) as Nome,
	vw_info_familia.Nome_Pessoa1,	
	vw_info_familia.Nome_Pessoa2,	
 	(select A_Emailing from EACompl where Matricula = Umatricpl.MatAluno),
 	(Select (Select DESCRICAO from utabtipo where codtipo = tipoAluno) from Ealunos where Matricula = Umatricpl.MatAluno)
 	
from Umatricpl
inner join Eacompl (nolock) on (Eacompl.matricula = Umatricpl.MatAluno)
inner join Ealunos (nolock) on (Ealunos.matricula = Umatricpl.MatAluno)
inner join vw_info_familia on (vw_info_familia.matricula = Umatricpl.MatAluno)
inner join ZFamilia (Nolock) on (Zfamilia.Matricula = UMatricpl.MatAluno and Zfamilia.Perletivo = Umatricpl.Perletivo)
where Umatricpl.Perletivo = '10/11' and Umatricpl.Status in ('01', '07') 
and (EACOMPL.A_DATASAIDAISC is null or (EACOMPL.A_RETURNEDTOISC is not null and EACOMPL.A_LEFTISC_2 is null))
Order by Nome, vw_info_familia.Nome_Pessoa1


