/* 
Alter function dbo.func_StudentAttendance
	(@SchoolYear nvarchar(5))
Returns Table
AS
Return(
Select 
  EaluOcor.MatAluno, sum(EaluOcor.CodColigada) as 'QuantidadeFaltas',
  UmatricPl.Codcur, UmatricPl.Codper
from EAluOcor 
inner join Umatricpl (NoLock) on (Umatricpl.MatAluno = EAluOcor.MatAluno and UMatricpl.Perletivo = EaluOcor.CodPerLet)
Where EaluOcor.CodPerLet =@SchoolYear
and EAluOcor.Status in ('A','P') 
and EAluOcor.CodOcorrencia >= '1'
and UmatricPl.Status in ('01','02', '03', '04', '07')
Group By EaluOcor.MatAluno, UmatricPl.Codcur, UmatricPl.Codper)
*/

Select top 1	
	Round((Select Count(*) from func_StudentAttendance('07/08') where Codcur = 1 and QuantidadeFaltas between 1 and 5 ) /
	(Select Count(*) from Umatricpl where Perletivo = '07/08' and CodCur = 1 and UmatricPl.Status in ('01', '02', '03', '04', '07')),2)
	'ECC 1 to 5',
	(Select count(*) from func_StudentAttendance('07/08') where Codcur = 1 and QuantidadeFaltas between 6 and 10) 'ECC 6 to 10',
	(Select count(*) from func_StudentAttendance('07/08') where Codcur = 1 and QuantidadeFaltas between 11 and 19)'ECC 11 to 19',
	(Select count(*) from func_StudentAttendance('07/08') where Codcur = 1 and QuantidadeFaltas >= 20 ) 'ECC Greater 20',
	(Select Count(*) from Umatricpl where Perletivo = '07/08' and CodCur = 1 and UmatricPl.Status in ('01', '02', '03', '04', '07')) 'ECC Total',
	(Select Count(*) from func_StudentAttendance('07/08') where Codcur = 2 and CodPer = 1 and QuantidadeFaltas between 1 and 5 ) 'Elem 1 to 5',
	(Select count(*) from func_StudentAttendance('07/08') where Codcur = 2 and CodPer = 1 and QuantidadeFaltas between 6 and 10) 'Elem 6 to 10',
	(Select count(*) from func_StudentAttendance('07/08') where Codcur = 2 and CodPer = 1 and QuantidadeFaltas between 11 and 19)'Elem 11 to 19',
	(Select count(*) from func_StudentAttendance('07/08') where Codcur = 2 and CodPer = 1 and QuantidadeFaltas >= 20 ) 'Elem Greater 20',
	(Select Count(*) from Umatricpl where Perletivo = '07/08' and CodCur = 2 and CodPer = 1 and UmatricPl.Status in ('01', '02', '03', '04', '07')) 'Elem Total',
	(Select Count(*) from func_StudentAttendance('07/08') where ((Codcur = 2 and CodPer = 2) or (Codcur = 3 and CodPer = 1)) and QuantidadeFaltas between 1 and 5 ) 'Sec 1 to 5',
	(Select count(*) from func_StudentAttendance('07/08') where ((Codcur = 2 and CodPer = 2) or (Codcur = 3 and CodPer = 1)) and QuantidadeFaltas between 6 and 10) 'Sec 6 to 10',
	(Select count(*) from func_StudentAttendance('07/08') where ((Codcur = 2 and CodPer = 2) or (Codcur = 3 and CodPer = 1)) and QuantidadeFaltas between 11 and 19)'Sec 11 to 19',
	(Select count(*) from func_StudentAttendance('07/08') where ((Codcur = 2 and CodPer = 2) or (Codcur = 3 and CodPer = 1)) and QuantidadeFaltas >= 20 ) 'Sec Greater 20',
	(Select Count(*) from Umatricpl where Perletivo = '07/08' and ((Codcur = 2 and CodPer = 2) or (Codcur = 3 and CodPer = 1)) and UmatricPl.Status in ('01', '02', '03', '04', '07')) 'Sec Total'
from Ealunos


/*

Select 
  EaluOcor.MatAluno, sum(EaluOcor.CodColigada) as 'QuantidadeFaltas',
  UmatricPl.Codcur, UmatricPl.Codper
from EAluOcor 
inner join Umatricpl (NoLock) on (Umatricpl.MatAluno = EAluOcor.MatAluno and UMatricpl.Perletivo = EaluOcor.CodPerLet)
Where EaluOcor.CodPerLet ='07/08'
and EAluOcor.Status in ('A','P') 
and EAluOcor.CodOcorrencia >= '1'
and ((UmatricPl.Codcur = 2 and UmatricPl.CodPer = 3) or (UmatricPl.Codcur = 3 and UmatricPl.CodPer = 1))
and UmatricPl.Status in ('01', '07', '04')
Group By EaluOcor.MatAluno, UmatricPl.Codcur, UmatricPl.Codper

Select Count(*) from Umatricpl 
where Perletivo = '07/08' 
and ((Codcur = 2 and CodPer = 2)or (Codcur = 3 and CodPer = 1)) 
and UmatricPl.Status in ('01', '07','02','03', '04')
*/


