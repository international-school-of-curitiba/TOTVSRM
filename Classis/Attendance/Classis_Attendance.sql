

Select SegundoNome, UCursos.CodCur,
    (Select Count(*) from VW_Attendance where VW_Attendance.CodCur = UCursos.CodCur and CodPer = '1' and quantidade =0) as '0',
	(Select Count(*) from VW_Attendance where VW_Attendance.CodCur = UCursos.CodCur and CodPer = '1' and quantidade >=1 and quantidade <=5) as '1 - 5',
	(Select Count(*) from VW_Attendance where VW_Attendance.CodCur = UCursos.CodCur and CodPer = '1' and quantidade >=6 and quantidade <=10)as '6 - 10',
	(Select Count(*) from VW_Attendance where VW_Attendance.CodCur = UCursos.CodCur and CodPer = '1' and quantidade >=11 and quantidade <=19)as '11 - 19',
	(Select Count(*) from VW_Attendance where VW_Attendance.CodCur = UCursos.CodCur and CodPer = '1' and quantidade >=20) as '20 +'
from UCursos


Select Habilitacao,
	Round(((Select Cast(Count(*) as Decimal (5,1)) from VW_Attendance where VW_Attendance.CodCur = UPeriodos.CodCur and VW_Attendance.CodPer = UPeriodos.CodPer and quantidade =0)/ (Select Cast(Count(*) as Decimal (5,1)) from VW_Attendance where VW_Attendance.CodCur = UPeriodos.CodCur and VW_Attendance.CodPer = UPeriodos.CodPer)) * 100,2)  as '0',
	Round(((Select Cast(Count(*) as Decimal (5,1)) from VW_Attendance where VW_Attendance.CodCur = UPeriodos.CodCur and VW_Attendance.CodPer = UPeriodos.CodPer and quantidade >=1 and quantidade <=5) / (Select Cast(Count(*) as Decimal (5,1)) from VW_Attendance where VW_Attendance.CodCur = UPeriodos.CodCur and VW_Attendance.CodPer = UPeriodos.CodPer)) * 100,2) as '1 - 5',
	Round(((Select Cast(Count(*) as Decimal (5,1)) from VW_Attendance where VW_Attendance.CodCur = UPeriodos.CodCur and VW_Attendance.CodPer = UPeriodos.CodPer and quantidade >=6 and quantidade <=10)/ (Select Cast(Count(*) as Decimal (5,1)) from VW_Attendance where VW_Attendance.CodCur = UPeriodos.CodCur and VW_Attendance.CodPer = UPeriodos.CodPer)) * 100,2) as '6 - 10',
	Round(((Select Cast(Count(*) as Decimal (5,1)) from VW_Attendance where VW_Attendance.CodCur = UPeriodos.CodCur and VW_Attendance.CodPer = UPeriodos.CodPer and quantidade >=11 and quantidade <=19)/(Select Cast(Count(*) as Decimal (5,1)) from VW_Attendance where VW_Attendance.CodCur = UPeriodos.CodCur and VW_Attendance.CodPer = UPeriodos.CodPer)) * 100,2) as '11 - 19',
	Round(((Select Cast(Count(*) as Decimal (5,1)) from VW_Attendance where VW_Attendance.CodCur = UPeriodos.CodCur and VW_Attendance.CodPer = UPeriodos.CodPer and quantidade >=20)/(Select Cast(Count(*) as Decimal (5,1)) from VW_Attendance where VW_Attendance.CodCur = UPeriodos.CodCur and VW_Attendance.CodPer = UPeriodos.CodPer)) * 100,2) as '20 +'
from UPeriodos

Select * from UPeriodos
Select * from VW_Attendance 
where ((Codcur = '2' and Codper = '1') )--or (Codcur = '3' and Codper = '1'))
order by quantidade

/* 
CREATE View [dbo].[VW_Attendance] 
AS
	Select Distinct
		(Select A_NomeReduzido from EAcompl where EACompl.Matricula = Umatricpl.Mataluno) as Nome,
		(Select top 1 UMATALUN.CODTUR from UMatAlun where UMatAlun.MatAluno = Umatricpl.Mataluno and UMatAlun.Perletivo = UMatricPL.Perletivo Group by UMatAlun.CodTur Order by count(UMatAlun.CodTur) desc) as Grade_Level,
		(Select Count(*) from EAluOcor Where CodPerLet = Umatricpl.PerLetivo and Mataluno = Umatricpl.Mataluno and  EAluOcor.Status in ('A','P') and EAluOcor.CodOcorrencia >= '1') as Quantidade,
		Codcur, Codper
	from Umatricpl
	Where Umatricpl.PerLetivo = '06/07'
	and UmatricPl.Status in ('01', '07')
	--and ((Codcur = '2' and Codper = '2') or (Codcur = '3' and Codper = '1'))
	--order by Quantidade







Select distinct
	UListaPresenca.MatAluno,
	EACompl.A_NomeReduzido, 
	UListaPresenca.CodTur, EAlunos.TelAluno, 
 	Case when EAluOcor.Status in ('A','AE') then 'x' end as Absence,
 	Case when EAluOcor.Status in ('T','TE') then 'x' end as Tardy,
 	Case when EAluOcor.Status in ('P','PE') then 'x' end as PreArrenge,
	Cast(EaluOcor.Observacao as Char(50)) as Reason,
	UMatricpl.Periodo, UMatricpl.CodCur, UMatricpl.Codper
from UListaPresenca 
Inner Join EACompl (NoLock) on (EACompl.Matricula = UListaPresenca.MatAluno)
Inner join EAlunos (Nolock) on (EAlunos.Matricula = UListaPresenca.MatAluno)
inner Join UMatricPL (Nolock) on (UmatricPL.MatAluno =  UListaPresenca.MatAluno)
Left Join EAluOcor (Nolock) on (EAluOcor.MatAluno = UListaPresenca.MatAluno and EaluOcor.Data = UListaPresenca.DataAula)
Where UListaPresenca.CodMat in (Select UMatTurSl.CodMat from UMatTurSl where Substring(Cast(UMatTurSl.CodHor as Char(4)),3,4) ='01' and UMatTurSl.CodPerLet ='06/07')
and UListaPresenca.DataAula >= '08/01/2006'
and UListaPresenca.Status = 'N' and UMatricpl.PerLetivo ='06/07'
and Umatricpl.Periodo >= '6'
Order By UMatricpl.Periodo,UMatricpl.CodCur, UMatricpl.Codper, UListaPresenca.CodTur



*/ 