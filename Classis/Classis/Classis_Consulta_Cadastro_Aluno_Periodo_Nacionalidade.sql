Select 	Ealunos.Nome, Ealunos.DtNasc, Ealunos.Sexo, 
	Umatricpl.Periodo, 
	PcodNacao.Descricao as Nacionalidade, *
from 	Umatricpl 
	Inner Join EAlunos (NoLock) on (Ealunos.matricula = Umatricpl.MatAluno)
	Inner Join PCodNacao (Nolock) on (Ealunos.nacional = PCodNacao.codinterno)
where	Umatricpl.CodCur='2' and Umatricpl.Periodo = '5'
order by
	mataluno
-- 
-- Select * from PCodNacao