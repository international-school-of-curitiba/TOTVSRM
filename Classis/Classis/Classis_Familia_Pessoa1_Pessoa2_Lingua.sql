Select Distinct
	EAcompl.A_Familia,
	Case 
	When EACompl.A_Pessoa1= 'Pai' then 
		(select nome from ppessoa where codigo = Ealunos.Pai)
	When EACompl.A_Pessoa1= 'M�e' then 
		(select nome from ppessoa where codigo = Ealunos.Mae)
	When EACompl.A_Pessoa1= 'Respons�vel Financeiro' then 
		(select nome from fcfo where codcfo = Ealunos.Respons)
	When EACompl.A_Pessoa1= 'Respons�vel Acad�mico' then
		(select nome from ppessoa where codigo = Ealunos.RespAcad)
	Else '0'
	End as Pessoa1,
	Case
	When EACompl.A_Pessoa2= 'Pai' then
		(select nome from ppessoa where codigo = Ealunos.Pai)
	When EACompl.A_Pessoa2= 'M�e' then 
		(select nome from ppessoa where codigo = Ealunos.Mae)
	When EACompl.A_Pessoa2= 'Respons�vel Financeiro' then 
		(select nome from fcfo where codcfo = Ealunos.Respons)
	When EACompl.A_Pessoa2= 'Respons�vel Acad�mico' then 
		(select nome from ppessoa where codigo = Ealunos.RespAcad)
	Else '0'
	End as Pessoa2,
	EAcompl.A_EmailIng as Lingua
from 	EAcompl (Nolock), Ealunos (nolock), UMatricPL (Nolock)
where	EAcompl.matricula = Ealunos.matricula
	and UMatricPL.Mataluno = Ealunos.matricula
	and UMatricPL.Perletivo = '16/17'
	and UMatricPL.status in ('01','07')
	and EACompl.A_Familia is not Null
Order by  EAcompl.A_Familia
