
Create view VW_Familia_ELEM AS
(Select Distinct EAcompl.A_Familia as Familia, Ealunos.mae 
from Ealunos, Umatricpl, EAcompl
where Ealunos.matricula = Umatricpl.MatAluno 
and EAcompl.matricula = Ealunos.matricula
and Umatricpl.Status = '01' 		--Matriculado
and Umatricpl.CodCur = '2' 		--Ensino Fundamental
and Umatricpl.CodPer = '1'		--Middle School
and Umatricpl.Perletivo = '05/06')	--Ano Letivo


Select VW_Familia_ELEM.Familia, (Select top 1 Ealunos.matricula from Ealunos, Umatricpl where VW_Familia_ELEM.Mae = Ealunos.mae 
	and Ealunos.matricula = Umatricpl.MatAluno 
	and Umatricpl.Status = '01' 		--Matriculado
	and Umatricpl.CodCur = '2' 		--Ensino Fundamental
	and Umatricpl.CodPer = '1'		--Middle School
	and Umatricpl.Perletivo = '05/06')	--Ano Letivo
from VW_Familia_ELEM





/*
Select VW_Familia_SEC.familia, (Select top 1 Ealunos.matricula from Ealunos, Umatricpl where VW_Familia_Sec.Mae = Ealunos.mae 
	and Ealunos.matricula = Umatricpl.MatAluno and Umatricpl.Status = '01'and Umatricpl.Perletivo = '05/06' and Umatricpl.Periodo >='6') as Matricula
from VW_Familia_SEC
*/

