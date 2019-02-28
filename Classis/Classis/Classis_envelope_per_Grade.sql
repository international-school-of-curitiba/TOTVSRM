select distinct
	CASE
           WHEN (Eacompl.A_EMAILING = 'Portugues') THEN 'Família ' + EAcompl.A_Familia
	   ELSE EAcompl.A_Familia + ' Family'
	End As Family_Name, 
	Ealunos.mae,
	CASE
           WHEN (Ealunos.Compendal is null) THEN Ealunos.EndAluno + ', ' + EAlunos.Numendalun
	   ELSE Ealunos.EndAluno + ', ' + EAlunos.Numendalun + ' - ' + Ealunos.Compendal
	End As End_Principal, 
	Ealunos.BairroAlun + ' - ' + Ealunos.Cidaluno + ' - ' +	Ealunos.ufAluno AS End_Secundario,
	Ealunos.Cepaluno, EAcompl.A_Familia	
from 	EAcompl (Nolock)
	left join Ealunos (nolock) on (EAcompl.matricula = Ealunos.matricula)
	left join Ualucurso (Nolock) on (Ualucurso.Mataluno = Ealunos.matricula)
	left join Eirmaos (Nolock) on (Eirmaos.Mataluno = Ealunos.Matricula)
	left join Umatricpl (NoLock) On (Umatricpl.mataluno = Ealunos.matricula)
Where 	Ualucurso.status in ('01', '07')
and	Umatricpl.Codcur in ('1','2','3') 
and  Umatricpl.PerLetivo = '05/06'
order by EAcompl.A_Familia
