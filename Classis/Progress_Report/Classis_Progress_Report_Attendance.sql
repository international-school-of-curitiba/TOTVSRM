select distinct
           (Select Count(*) from EAluOcor Where CodPerLet = Umatricpl.PerLetivo and Mataluno = Umatricpl.Mataluno and EAluOcor.Status in ('AE','PE') and EAluOcor.CodOcorrencia ='1') as EXCUSE_Q1,
           (Select Count(*) from EAluOcor Where CodPerLet = Umatricpl.PerLetivo and Mataluno = Umatricpl.Mataluno and EAluOcor.Status in ('A', 'P') and EAluOcor.CodOcorrencia ='1'),
           (Select Count(*) from EAluOcor Where CodPerLet = Umatricpl.PerLetivo and Mataluno = Umatricpl.Mataluno and EAluOcor.Status in ('T') and EAluOcor.CodOcorrencia = '1') as Tardy_Q1,
           (Select Count(*) from EAluOcor Where CodPerLet = Umatricpl.PerLetivo and Mataluno = Umatricpl.Mataluno and EAluOcor.Status in ('E') and EAluOcor.CodOcorrencia = '1') as Early_Q1,
           UMatricPl.Periodo
from Umatricpl
Where (Umatricpl.PerLetivo ='06/07' and UmatricPl.Status in ('01', '07') and Codcur = '3' and Codper = '1' and UmatricPl.MatAluno ='00148') 
or    (Umatricpl.PerLetivo ='06/07' and UmatricPl.Status in ('01', '07') and Codcur = '2' and Codper = '2' and UmatricPl.MatAluno ='00148')

