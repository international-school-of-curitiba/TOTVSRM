Select 
	UMatAlun.CodMat,
	UMaterias.Materia,
	UMatAlun.A1,
	UMatAlun.A2,
	UMatAlun.A6,
	UMatAlun.A7,
	UMatAlun.A0
from 
	UMatAlun
	INNER JOIN UMATERIAS (NOLOCK) ON (UMATERIAS.CODMAT = UMATALUN.CODMAT)
Where	UMatAlun.Perletivo = '06/07'
and	UMatAlun.MatAluno = '00007'
and	UMatAlun.CodMat IN (SELECT CODMAT FROM UMATERIAS WHERE SEGUNDONOME = 'US')
ORDER BY UMATERIAS.POSHIST

/*    materias de uma turma 
SELECT DISTINCT
	UMATALUN.CODMAT, UMATERIAS.MATERIA, UMATERIAS.POSHIST
FROM UMATALUN
INNER JOIN UMATERIAS (NOLOCK) ON (UMATERIAS.CODMAT = UMATALUN.CODMAT)
WHERE UMATALUN.PERLETIVO = '06/07'
AND UMatAlun.MatAluno = '00007'
AND UMATALUN.CODMAT IN (SELECT CODMAT FROM UMATERIAS WHERE SEGUNDONOME = 'US')
ORDER BY UMATERIAS.POSHIST
*/

/*    materias de uma turma (nao fuciniona para o hs)
SELECT DISTINCT
	UMATALUN.CODMAT, UMATERIAS.MATERIA, UMATERIAS.POSHIST
FROM UMATALUN
INNER JOIN UMATERIAS (NOLOCK) ON (UMATERIAS.CODMAT = UMATALUN.CODMAT)
WHERE UMATALUN.PERLETIVO = '06/07'
AND UMATALUN.CODTUR = '2A'
AND UMATALUN.CODMAT IN (SELECT CODMAT FROM UMATERIAS WHERE SEGUNDONOME = 'US')
ORDER BY UMATERIAS.POSHIST

*/

