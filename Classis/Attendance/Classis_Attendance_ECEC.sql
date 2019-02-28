Select distinct 
	(Select A_NomeReduzido from EAcompl where EACompl.Matricula = Umatricpl.Mataluno) as Nome, 
	(Select top 1 UListaPresenca.CodTur from UListaPresenca where UListaPresenca.MatAluno = Umatricpl.Mataluno and UListaPresenca.Perletivo = Umatricpl.PerLetivo) as Grade,
	(Select Count(*) from EAluOcor Where CodPerLet = Umatricpl.PerLetivo and Mataluno = Umatricpl.Mataluno and EAluOcor.Status in ('A', 'P') and EAluOcor.Etapa = '1') as Abs_Q1,
	(Select Count(*) from EAluOcor Where CodPerLet = Umatricpl.PerLetivo and Mataluno = Umatricpl.Mataluno and EAluOcor.Status in ('T') and EAluOcor.Etapa = '1') as Tardy_Q1,
	(Select Count(*) from EAluOcor Where CodPerLet = Umatricpl.PerLetivo and Mataluno = Umatricpl.Mataluno and EAluOcor.Status in ('E') and EAluOcor.Etapa = '1') as Early_Q1,
	UMatricPl.Periodo
from Umatricpl
Where Umatricpl.PerLetivo = '06/07'
and UmatricPl.Status in ('01', '07')
and Codcur = '1'
order by UMatricPl.Periodo, Grade, Nome