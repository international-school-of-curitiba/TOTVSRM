
/* 
Select 
	rtrim(NOME),
	PESSOA1,
	PESSOA2,
	A_NACIONAL1 as Quebra$,
	A_NACIONAL2 AS NAT,
	(Select Case when PPessoa.Apelido is null then PPessoa.Nome  when substring(PPessoa.Apelido,1,4) = 'Mr.' then PPessoa.Nome else PPessoa.Apelido end From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1) as Nome,
	(Select PPessoa.Email From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1) as Email,
	(Select '(' + Substring(PPessoa.Telefone1,1,2) + ')' + Substring(PPessoa.Telefone1,3,4) + '-' + Substring(PPessoa.Telefone1,7,4) From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1) as Phone,
	(Select '(' + Substring(PPessoa.Telefone2,1,2) + ')' + Substring(PPessoa.Telefone2,3,4) + '-' + Substring(PPessoa.Telefone2,7,4) From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1) as Celphone,

	(Select Case when PPessoa.Apelido is null then PPessoa.Nome  when substring(PPessoa.Apelido,1,4) = 'Mr.' then PPessoa.Nome else PPessoa.Apelido end From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2) as Nome,
	(Select PPessoa.Email From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2) as Email,
	(Select '(' + Substring(PPessoa.Telefone1,1,2) + ')' + Substring(PPessoa.Telefone1,3,4) + '-' + Substring(PPessoa.Telefone1,7,4) From PPessoa Where PPessoa.Codigo = ZFamilia.PESSOA2) as Phone,
	(Select '(' + Substring(PPessoa.Telefone2,1,2) + ')' + Substring(PPessoa.Telefone2,3,4) + '-' + Substring(PPessoa.Telefone2,7,4) From PPessoa Where PPessoa.Codigo = ZFamilia.PESSOA2) as Celphone
from ZFAMILIA
inner join EACOMPL (NoLock) on ( EACOMPL.MATRICULA = ZFAMILIA.MATRICULA)
where PERLETIVO = '14/15'
and ZFAMILIA.STATUS in ('01','07')

Group by NOME, PESSOA1, PESSOA2, A_NACIONAL1, A_NACIONAL2
Order by A_NACIONAL1
*/


Select
	RTRIM(ZFAMILIA.NOME) as FamilyName,
	EACOMPL.A_NOMEREDUZIDO as ChildName,
	(Select top 1 UMATALUN.CODTUR from UMatAlun where UMatAlun.Status in('01','07','04','14','06') and UMatAlun.MatAluno = EACOMPL.Matricula and UMatAlun.Perletivo = ZFAMILIA.Perletivo Group by UMatAlun.CodTur, UMatAlun.CODCUR Order by count(UMatAlun.CodTur) desc) as Grade_Level,
	RTRIM(A_NACIONAL1) as ChildNationality,
	RTRIM(A_NACIONAL2) as ChildNationality2,
	(Select Case when PPessoa.Apelido is null then PPessoa.Nome  when substring(PPessoa.Apelido,1,4) = 'Mr.' then PPessoa.Nome else PPessoa.Apelido end From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1) as Nome,
	RTRIM(EACOMPL.A_NACIONALPAI),
	(Select PPessoa.Email From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1) as Email,
	(Select '(' + Substring(PPessoa.Telefone1,1,2) + ')' + Substring(PPessoa.Telefone1,3,4) + '-' + Substring(PPessoa.Telefone1,7,4) From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1) as Phone,
	(Select '(' + Substring(PPessoa.Telefone2,1,2) + ')' + Substring(PPessoa.Telefone2,3,4) + '-' + Substring(PPessoa.Telefone2,7,4) From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1) as Celphone,
	
	(Select Case when PPessoa.Apelido is null then PPessoa.Nome  when substring(PPessoa.Apelido,1,4) = 'Mr.' then PPessoa.Nome else PPessoa.Apelido end From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2) as Nome,
	RTRIM(EACOMPL.A_NACIONALMAE),
	(Select PPessoa.Email From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2) as Email,
	(Select '(' + Substring(PPessoa.Telefone1,1,2) + ')' + Substring(PPessoa.Telefone1,3,4) + '-' + Substring(PPessoa.Telefone1,7,4) From PPessoa Where PPessoa.Codigo = ZFamilia.PESSOA2) as Phone,
	(Select '(' + Substring(PPessoa.Telefone2,1,2) + ')' + Substring(PPessoa.Telefone2,3,4) + '-' + Substring(PPessoa.Telefone2,7,4) From PPessoa Where PPessoa.Codigo = ZFamilia.PESSOA2) as Celphone,
	case 
		when EALUNOS.TIPOALUNO in (1,2) then 'LOCAL/TEMP'
		when EALUNOS.TIPOALUNO in (3,4) then 'CORPORATE'
		when EALUNOS.TIPOALUNO = 5 then 'STAFF'
		when EALUNOS.TIPOALUNO = 6 then 'Scholarship'
	END as Tipo	
	
from ZFAMILIA
inner join EACOMPL (NoLock) on ( EACOMPL.MATRICULA = ZFAMILIA.MATRICULA)
inner join EALUNOS (Nolock) on ( EALUNOS.MATRICULA = ZFAMILIA.MATRICULA)
where PERLETIVO = '14/15'
and ZFAMILIA.STATUS in ('01','07')

--Group by NOME, PESSOA1, PESSOA2, A_NACIONAL1, 
Order by ChildNationality, FamilyName