Select * from GAUTOINC where CODAUTOINC = 'contrato'

Select top 1
	CONTRATO +1 
from 
	EALUSERV
where PERLETIVO = '13/14' 
ORDER BY CONTRATO desc



SELECT DISTINCT
	UMATALUN.CODFILIAL,
	UMATALUN.PERLETIVO,
	UMATALUN.MATALUNO,
	'#CONTRATO' AS NUMEROCONTRATO,
	'PLANO' AS NOVOPLANO,
	EALUSERV.PLANO,
	EALUSERV.CATIVO,
	EALUSERV.STATUS,
	UMATALUN.CODCUR,
	UMATALUN.CODPER,
	'' AS CODTURNO,
	EALUSERV.ASSINADO,
	EALUSERV.DATACONTRATO,
	EALUSERV.DTASSINATURA,
	UMATALUN.CODTUR,
	EALUSERV.DIAVENCIMENTO,
	EALUSERV.DIAFIXO,
    Substring(Utabtipo.Descricao,1,13) as Classificacao
FROM 
	UMATALUN
INNER JOIN EALUSERV (NOLOCK) ON (EALUSERV.MATALUNO = UMATALUN.MATALUNO AND EALUSERV.PERLETIVO = '12/13')
INNER JOIN EALUNOS (NOLOCK) ON (EALUNOS.MATRICULA = UMATALUN.MATALUNO)
Left Join Utabtipo (NoLock) on (utabtipo.CodTipo = Ealunos.TipoAluno)
WHERE 
	UMATALUN.PERLETIVO = '13/14'
AND UMATALUN.STATUS IN ('01', '07')
AND UMATALUN.CODCUR > 1
ORDER BY UMATALUN.MATALUNO




select *
from EALUBOLSA
WHERE PERLETIVO = '12/13'
AND CODBOL NOT IN ('050','100','101',400,401)
ORDER BY CODBOL DESC



-- DESCONTO DO FUNDO DESENVOLVIMENTO DO KINDER COM OS VALORES PAGOS NO TODDLER AO PRE-KINDE 
SELECT MATALUNO, SUM(VALORTOT), (Select CONTRATO from EALUSERV WHERE EALUSERV.MATALUNO = EDESCLAN.MATALUNO AND EALUSERV.PERLETIVO = '13/14' AND EALUSERV.PLANO LIKE 'FD%')
FROM EDESCLAN
WHERE MATALUNO IN (
SELECT 
	MATALUNO
FROM 
	UMATRICPL
WHERE
	UMATRICPL.PERLETIVO = '13/14'
AND UMATRICPL.STATUS IN ('01', '07')
AND UMATRICPL.CODCUR = 1
AND UMATRICPL.CODPER = 1
AND UMATRICPL.PERIODO = 4)
AND EDESCLAN.TIPOLANC = 7
AND EDESCLAN.PERLETIVO <> '13/14'
GROUP BY MATALUNO

select * from EALUBOLSA where MATALUNO = 00417