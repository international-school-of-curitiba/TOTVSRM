/*
create table Familia
(	Family_Code varchar(5),
	Family_Name varchar(40),
	Father_Code varchar(4),
	Mother_Code varchar(4)
)
	
insert into Familia(Family_Name, Father_Code, Mother_Code)
( 
	select distinct
		EAcompl.A_Familia,
		Ealunos.pai,
		Ealunos.mae
	from 	EAcompl (Nolock)
		left join Ealunos (nolock) on (EAcompl.matricula = Ealunos.matricula)
		left join Ualucurso (Nolock) on (Ualucurso.Mataluno = Ealunos.matricula)
		left join Eirmaos (Nolock) on (Eirmaos.Mataluno = Ealunos.Matricula)
	Where 	Ualucurso.status = '01' --Apenas alunos matriculados 
)
*/

Select * 
from 	Familia
	left join EAlunos (nolock) on (EAlunos.pai=Familia.Father_code and EAlunos.mae=Familia.Mother_Code)
order by Family_Name