Select Distinct EAcompl.A_Familia, Ealunos.nome, EAlunos.pai, Ealunos.mae, EAlunos.Dtnasc,
	Umatricpl.CodPer, Umatricpl.Codcur, Umatricpl.Periodo, Umatalun.CodTur, Umatturma.NomeTurma, EAcompl.A_emailing
from Eacompl 
	Inner join Ealunos (NoLock) On (Ealunos.matricula = Eacompl.matricula)	
	Inner join Umatricpl (NoLock) On (Umatricpl.mataluno = Ealunos.matricula)
	left Join UMatalun (Nolock) on (UMatalun.Mataluno = Ealunos.matricula)
	left join UMatTurma (NoLock) on ( Umatalun.CodTur = UMatTurma.codtur)
Order By 
	EAcompl.A_Familia,
	EAlunos.Dtnasc desc


/*
Update 	EAcomPL 
set 	A_EmailIng = 'Inglês'
where 	EACompl.A_familia in (
		Select Fam_Name from Family where Fam_mail_e = '1' )

Update 	EAcomPL 
set 	A_EmailIng = 'Português'
where 	EACompl.A_familia in (
		Select Fam_Name from Family where Fam_mail_e = '0' )

Select * from GRelationlink

*/