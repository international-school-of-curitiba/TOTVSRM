
Select distinct
	Nome, (select Substring(CodReduzido,2,2) from Gccusto where GCCusto.CodCCusto = PFRateioFixo.CODCCUSTO ) as Custo,
(select CodReduzido from Gccusto where GCCusto.CodCCusto = PFRateioFixo.CODCCUSTO )
from PFunc
inner Join PFRateioFixo (NoLock) on (PFRateioFixo.Chapa = PFunc.Chapa)
where CodSituacao = 'A' and CodTipo = 'N'
order by Custo, Nome