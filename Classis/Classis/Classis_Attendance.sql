Select distinct
	UListaPresenca.MatAluno,
	EACompl.A_NomeReduzido, 
	UListaPresenca.CodTur, EAlunos.TelAluno, 
 	Case when EAluOcor.Status = 'A' then 'x' end as Absence,
 	Case when EAluOcor.Status = 'T' then 'x' end as Tardy,
 	Case when EAluOcor.Status = 'P' then 'x' end as PreArrenge,
	Cast(EaluOcor.Observacao as Char(50)) as Reason,
	UMatricpl.Periodo
from UListaPresenca 
Inner Join EACompl (NoLock) on (EACompl.Matricula = UListaPresenca.MatAluno)
Inner join EAlunos (Nolock) on (EAlunos.Matricula = UListaPresenca.MatAluno)
inner Join UMatricPL (Nolock) on (UmatricPL.MatAluno =  UListaPresenca.MatAluno)
Left Join EAluOcor (Nolock) on (EAluOcor.MatAluno = UListaPresenca.MatAluno and EaluOcor.Data = UListaPresenca.DataAula)
Where UListaPresenca.CodMat in (Select UMatTurSl.CodMat from UMatTurSl where Substring(Cast(UMatTurSl.CodHor as Char(4)),3,4) ='01' and UMatTurSl.CodPerLet ='06/07')
and UListaPresenca.DataAula ='08/03/2006'
and UListaPresenca.Status = 'N' and UMatricpl.PerLetivo ='06/07'
--and Umatricpl.Periodo >= '6'
Order By UMatricpl.Periodo,  UListaPresenca.CodTur


Select * from EaluOcor