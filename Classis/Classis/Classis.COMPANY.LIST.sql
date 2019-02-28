Select PPessoa.Empresa
from PPessoa
join Ealunos (NoLock) on Ealunos.Pai = PPessoa.codigo
join UMatricPL (NoLock) on UMatricPl.MatAluno = Ealunos.Matricula
where PPessoa.Empresa is not null
and UMatricpl.Perletivo ='14/15'
group by PPessoa.empresa
union
Select PPessoa.Empresa
from PPessoa
join Ealunos (NoLock) on Ealunos.MAE = PPessoa.codigo
join UMatricPL (NoLock) on UMatricPl.MatAluno = Ealunos.Matricula
where PPessoa.Empresa is not null
and UMatricpl.Perletivo ='14/15'
group by PPessoa.empresa
order by PPESSOA.EMPRESA


update PPESSOA
set ppessoa.EMPRESA = 'CORE Consultores Associados'
where PPESSOA.EMPRESA like ' CORE consultores associados%'