Select	Distinct
	Codigo, EACompl.A_Familia,
	Rua + ', ' + numero,
	Complemento,
	Bairro + ' - ' + Estado + ' - ' + Cidade,
	Cep, Pais
From	PPessoa, Ealunos, EACompl
Where 	PPessoa.Codigo = EAlunos.mae
and	EAcompl.Matricula = EAlunos.Matricula
