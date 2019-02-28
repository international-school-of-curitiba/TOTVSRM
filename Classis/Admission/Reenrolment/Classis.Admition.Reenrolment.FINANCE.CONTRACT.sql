Select distinct	
	Nome,
	(Select nome from ppessoa where codigo = pessoa1) as Pai ,
	(Select nome from ppessoa where codigo = pessoa2) as Mae,
	(Select A_EmaiLing from EAcompl where EACompl.matricula = ZFamilia.Matricula) AS Language,
	(Select 
		Case when TipoAluno = 1 then 'Local'
		when TipoAluno = 2 then 'Temporary'
		when TipoAluno = 5 then 'Staff'
		else 'Corporate'
		end
	from Ealunos where EAlunos.matricula = ZFamilia.Matricula) AS TIPO
from Zfamilia
where status in ('01','07')
and Perletivo = '08/09'