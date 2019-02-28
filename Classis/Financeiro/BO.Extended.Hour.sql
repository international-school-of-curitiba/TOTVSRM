Declare @DataInicio as date
Declare @DataFimDia as date
set @DataInicio = '10/01/2014'
set @DataFimDia = '10/02/2014 17:00'

Select 
	extended.matricula, @DataInicio,
	(select Aluno.NOME from Corpore.dbo.EALUNOS Aluno where Aluno.Matricula = extended.matricula),
	extended.data as Entrada,
	(select extende_out.data from extended extende_out where extende_out.matricula = extended.matricula and extende_out.status = 2 and extende_out.data between @DataInicio and @DataFimDia)  as Saida,
	Datediff(MINUTE,extended.data, isnull((select extende_out.data from extended extende_out where extende_out.matricula = extended.matricula and extende_out.status = 2 and extende_out.data between @DataInicio and @DataFimDia), @DataFimDia  ))

from 
	extended
where 
	extended.data between @DataInicio and @DataFimDia
and extended.status = 1



/*	3:30PM – 4:45PM
	3:30PM – 4:15PM
	4:15PM – 4:45PM 
*/
