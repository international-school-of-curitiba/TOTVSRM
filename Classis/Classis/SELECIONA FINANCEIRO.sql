SELECT MATRICULA, EALUNOS.NOME, RESPONS, FCFO.NOME FROM EALUNOS, FCFO WHERE RESPONS=CODCFO AND FCFO.NOME IN 
(
SELECT DISTINCT NOME 
FROM FCFO 
GROUP BY NOME
HAVING COUNT(FCFO.NOME) >1
)
ORDER BY FCFO.NOME










SELECT MATRICULA, EALUNOS.NOME, RESPONS, FCFO.NOME FROM EALUNOS, FCFO WHERE EALUNOS.RESPONS IS not  FCFO.CODCFO
ORDER BY EALUNOS.RESPONS


SELECT * FROM EALUNOS WHERE RESPONS='C00164'

SELECT * FROM FCFO WHERE CODCFO NOT IN 
(SELECT DISTINCT CODCFO FROM FCFO WHERE CODCFO IN (SELECT DISTINCT RESPONS FROM EALUNOS))
