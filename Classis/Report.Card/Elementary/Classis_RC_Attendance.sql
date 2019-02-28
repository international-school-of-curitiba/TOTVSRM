Select distinct top 4
(Select Count(*) from EAluOcor Where CodPerLet = '06/07' and Mataluno = '00007' and Status in ('A', 'P') and Etapa = '1') as Abs_Q1,
(Select Count(*) from EAluOcor Where CodPerLet = '06/07' and Mataluno = '00007' and Status in ('T') and Etapa = '1') as Tardy_Q1,
(Select Count(*) from EAluOcor Where CodPerLet = '06/07' and Mataluno = '00007' and Status in ('E') and Etapa = '1') as Early_Q1,
(Select Count(*) from EAluOcor Where CodPerLet = '06/07' and Mataluno = '00007' and Status in ('A', 'P') and Etapa = '2') as Abs_Q2,
(Select Count(*) from EAluOcor Where CodPerLet = '06/07' and Mataluno = '00007' and Status in ('T') and Etapa = '2') as Tardy_Q2,
(Select Count(*) from EAluOcor Where CodPerLet = '06/07' and Mataluno = '00007' and Status in ('E') and Etapa = '2') as Early_Q2,
(Select Count(*) from EAluOcor Where CodPerLet = '06/07' and Mataluno = '00007' and Status in ('A', 'P') and Etapa = '6') as Abs_Q3,
(Select Count(*) from EAluOcor Where CodPerLet = '06/07' and Mataluno = '00007' and Status in ('T') and Etapa = '6') as Tardy_Q3,
(Select Count(*) from EAluOcor Where CodPerLet = '06/07' and Mataluno = '00007' and Status in ('E') and Etapa = '6') as Early_Q3,
(Select Count(*) from EAluOcor Where CodPerLet = '06/07' and Mataluno = '00007' and Status in ('A', 'P') and Etapa = '7') as Abs_Q4,
(Select Count(*) from EAluOcor Where CodPerLet = '06/07' and Mataluno = '00007' and Status in ('T') and Etapa = '7') as Tardy_Q4,
(Select Count(*) from EAluOcor Where CodPerLet = '06/07' and Mataluno = '00007' and Status in ('E') and Etapa = '7') as Early_Q4,
Case when (Select Count(*) from EAluOcor Where CodPerLet = '06/07' and Mataluno = '00007' and Status in ('A', 'P') and Etapa = '1')> 10 then 'Watch out' end
from EAlunos

