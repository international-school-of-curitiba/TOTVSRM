
Create view VW_Familia_ECEC AS
(Select Distinct EAcompl.A_Familia as Familia, Ealunos.mae 
from Ealunos, Umatricpl, EAcompl
where Ealunos.matricula = Umatricpl.MatAluno 
and EAcompl.matricula = Ealunos.matricula
and Umatricpl.Status = '01' 		--Matriculado
and Umatricpl.CodCur = '1' 		--Ensino Infantil
and Umatricpl.CodPer = '1'		--ECEC
and Umatricpl.Perletivo = '05/06')	--Ano Letivo


Select VW_Familia_ECEC.Familia, (Select top 1 Ealunos.matricula from Ealunos, Umatricpl where VW_Familia_ECEC.Mae = Ealunos.mae 
	and Ealunos.matricula = Umatricpl.MatAluno 
	and Umatricpl.Status = '01' 		--Matriculado
	and Umatricpl.CodCur = '1' 		--Ensino Infantil
	and Umatricpl.CodPer = '1'		--ECEC
	and Umatricpl.Perletivo = '05/06')	--Ano Letivo
from VW_Familia_ECEC