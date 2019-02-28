Select Distinct
	EAcompl.Matricula,
	EACompl.A_NOMEREDUZIDO,
	Case 
		when Umatricpl.Periodo = 06 then '6º Série do Ensino Fundamental'
		when Umatricpl.Periodo = 07 then '7º Série do Ensino Fundamental'
		when Umatricpl.Periodo = 08 then '8º Série do Ensino Fundamental'
		when Umatricpl.Periodo = 09 then '1º Série do Ensino Médio'
		when Umatricpl.Periodo = 10 then '2º Série do Ensino Médio'
		when Umatricpl.Periodo = 11 then '3º Série do Ensino Médio'
		when Umatricpl.Periodo = 12 then '4º Série do Ensino Médio'
	end as serie,
	UMatricpl.CodCur, UMatricpl.CodPer, UMatricpl.Periodo
from	Ealunos
	Left Join EACompl (Nolock) on  (Ealunos.matricula = EAcompl.matricula)
	Left Join Umatricpl (Nolock) on (Ealunos.matricula = Umatricpl.mataluno)
	Left Join Umatalun (Nolock) on (Umatricpl.mataluno = Umatalun.mataluno)
Where 	
 	Umatricpl.Perletivo = '08/09'
and	UMatricpl.Status in('01','07')
and ((Umatalun.CodCur = 2 and Umatalun.CodPer = 2) or (Umatalun.CodCur = 3 and Umatalun.CodPer = 1))
Order By UMatricpl.CodCur, UMatricpl.CodPer, UMatricpl.Periodo, EACompl.A_NOMEREDUZIDO