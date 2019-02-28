Select distinct
	Umatricpl.MatAluno, UMatAlun.Codtur, Ealunos.Nome as Nome_$$
from Umatricpl, UMatAlun, Ealunos
Where Umatricpl.MatAluno = UMatAlun.MatAluno and Umatricpl.MatAluno = Ealunos.Matricula
and Umatricpl.CodCur = '2'
and Umatricpl.CodPer = '2'
and Umatricpl.Status in ('01', '07')
and Umatricpl.Perletivo = '06/07'
and UMatAlun.Perletivo = '06/07'
and Umatricpl.Grade ='20052006'
--and UMatAlun.Codtur = '7B'
Order by  UMatAlun.Codtur, Ealunos.Nome
