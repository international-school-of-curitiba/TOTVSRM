Select id,
	(Select materia from  UMaterias where  UMaterias.CodMat = ZProgressReport.CodMat) as Subject,
	Cast((select Apelido from PPessoa where codigo = Eprofes.codpessoa) as Varchar) as Teacher, 
	ZProgressReport.AcadAchiev,
	ZProgressReport.Conduct,
	ZProgressReport.Effort,
	ZProgressReport.Comment,
	Case when ZProgressReport.Meeting = 'N' then '' 
	Else ' ' end as Meeting
from 
	ZProgressReport, EProfes
where ZProgressReport.CodProf = Eprofes.CodProf
and ZProgressReport.Perletivo = '06/07'
and ZProgressReport.Matricula = '00134'
and ZProgressReport.CodEtapa = '2'



