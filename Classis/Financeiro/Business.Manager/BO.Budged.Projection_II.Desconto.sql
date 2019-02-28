Select 
	Perletivo, MatAluno, Plano, ValorDevido, Parcela, sum(Desconto) as TotalDesconto, ValorDevido - sum(Desconto) as AReceber 
from Z_BudgedProjection
Inner Join Z_SchoolCalendar (NoLock) on (Z_BudgedProjection.Perletivo = Z_SchoolCalendar.CodPerlet)
where Z_BudgedProjection.Perletivo = '09/10' and Z_BudgedProjection.MatAluno = 00184 and Z_BudgedProjection.DtVencimento between DecemberBegin and DecemberEnd
Group by Perletivo, MatAluno, Plano, ValorDevido, Parcela

Create View Z_BudgedProjectionWithDesc AS
Select 
	Perletivo, MatAluno, Plano, DtVencimento,ValorDevido, Parcela, sum(Desconto) as TotalDesconto, ValorDevido - sum(Desconto) as AReceber 
from Z_BudgedProjection where Perletivo = '09/10'
Group by Perletivo, MatAluno, Plano,DtVencimento, ValorDevido, Parcela


Select Sum(AReceber) from Z_BudgedProjectionWithDesc
Inner Join Z_SchoolCalendar (NoLock) on (Z_BudgedProjectionWithDesc.Perletivo = Z_SchoolCalendar.CodPerlet)
where Z_BudgedProjectionWithDesc.Perletivo = '09/10' and Z_BudgedProjectionWithDesc.MatAluno = 00184 
and Z_BudgedProjectionWithDesc.DtVencimento between DecemberBegin and DecemberEnd