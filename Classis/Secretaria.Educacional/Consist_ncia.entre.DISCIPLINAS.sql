/*  REGRA 1: ALUNOS QUE FAZEM PORTUGUES NÃO FAZ PSL REGULAR
			 Exibe a lista de Alunos que estão matriculados em ambas disciplinas 
	REGRA 2: ALUNOS QUE FAZEM PSL FAZEM BRAZILIAN STUDIES E NAO BHG
	REGRA 3: ALUNOS QUE FAZEM 

*/

/* ALUNOS MATRICULADOS EM PORTUGUESE E EM PSL - DISCORDA REGRA 1 - NAO PODE TER NIGUEM */
Select 
	perletivo,
	MatAluno,
	(Select A_NomeReduzido from EACompl where Matricula = MatAluno),
	CodMat,
	(Select UMT.Materia from Umaterias UMT where UMT.codmat = UMA.CodMat),
	CodTur,	A1, A2, A6, A7
from UmatAlun UMA
where Perletivo = '09/10'
and	CodMat like '%POR' and Mataluno in (Select Mataluno from UmatAlun where Perletivo = '09/10' and	CodMat like '%PSL')
and status in ('01', '07')


/* ALUNOS MATRICULADOS EM PSL E EM PORTUGES - DISCORDA REGRA 1 - NAO PODE TER NIGUEM */
Select 
	perletivo,
	MatAluno,
	(Select A_NomeReduzido from EACompl where Matricula = MatAluno),
	CodMat,
	(Select UMT.Materia from Umaterias UMT where UMT.codmat = UMA.CodMat),
	CodTur,	A1, A2, A6, A7
from UmatAlun UMA
where Perletivo = '09/10'
and	CodMat like '%PSL' and Mataluno in (Select Mataluno from UmatAlun where Perletivo = '09/10' and	CodMat like '%POR')
and status in ('01', '07')


/* ALUNOS MATRICULADOS EM PSL E EM BHG - DISCORDA REGRA 2 - NAO PODE TER NIGUEM */
Select 
	perletivo,
	MatAluno,
	(Select A_NomeReduzido from EACompl where Matricula = MatAluno),
	CodMat,
	(Select UMT.Materia from Umaterias UMT where UMT.codmat = UMA.CodMat),
	CodTur,	A1, A2, A6, A7
from UmatAlun UMA
where Perletivo = '09/10'
and	CodMat like '%psl' and Mataluno in (Select Mataluno from UmatAlun where Perletivo = '09/10' and	CodMat like '%BHG')
and status in ('01', '07')



/* ALUNOS MATRICULADOS EM PSL E NÃO ESTAO EM BRAZILIAN STUDIES - DISCORDO REGRA 2 - NAO PODE TER NIGUEM */
Select 
	perletivo,
	MatAluno,
	(Select A_NomeReduzido from EACompl where Matricula = MatAluno),
	CodMat,
	(Select UMT.Materia from Umaterias UMT where UMT.codmat = UMA.CodMat),
	CodTur,	A1, A2, A6, A7
from UmatAlun UMA
where Perletivo = '09/10'
and	CodMat like '%psl' and substring(codtur,1,1) > 3 and Mataluno NOT in (Select Mataluno from UmatAlun where Perletivo = '09/10' and	CodMat like '%BST')
and status in ('01', '07')






Select 
	perletivo,
	MatAluno,
	(Select A_NomeReduzido from EACompl where Matricula = MatAluno),
	CodMat,
	(Select UMT.Materia from Umaterias UMT where UMT.codmat = UMA.CodMat),
	CodTur,	A1, A2, A6, A7
from UmatAlun UMA
where Perletivo = '09/10'
and	CodMat like '%psl' and Mataluno NOT in (Select Mataluno from UmatAlun where Perletivo = '09/10' and	CodMat like '%BHG')
and status in ('01', '07')
