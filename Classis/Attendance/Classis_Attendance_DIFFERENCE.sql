/* Diferença no Elementary */

Select distinct 
	EAluOcor.MatAluno, Ealunos.Nome, 
    (Select top 1 UMATALUN.CODTUR from UMatAlun where UMatAlun.MatAluno = EAlunos.Matricula and UMatAlun.Perletivo =UMatricpl.PerLetivo Group by UMatAlun.CodTur Order by count(UMatAlun.CodTur) desc) as Grade_Level,
	EAluOcor.status, UMatricPL.CodCur,  UMatricPL.CODPER, Periodo
from EAluOcor
	inner Join UMatricPL (Nolock) on (UmatricPL.MatAluno =  EAluOcor.MatAluno)
	Inner join EAlunos (Nolock) on (EAlunos.Matricula = EAluOcor.MatAluno)
where EAluOcor.Data ='09/04/2009'
and  EAluOcor.Status in ('A', 'AE','P', 'PE') 
and UMatricpl.PerLetivo ='09/10'
and UMatricPL.CodCur = 2 and UMatricPL.CodPer = 1
and UMatricpl.Periodo >= '1'
and EAluOcor.MatAluno not in 
(
Select distinct
	UListaPresenca.MatAluno
from UListaPresenca 
Inner Join EACompl (NoLock) on (EACompl.Matricula = UListaPresenca.MatAluno)
Inner join EAlunos (Nolock) on (EAlunos.Matricula = UListaPresenca.MatAluno)
inner Join UMatricPL (Nolock) on (UmatricPL.MatAluno =  UListaPresenca.MatAluno)
Left Join EAluOcor (Nolock) on (EAluOcor.MatAluno = UListaPresenca.MatAluno and EaluOcor.Data = UListaPresenca.DataAula)
Where UListaPresenca.CodMat in (Select UMatTurSl.CodMat from UMatTurSl where Substring(Cast(UMatTurSl.CodHor as Char(4)),3,4) ='01' and UMatTurSl.CodPerLet ='09/10')
and UListaPresenca.DataAula ='09/04/2009'
and UListaPresenca.Status = 'N' and UMatricpl.PerLetivo ='09/10'
and UMatricPL.CodCur = 2 and UMatricPL.CodPer = 1
and Umatricpl.Periodo >= '1')


/* Diferença no Secondary */

Select distinct 
	EAluOcor.MatAluno, Ealunos.Nome, EAluOcor.status, UMatricPL.CodCur,  UMatricPL.CODPER, Periodo
from EAluOcor
	inner Join UMatricPL (Nolock) on (UmatricPL.MatAluno =  EAluOcor.MatAluno)
	Inner join EAlunos (Nolock) on (EAlunos.Matricula = EAluOcor.MatAluno)
where EAluOcor.Data ='09/04/2009'
and  EAluOcor.Status in ('A', 'AE','P', 'PE') 
and UMatricpl.PerLetivo ='09/10'
and ((UMatricPL.CodCur = 2 and UMatricPL.CodPer = 2) or UMatricPL.CodCur = 3)
and UMatricpl.Periodo >= '1'
and EAluOcor.MatAluno not in 
(
Select distinct
	ISC.dbo.attendance.Matricula
from isc.dbo.attendance  
Inner Join EACompl (NoLock) on (EACompl.Matricula = ISC.dbo.attendance.Matricula)
Inner join EAlunos (Nolock) on (EAlunos.Matricula = ISC.dbo.attendance.Matricula)
inner Join UMatricPL (Nolock) on (UmatricPL.MatAluno = ISC.dbo.attendance.Matricula)
Left Join EAluOcor (Nolock) on (EAluOcor.MatAluno = ISC.dbo.attendance.Matricula and EaluOcor.Data = ISC.dbo.attendance.Data)
Where ISC.dbo.Attendance.Data ='09/04/2009'
and ((UMatricPL.CodCur = 2 and UMatricPL.CodPer = 2) or UMatricPL.CodCur = 3)
and ISC.dbo.attendance.Status = 1 and UMatricpl.PerLetivo ='09/10'
and Umatricpl.Periodo >= '1')


/* Diferença no ECC */
Select distinct
	UListaPresenca.MatAluno, Ealunos.Nome, EAluOcor.status, EAluOcor.status, UMatricPL.CodCur,  UMatricPL.CODPER, Periodo
from UListaPresenca 
Inner Join EACompl (NoLock) on (EACompl.Matricula = UListaPresenca.MatAluno)
Inner join EAlunos (Nolock) on (EAlunos.Matricula = UListaPresenca.MatAluno)
inner Join UMatricPL (Nolock) on (UmatricPL.MatAluno =  UListaPresenca.MatAluno)
Left Join EAluOcor (Nolock) on (EAluOcor.MatAluno = UListaPresenca.MatAluno and EaluOcor.Data = UListaPresenca.DataAula)
Where UListaPresenca.CodMat in (Select UMatTurSl.CodMat from UMatTurSl where Substring(Cast(UMatTurSl.CodHor as Char(4)),3,4) ='01' and UMatTurSl.CodPerLet ='09/10')
and UListaPresenca.DataAula ='09/04/2009'
and UMatricPL.CodCur = 1 and UMatricPL.CodPer = 1
and UListaPresenca.Status = 'N' and UMatricpl.PerLetivo ='09/10'
and Umatricpl.Periodo >= '1'
and UListaPresenca.MatAluno not in(
Select distinct 
	EAluOcor.MatAluno 
from EAluOcor
	inner Join UMatricPL (Nolock) on (UmatricPL.MatAluno =  EAluOcor.MatAluno)
where EAluOcor.Data ='09/04/2009'
and  EAluOcor.Status in ('A', 'AE','P', 'PE') 
and UMatricPL.CodCur = 1 and UMatricPL.CodPer = 1
and UMatricpl.PerLetivo ='09/10'
and UMatricpl.Periodo >= '1')


/* Diferença TOTAL */

Select distinct
	UListaPresenca.MatAluno, Ealunos.Nome, EAluOcor.status, EAluOcor.status, UMatricPL.CodCur,  UMatricPL.CODPER, Periodo
from UListaPresenca 
Inner Join EACompl (NoLock) on (EACompl.Matricula = UListaPresenca.MatAluno)
Inner join EAlunos (Nolock) on (EAlunos.Matricula = UListaPresenca.MatAluno)
inner Join UMatricPL (Nolock) on (UmatricPL.MatAluno =  UListaPresenca.MatAluno)
Left Join EAluOcor (Nolock) on (EAluOcor.MatAluno = UListaPresenca.MatAluno and EaluOcor.Data = UListaPresenca.DataAula)
Where UListaPresenca.CodMat in (Select UMatTurSl.CodMat from UMatTurSl where Substring(Cast(UMatTurSl.CodHor as Char(4)),3,4) ='01' and UMatTurSl.CodPerLet ='09/10')
and UListaPresenca.DataAula ='09/04/2009'
and UListaPresenca.Status = 'N' and UMatricpl.PerLetivo ='09/10'
and Umatricpl.Periodo >= '1'
and UListaPresenca.MatAluno not in(
Select distinct 
	EAluOcor.MatAluno 
from EAluOcor
	inner Join UMatricPL (Nolock) on (UmatricPL.MatAluno =  EAluOcor.MatAluno)
where EAluOcor.Data ='09/04/2009'
and  EAluOcor.Status in ('A', 'AE','P', 'PE') 
and UMatricpl.PerLetivo ='09/10'
and UMatricpl.Periodo >= '1')