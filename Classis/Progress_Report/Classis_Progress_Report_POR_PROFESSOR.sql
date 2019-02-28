Select 
	pr_grade,
	(Select a_NomeReduzido from corpore.dbo.EACompl where matricula = Progress_report.pr_matricula) as Nome,
	(Select Materia from corpore.dbo.Umaterias where CodMat = Progress_report.pr_subject) as materia,
	pr_quarter,
	pr_comment
from Progress_report
where pr_schoolyear = '07/08'
and pr_quarter=2
and pr_subject in
(select codmat from corpore.dbo.Uprofmatturma
where codprof = '1351' and codperlet = '07/08')
Order by Materia, pr_grade, Nome
