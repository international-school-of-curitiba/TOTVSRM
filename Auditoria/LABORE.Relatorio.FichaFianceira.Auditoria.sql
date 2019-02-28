Select Distinct 
	Chapa,
	Ficha.CodEvento,
	PEvento.Descricao,
	(Select sum(valor) from PFFinanc where 
	PFFinanc.CodEvento = Ficha.CodEvento and 
	PFFinanc.Chapa = Ficha.Chapa and 
	PFFinanc.AnoComp = 2006 and 
	PFFinanc.Mescomp = 1) as Jan,
	(Select sum(valor) from PFFinanc where 
	PFFinanc.CodEvento = Ficha.CodEvento and 
	PFFinanc.Chapa = Ficha.Chapa and 
	PFFinanc.AnoComp = 2006 and 
	PFFinanc.Mescomp = 2) as Fev,
	(Select sum(valor) from PFFinanc where 
	PFFinanc.CodEvento = Ficha.CodEvento and 
	PFFinanc.Chapa = Ficha.Chapa and 
	PFFinanc.AnoComp = 2006 and 
	PFFinanc.Mescomp = 3) as Mar,
	(Select sum(valor) from PFFinanc where 
	PFFinanc.CodEvento = Ficha.CodEvento and 
	PFFinanc.Chapa = Ficha.Chapa and 
	PFFinanc.AnoComp = 2006 and 
	PFFinanc.Mescomp = 4) as Abri,
	(Select sum(valor) from PFFinanc where 
	PFFinanc.CodEvento = Ficha.CodEvento and 
	PFFinanc.Chapa = Ficha.Chapa and 
	PFFinanc.AnoComp = 2006 and 
	PFFinanc.Mescomp = 5) as Maio,
	(Select sum(valor) from PFFinanc where 
	PFFinanc.CodEvento = Ficha.CodEvento and 
	PFFinanc.Chapa = Ficha.Chapa and 
	PFFinanc.AnoComp = 2006 and 
	PFFinanc.Mescomp = 6) as Junho,
	(Select sum(valor) from PFFinanc where 
	PFFinanc.CodEvento = Ficha.CodEvento and 
	PFFinanc.Chapa = Ficha.Chapa and 
	PFFinanc.AnoComp = 2006 and 
	PFFinanc.Mescomp = 7) as Julho,
	(Select sum(valor) from PFFinanc where 
	PFFinanc.CodEvento = Ficha.CodEvento and 
	PFFinanc.Chapa = Ficha.Chapa and 
	PFFinanc.AnoComp = 2006 and 
	PFFinanc.Mescomp = 8) as Agosto,
	(Select sum(valor) from PFFinanc where 
	PFFinanc.CodEvento = Ficha.CodEvento and 
	PFFinanc.Chapa = Ficha.Chapa and 
	PFFinanc.AnoComp = 2006 and 
	PFFinanc.Mescomp = 9) as Setembro,
	(Select sum(valor) from PFFinanc where 
	PFFinanc.CodEvento = Ficha.CodEvento and 
	PFFinanc.Chapa = Ficha.Chapa and 
	PFFinanc.AnoComp = 2006 and 
	PFFinanc.Mescomp = 10) as Outubro,
	(Select sum(valor) from PFFinanc where 
	PFFinanc.CodEvento = Ficha.CodEvento and 
	PFFinanc.Chapa = Ficha.Chapa and 
	PFFinanc.AnoComp = 2006 and 
	PFFinanc.Mescomp = 11) as Novembro,
	(Select sum(valor) from PFFinanc where 
	PFFinanc.CodEvento = Ficha.CodEvento and 
	PFFinanc.Chapa = Ficha.Chapa and 
	PFFinanc.AnoComp = 2006 and 
	PFFinanc.Mescomp = 12) as Dezembro,
	(Select sum(valor) from PFFinanc where 
	PFFinanc.CodEvento = Ficha.CodEvento and 
	PFFinanc.Chapa = Ficha.Chapa and 
	PFFinanc.AnoComp = 2007 and 
	PFFinanc.Mescomp = 1) as Janeiro,
	(Select sum(valor) from PFFinanc where 
	PFFinanc.CodEvento = Ficha.CodEvento and 
	PFFinanc.Chapa = Ficha.Chapa and 
	PFFinanc.AnoComp = 2007 and 
	PFFinanc.Mescomp = 2) as Fevereiro,
	(Select sum(valor) from PFFinanc where 
	PFFinanc.CodEvento = Ficha.CodEvento and 
	PFFinanc.Chapa = Ficha.Chapa and 
	PFFinanc.AnoComp = 2007 and 
	PFFinanc.Mescomp = 3) as Marco,
	(Select sum(valor) from PFFinanc where 
	PFFinanc.CodEvento = Ficha.CodEvento and 
	PFFinanc.Chapa = Ficha.Chapa and 
	PFFinanc.AnoComp = 2007 and 
	PFFinanc.Mescomp = 4) as Abril,
	(Select sum(valor) from PFFinanc where 
	PFFinanc.CodEvento = Ficha.CodEvento and 
	PFFinanc.Chapa = Ficha.Chapa and 
	PFFinanc.AnoComp = 2007 and 
	PFFinanc.Mescomp = 5) as Maio,
	(Select sum(valor) from PFFinanc where 
	PFFinanc.CodEvento = Ficha.CodEvento and 
	PFFinanc.Chapa = Ficha.Chapa and 
	PFFinanc.AnoComp = 2007 and 
	PFFinanc.Mescomp = 6) as Junho,
	(Select sum(valor) from PFFinanc where 
	PFFinanc.CodEvento = Ficha.CodEvento and 
	PFFinanc.Chapa = Ficha.Chapa and 
	PFFinanc.AnoComp = 2007 and 
	PFFinanc.Mescomp = 7) as Julho,
    (Select sum(valor) from PFFinanc where 
	PFFinanc.CodEvento = Ficha.CodEvento and 
	PFFinanc.Chapa = Ficha.Chapa and 
	PFFinanc.AnoComp = 2007 and 
	PFFinanc.Mescomp = 8) as Agosto,
    (Select sum(valor) from PFFinanc where 
	PFFinanc.CodEvento = Ficha.CodEvento and 
	PFFinanc.Chapa = Ficha.Chapa and 
	PFFinanc.AnoComp = 2007 and 
	PFFinanc.Mescomp = 9) as Sept
from PFFinanc Ficha
left join PEvento (NoLock) on (PEvento.Codigo = Ficha.CodEvento)
where Ficha.Chapa in (000069,000538,000311,000540,000352,000332,000405,000486,000361,000372)
and Ficha.valor > 0
and Ficha.DTPagto >= '08/01/2006' 
and PEvento.ProvDescBase <> 'B' 
Order by Chapa, codEvento

