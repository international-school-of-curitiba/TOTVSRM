Select *, UTabTipo.Descricao + ' Families' From UTabTipo Where UTabTipo.CodTipo = '3'


Select distinct
	Case When ZFamilia.lingua = 'Portuguese' then 'Família ' + RTrim(ZFamilia.Nome)
	Else RTrim(ZFamilia.Nome) + ' Family' End,
	ZFamilia.Pessoa1,
	ZFamilia.Pessoa2, ZFamilia.Nome
From ZFamilia
INNER JOIN EAlunos (NoLock) ON (EAlunos.Matricula = ZFamilia.Matricula)
Where ZFamilia.PerLetivo ='05/06'
and ZFamilia.Status in ('01','07')
and Ealunos.TipoAluno = '2'
Order by ZFamilia.Nome


Select 
	PPessoa.Nome,
	CASE when (Telefone1 is not null) then 'Home Phone: ' + PPessoa.Telefone1 Else '' END,
	CASE when (Telefone2 is not null) then 'Cell Phone: ' + PPessoa.Telefone2 Else '' END,
	CASE when (telefone3 is not null) then 'Work Phone: ' + Telefone3 Else 'No Office #' End,
	CASE when (Email is not null) then 'E-mail: ' + PPessoa.email Else 'No E-mail' End
From PPessoa
Where PPessoa.Codigo = '569'


SELECT DISTINCT
	Ealunos.Matricula,
	EAlunos.Nome,
	'(' + UMATALUN.CODTUR + ')', EALUNOS.DTNASC
FROM
	ZFAMILIA
	INNER JOIN EALUNOS ON (ZFAMILIA.MATRICULA = EALUNOS.MATRICULA)
	INNER JOIN UMATRICPL ON (EALUNOS.MATRICULA = UMATRICPL.MATALUNO)
	INNER JOIN UMATALUN ON (UMATRICPL.MATALUNO = UMATALUN.MATALUNO)
WHERE
	ZFAMILIA.PESSOA1 =:ESPELHO#2
	AND ZFAMILIA.PESSOA2 =:ESPELHO#3
	AND UMATRICPL.PERLETIVO =:ESPELHO#1
	AND UMATRICPL.STATUS IN ('01', '07')
	AND EALUNOS.TIPOALUNO =:ESPELHO#4
Order by 
	EALUNOS.DTNASC Desc



/*
select distinct
	Ealunos.TipoAluno, UTabTipo.Descricao, EAcompl.A_Familia, Eacompl.A_Publica,
	-- Dados da Mae 
	(Select PPessoa.Nome from PPessoa where PPessoa.codigo = Ealunos.mae) as Nome_mae,
	(Select CASE when (Telefone2 is not null) then 'Cellular: ' + PPessoa.Telefone2 Else '' End as Cel_mae from PPessoa where PPessoa.codigo = Ealunos.mae) as Cel_mae,
	(Select CASE when (telefone3 is not null) then 'Office: ' + Telefone3 Else 'No Office #' End as Office_Mae from Ppessoa where PPessoa.codigo = Ealunos.mae) as Office_Mae,
	(Select CASE when (Email is not null) then 'E-mail: ' + PPessoa.email Else 'No E-mail' End as Email_mae from PPessoa where PPessoa.codigo = Ealunos.mae) as Email_mae,
	-- Dados do Pai 
	(Select PPessoa.Nome from PPessoa where PPessoa.codigo = Ealunos.pai) as Nome_Pai,
	(Select CASE when (Telefone2 is not null) then 'Cellular: ' + PPessoa.Telefone2 Else '' End as Cel_pai from PPessoa where PPessoa.codigo = Ealunos.pai) as Cel_pai,
	(Select CASE when (telefone3 is not null) then 'Office: ' + Telefone3 Else 'No Office #' End as Office_pai from Ppessoa where PPessoa.codigo = Ealunos.pai) as Office_pai,
	(Select CASE when (Email is not null) then 'E-mail: ' + PPessoa.email Else 'No E-mail' End as Email_pai from PPessoa where PPessoa.codigo = Ealunos.pai) as Email_pai,
	-- Dados do Aluno 
	(Select top 1 EAlunos.Nome from EAlunos where EAcompl.matricula = EAlunos.matricula) as Nome_Aluno, 
	(Select top 1 Umatalun.CodTur from UMatAlun where EAlunos.matricula = UMatAlun.MatAluno) as Grade_Level, 
	CASE
           WHEN (Ealunos.Compendal is null) THEN Ealunos.EndAluno + ', ' + EAlunos.Numendalun
	   ELSE Ealunos.EndAluno + ', ' + EAlunos.Numendalun + ' - ' + Ealunos.Compendal
	End As End_Principal, 
	Ealunos.BairroAlun + ' - ' + Ealunos.Cidaluno + ' - ' +	Ealunos.ufAluno + ' - ' + Ealunos.PaisAluno AS End_Secundario,
	Ealunos.Cepaluno, EAlunos.TelAluno, EAcompl.A_Familia 
from 	EAcompl (Nolock)
	left join Ealunos 	(nolock) on (EAcompl.matricula = Ealunos.matricula)
	left join Ualucurso 	(Nolock) on (Ualucurso.Mataluno = Ealunos.matricula)
	left join Eirmaos 	(Nolock) on (Eirmaos.Mataluno = Ealunos.Matricula)
	left join Umatricpl 	(NoLock) on (Umatricpl.mataluno = Ealunos.matricula)
	left join PPessoa 	(NoLock) on (PPessoa.codigo = Ealunos.mae)
	Left Join UTabTipo	(NoLock) on (UTabTipo.CodTipo = EAlunos.TipoAluno)
Where 	Ualucurso.status in ('01','07')
	AND Ealunos.TipoAluno = '1'
Order by  
	EAcompl.A_Familia 
*/
