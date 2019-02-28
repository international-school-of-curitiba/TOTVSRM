Declare @DataInicio as DATETIME
Declare @DataFim as DATETIME


set @DataInicio = '08/01/2018'
set @DataFim = '12/04/2018'


select 
	ExH.matricula,
	(select nome from Ealunos where ealunos.MATRICULA = ExH.matricula) as nome,
	cast(ExH.student_in as date) as Date,
	ExH.student_in, ExH.student_out,
	datediff(minute,ExH.student_in, ExH.student_out) TimeInMinutes,
	CASE 
		WHEN (CAST(ExH.student_in AS time) >= '15:30:00' AND CAST(ExH.student_out AS TIME) <= '16:55:00') THEN '21.40'
		WHEN (CAST(ExH.student_in AS time) >= '16:15:00' AND CAST(ExH.student_out AS TIME) <= '16:55:00') THEN '16.05'
		WHEN (CAST(ExH.student_in AS time) >= '15:30:00' AND CAST(ExH.student_out AS TIME) >= '16:15:00') THEN '20.00'
	ELSE '0'
	END AS VALUE,
	CASE WHEN CAST(ExH.student_out AS time) >= '16:56:00' THEN '+20' ELSE '-' END AS EXTRA1,
	CASE WHEN CAST(ExH.student_out AS time) >= '17:11:00' THEN '+20' ELSE '-' END AS EXTRA2

	/*
	Case 
		When datediff(minute,ExH.student_in, ExH.student_out) <='30' then 10.00
		When datediff(minute,ExH.student_in, ExH.student_out) > '30' then 15.00
	end as Valor*/
from 
	isc.dbo.extended_hour as ExH
where 
	ExH.student_in between @DataInicio and @DataFim
and ExH.student_out is not null
and datediff(minute,ExH.student_in, ExH.student_out) >= 10

order by Nome
