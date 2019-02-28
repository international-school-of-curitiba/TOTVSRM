Select Distinct
	 /* Dados do Aluno */
	Ealunos.nome, 
	EACompl.A_NomeIng,
	EAcompl.A_NomeReduzido,
	(Select top 1 Umatalun.CodTur from UMatAlun where EAlunos.matricula = UMatAlun.MatAluno) as Grade_Level,
	Case When EACompl.A_Nacional3 is null and EACompl.A_Nacional2 is null then EACompl.A_Nacional1
		When EACompl.A_Nacional3 is null and EACompl.A_Nacional2 is not null then EACompl.A_Nacional1 + '/'+ EACompl.A_Nacional2
		When EACompl.A_Nacional3 is not null and EACompl.A_Nacional2 is not null then EACompl.A_Nacional1 + '/'+ EACompl.A_Nacional2 + '/' + Eacompl.A_Nacional3
		end as Nationality,
	Case when Ealunos.Sexo = 'M' then 'Male' else 'Female' end as Gender, 
	DateDiff(yy, Ealunos.DtNasc, GETDATE()) -
		(case when (datepart(m, Ealunos.DtNasc) > datepart(m, GetDate())) or
			(datepart(m, Ealunos.DtNasc) = datepart(m, Getdate()) And 
			 datepart(d, Ealunos.DtNasc) > datepart(d, Getdate()))
			 then 1
	  		 else 0
		end) 
	as Idade,
	Ealunos.dtnasc,
	EAlunos.CertNasc, EAlunos.CNDistrito, EAlunos.CNComarca,
	/* Dados da Mae */
	(Select PPessoa.Nome from PPessoa where PPessoa.codigo = Ealunos.mae) as Nome_mae,
	(Select CASE when (Telefone2 is not null) then 'Cellular: ' + PPessoa.Telefone2 Else '' End as Cel_mae from PPessoa where PPessoa.codigo = Ealunos.mae) as Cel_mae,
	(Select CASE when (telefone3 is not null) then 'Office: ' + Telefone3 Else 'No Office #' End as Office_Mae from Ppessoa where PPessoa.codigo = Ealunos.mae) as Office_Mae,
	(Select CASE when (Email is not null) then 'E-mail: ' + PPessoa.email Else 'No E-mail' End as Email_mae from PPessoa where PPessoa.codigo = Ealunos.mae) as Email_mae,
	/* Dados do Pai */
	(Select PPessoa.Nome from PPessoa where PPessoa.codigo = Ealunos.pai) as Nome_Pai,
	(Select CASE when (Telefone2 is not null) then 'Cellular: ' + PPessoa.Telefone2 Else '' End as Cel_pai from PPessoa where PPessoa.codigo = Ealunos.pai) as Cel_pai,
	(Select CASE when (telefone3 is not null) then 'Office: ' + Telefone3 Else 'No Office #' End as Office_pai from Ppessoa where PPessoa.codigo = Ealunos.pai) as Office_pai,
	(Select CASE when (Email is not null) then 'E-mail: ' + PPessoa.email Else 'No E-mail' End as Email_pai from PPessoa where PPessoa.codigo = Ealunos.pai) as Email_pai,
	CASE
           WHEN (Ealunos.Compendal is null) THEN Ealunos.EndAluno + ', ' + EAlunos.Numendalun
	   ELSE Ealunos.EndAluno + ', ' + EAlunos.Numendalun + ' - ' + Ealunos.Compendal
	End As End_Principal, 
	Ealunos.BairroAlun + ' - ' + Ealunos.Cidaluno + ' - ' +	Ealunos.ufAluno AS End_Secundario,
	Ealunos.Cepaluno, Ealunos.TelAluno,
	UMatricpl.CodCur, UMatricpl.Periodo
from	Ealunos
	Left Join Umatricpl (NoLock) on (Ealunos.matricula = Umatricpl.mataluno)
	Left Join Umatalun (NoLock) on (Umatricpl.mataluno = Umatalun.mataluno)
	Left Join EACompl (NoLock) on ( EAcompl.Matricula = EAlunos.Matricula) 
Where 	
 	Umatricpl.Perletivo = '05/06'
and 	Umatricpl.Status = '01'
and EACompl.A_Nacional1 = ('Japanese')
and	Umatalun.codtur in ('Toddler A', 'Toddler B', 'Nursery A', 'Nursery B', 'PK A', 'PK B', 'Kinder A', 'Kinder B')
Order By UMatricpl.CodCur, UMatricpl.Periodo, Grade_Level
