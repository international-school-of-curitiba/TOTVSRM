Select -- UMatricpl.status,
	A_DataEntradaISC,
	rtrim(A_Familia), 
	rtrim(Nome),
	Case 
		when CodCur = 1 and CodPer = 1 and Periodo = 0 Then 'Pre Toddler'
		when CodCur = 1 and CodPer = 1 and Periodo = 1 Then 'Toddler'
		when CodCur = 1 and CodPer = 1 and Periodo = 2 Then 'Nursery'
		when CodCur = 1 and CodPer = 1 and Periodo = 3 Then 'Pre Kinder'
		when CodCur = 1 and CodPer = 1 and Periodo = 4 Then 'Kinder'
		when CodCur = 2 and CodPer = 1 and Periodo = 1 Then '1st Grade'
		when CodCur = 2 and CodPer = 1 and Periodo = 2 Then '2nd Grade'
		when CodCur = 2 and CodPer = 1 and Periodo = 3 Then '3rd Grade'
		when CodCur = 2 and CodPer = 1 and Periodo = 4 Then '4th Grade'
		when CodCur = 2 and CodPer = 1 and Periodo = 5 Then '5th Grade'
		when CodCur = 2 and CodPer = 2 and Periodo = 6 Then '6th Grade'
		when CodCur = 2 and CodPer = 2 and Periodo = 7 Then '7th Grade'
		when CodCur = 2 and CodPer = 2 and Periodo = 8 Then '8th Grade'
		when CodCur = 3 and CodPer = 1 and Periodo = 9 Then '9th Grade'
		when CodCur = 3 and CodPer = 1 and Periodo = 10 Then '10th Grade'
		when CodCur = 3 and CodPer = 1 and Periodo = 11 Then '11th Grade'
		when CodCur = 3 and CodPer = 1 and Periodo = 12 Then '12th Grade'
		end,
		(Select Nome from PPessoa where Codigo = Pai),
		(Select email from PPessoa where Codigo = Pai),
		(Select Nome from PPessoa where Codigo = Mae),
		(Select email from PPessoa where Codigo = mae),
		TelAluno,
		CelAluno
from EACompl
	Inner Join EAlunos (NoLock) on (EAlunos.Matricula = EACompl.Matricula)
	Inner Join UMatricPL (NoLock) on (UMatricpl.MatAluno = EACompl.Matricula)
Where A_DataEntradaISC between '01/01/2014' and '03/28/2014'
and UMatricPL.Perletivo = '13/14'
Order By a_Familia