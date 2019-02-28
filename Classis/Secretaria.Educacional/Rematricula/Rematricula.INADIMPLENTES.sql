
-- FAMILIAS INADIMPLENTES COM FILHOS MATRICULADOS E REQUERENDO REMATRICULA
Select distinct A_Familia, nome, (Select Nome from FCFO where FCFO.CodCFO = Respons), TipoAluno
from Ealunos
Inner Join Eacompl (NoLock) on (Ealunos.Matricula = EAcompl.Matricula)
inner join UMatricpl (NoLock) On (UMatricpl.MatAluno = Ealunos.Matricula)
where Umatricpl.PerLetivo = '09/10' and UMatricpl.Status in('01','07')
and Respons in 
(Select distinct CodCFO from Flan  
where DataVencimento between '08/01/2009' and '05/31/2010' 
and PagRec = 1
and statuslan = 0)
order by tipoaluno, A_Familia


-- FAMILIAS INADIMPLENTES NAO RECEBERAM QUITACAO
Select distinct A_Familia, nome
from Ealunos
Inner Join Eacompl (NoLock) on (Ealunos.Matricula = EAcompl.Matricula)
--inner join UMatricpl (NoLock) On (UMatricpl.MatAluno = Ealunos.Matricula)
where Respons in 
(Select distinct CodCFO from Flan  
where DataVencimento between '01/01/2009' and '12/31/2009' 
and PagRec = 1
and statuslan = 0)
order by A_Familia


