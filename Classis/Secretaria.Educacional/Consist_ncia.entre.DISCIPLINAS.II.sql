/* Regra #1:
	Quem Faz PSL nao faz PORTUGUES

	A lista abaixo mostra os alunos matriculados em PSL e em PORTUGUES (Inconsistências)
*/


Select * from UmatAlun
where perletivo = '09/10'
and codmat like '%PSL'
and Mataluno in (
Select Mataluno from UmatAlun
where perletivo = '09/10'
and codmat like '%POR')
