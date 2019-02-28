Select 
	(Select Imagem from GImagem where ID = IDImagem),
	Nome ,* 
from EAlunos
Inner Join UMatricpl (NoLock) on (Ealunos.Matricula = UMatricpl.MatAluno)
Where UMatricpl.Perletivo = '09/10'
and UMatricpl.Status in ('01','07')



