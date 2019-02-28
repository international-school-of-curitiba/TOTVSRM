Select distinct 
	Umatricpl.MatAluno, UMatAlun.Codtur
from Umatricpl, UMatAlun
Where Umatricpl.MatAluno = UMatAlun.MatAluno
and Umatricpl.CodCur = '2'
and Umatricpl.CodPer = '1'
and Umatricpl.Status in ('01', '07')
and Umatricpl.Perletivo = '06/07'
and Umatricpl.Grade ='20052006'
Order by  UMatAlun.Codtur

