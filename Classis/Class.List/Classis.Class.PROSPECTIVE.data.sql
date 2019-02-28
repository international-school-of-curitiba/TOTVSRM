Select Distinct
    EAcompl.Matricula,
	EACompl.A_NomeReduzido,
    Case 
		when UMatricpl.CodCur = 1 and UMatricpl.CodPer = 1 and UMatricpl.Periodo = 0 then 'Pre-Toddler'
		when UMatricpl.CodCur = 1 and UMatricpl.CodPer = 1 and UMatricpl.Periodo = 1 then 'Toddler'		
		when UMatricpl.CodCur = 1 and UMatricpl.CodPer = 1 and UMatricpl.Periodo = 2 then 'Nursery'
		when UMatricpl.CodCur = 1 and UMatricpl.CodPer = 1 and UMatricpl.Periodo = 3 then 'Pre-Kinder'
		when UMatricpl.CodCur = 1 and UMatricpl.CodPer = 1 and UMatricpl.Periodo = 4 then 'Kinder'
		when UMatricpl.CodCur = 2 and UMatricpl.CodPer = 1 and UMatricpl.Periodo = 1 then '1st Grade'
		when UMatricpl.CodCur = 2 and UMatricpl.CodPer = 1 and UMatricpl.Periodo = 2 then '2nd Grade'
		when UMatricpl.CodCur = 2 and UMatricpl.CodPer = 1 and UMatricpl.Periodo = 3 then '3rd Grade'		
		when UMatricpl.CodCur = 2 and UMatricpl.CodPer = 1 and UMatricpl.Periodo = 4 then '4th Grade'		
		when UMatricpl.CodCur = 2 and UMatricpl.CodPer = 1 and UMatricpl.Periodo = 5 then '5th Grade'		
		when UMatricpl.CodCur = 2 and UMatricpl.CodPer = 2 and UMatricpl.Periodo = 6 then '6th Grade'		
		when UMatricpl.CodCur = 2 and UMatricpl.CodPer = 2 and UMatricpl.Periodo = 7 then '7th Grade'		
		when UMatricpl.CodCur = 2 and UMatricpl.CodPer = 2 and UMatricpl.Periodo = 8 then '8th Grade'		
		when UMatricpl.CodCur = 3 and UMatricpl.CodPer = 1 and UMatricpl.Periodo = 9 then '9th Grade'	
		when UMatricpl.CodCur = 3 and UMatricpl.CodPer = 1 and UMatricpl.Periodo = 10 then '10th Grade'	
		when UMatricpl.CodCur = 3 and UMatricpl.CodPer = 1 and UMatricpl.Periodo = 11 then '11th Grade'	
		when UMatricpl.CodCur = 3 and UMatricpl.CodPer = 1 and UMatricpl.Periodo = 12 then '12th Grade'						
	else '' 
	end,
	Mae,
	(Select Nome from PPessoa where Codigo = Mae),	
	(Select Rua + ', ' + Numero + ' - ' + Complemento from PPessoa where Codigo = Mae),
	(Select Bairro + ' - ' + Cidade + ' - ' + Estado + ' - CEP. ' + Cep from PPessoa where Codigo = Mae),
	(Select Telefone1 from PPessoa where Codigo = Mae),		
	(Select Telefone2 from PPessoa where Codigo = Mae),		
	Pai,
	(Select Nome from PPessoa where Codigo = Pai),
	(Select Rua + ', ' + Numero + ' - ' + Complemento from PPessoa where Codigo = Pai),
	(Select Bairro + ' - ' + Cidade + ' - ' + Estado + ' - CEP. ' + Cep from PPessoa where Codigo = Pai),
	(Select Telefone1 from PPessoa where Codigo = Pai),		
	(Select Telefone2 from PPessoa where Codigo = Pai),		
	CASE 
		When (Ealunos.Compendal is null) THEN Ealunos.EndAluno + ', ' + EAlunos.Numendalun
	else  isnull(Ealunos.EndAluno,'') + ', ' +  isnull(EAlunos.Numendalun,'') + ' - ' +  isnull(Ealunos.Compendal,'')
	end As End_Principal, 
	Ealunos.BairroAlun,
	Ealunos.Cidaluno,
	Ealunos.ufAluno,
	Ealunos.Cepaluno,
	Ealunos.telaluno,
	UMatricpl.CodCur, UMatricpl.CodPer, UMatricpl.Periodo
from Ealunos
	Left Join EACompl   (Nolock) on (EAlunos.Matricula = EAcompl.Matricula)
	Left Join UMatricPL (Nolock) on (EAlunos.Matricula = UMatricPL.Mataluno)
Where 	
 	UMatricPL.Perletivo ='10/11'--:Espelho#1_S 
    and	UMatricPL.Status = '09'
order By UMatricpl.CodCur, UMatricpl.CodPer, UMatricpl.Periodo, EACompl.A_NomeReduzido