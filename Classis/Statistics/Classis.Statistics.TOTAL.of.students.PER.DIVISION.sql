Select top 1
(Select count(MatAluno) from UMatricpl where Perletivo ='16/17' and UmatricPl.Status in ('01','07') and CodCur = 1 and CodPer = 1) AS ECC,
(Select count(MatAluno) from UMatricpl where Perletivo ='16/17' and UmatricPl.Status in ('01','07') and CodCur = 2 and CodPer = 1) AS ELEMENTARY,
(Select count(MatAluno) from UMatricpl where Perletivo ='16/17' and UmatricPl.Status in ('01','07') and (CodCur = 2 and CodPer = 2 and PERIODO <=8 )) AS MIDDLE,
((Select count(MatAluno) from UMatricpl where Perletivo ='16/17' and UmatricPl.Status in ('01','07') and (CodCur = 2 and CodPer = 2 and periodo = 9))+
(Select count(MatAluno) from UMatricpl where Perletivo ='16/17' and UmatricPl.Status in ('01','07') and (CodCur = 3 and CodPer = 1))) AS HIGH
from Ealunos