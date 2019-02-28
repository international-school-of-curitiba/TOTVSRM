/*
	Cria View para Atualiza��o da Tabela EACompl 
*/

Create view ZUpdate_CodPessoa as
Select Distinct
	EAcompl.Matricula, 
	Case 
	When EACompl.A_Pessoa1= 'Pai' then Ealunos.Pai
	When EACompl.A_Pessoa1= 'M�e' then Ealunos.Mae
	When EACompl.A_Pessoa1= 'Respons�vel Financeiro' then Ealunos.Respons
	When EACompl.A_Pessoa1= 'Respons�vel Acad�mico' then Ealunos.RespAcad
	Else '0'
	End as Pessoa1,
	Case
	When EACompl.A_Pessoa2= 'Pai' then Ealunos.Pai
	When EACompl.A_Pessoa2= 'M�e' then Ealunos.Mae
	When EACompl.A_Pessoa2= 'Respons�vel Financeiro' then Ealunos.Respons
	When EACompl.A_Pessoa2= 'Respons�vel Acad�mico' then Ealunos.RespAcad
	Else '0'
	End as Pessoa2
from 	EAcompl (Nolock), Ealunos (nolock)
where	EAcompl.matricula = Ealunos.matricula
	and EACompl.A_Familia is not Null


/*
	Atualiza os campos CodPessoa1 e CodPessoa2 da Tabela EACompl 
*/

Update EAcompl Set EAcompl.A_CodPessoa1 = ZUpdate_CodPessoa.Pessoa1, EACompl.A_CodPessoa2 = ZUpdate_CodPessoa.Pessoa2 from ZUpdate_CodPessoa where ZUpdate_CodPessoa.Matricula = EAcompl.Matricula


