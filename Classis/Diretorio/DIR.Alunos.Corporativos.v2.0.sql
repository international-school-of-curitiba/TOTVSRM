Select 
	(Select Fcfo.NOME from fcfo where FCFO.CODCFO = (SELECT EALUNOS.RESPONS from EALUNOS where EALUNOS.MATRICULA = UMATRICPLLIVRE.MATALUNO)),
	(SELECT EALUNOS.MATRICULA from EALUNOS where EALUNOS.MATRICULA = UMATRICPLLIVRE.MATALUNO)
from 
	UMATRICPLLIVRE where PERLETIVO = '15/16' and M_Tipoaluno in (3,4)
