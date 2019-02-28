Select Top 1
(Select Count(MatAluno) from Umatricpl (Nolock) where Umatricpl.Perletivo ='06/07' and UMatricpl.Status in ('01','07') and Umatricpl.Periodo <= '4' and Umatricpl.CodCur = '1') as ECC,
(Select Count(MatAluno) from Umatricpl (Nolock) where Umatricpl.Perletivo ='06/07' and UMatricpl.Status in ('01','07') and Umatricpl.Periodo <= '5' and Umatricpl.CodCur = '2') as Elementary,
(Select Count(MatAluno) from Umatricpl (Nolock) where Umatricpl.Perletivo ='06/07' and UMatricpl.Status in ('01','07') and Umatricpl.Periodo >= '6') as Secondary
from Glogin


Select * from EAluOcor
inner Join UMatricPL (Nolock) on (UmatricPL.MatAluno =  EAluOcor.MatAluno)
where EAluOcor.Data ='09/29/2006' 
and  EAluOcor.Status in ('A', 'P') 
and UMatricpl.PerLetivo ='06/07'
and UMatricpl.Periodo >= '6'