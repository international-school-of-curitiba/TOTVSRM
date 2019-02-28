
Select 
	Substring(Natureza.Descricao, 0 , PatIndex('%(%', Natureza.Descricao)),
	ValorOrcado +	(Select Tito.ValorOrcado
		from TOrcamento Orcamento2
		inner join TitmOrcamento Tito (NoLock) on (Tito.IdOrcamento = Orcamento2.Idorcamento)
		inner join TTbOrcamento Natureza2 (NoLock) on (Natureza2.CodTbOrcamento = Orcamento2.CodTbOrcamento) where Tito.IdOrcamento = Orcamento2.Idorcamento and Orcamento2.CodCCusto ='1.01.01.01'
		and Orcamento2.CodTbOrcamento = Substring(Orcamento.CodTbOrcamento,1,6) + '1'+ Substring(Orcamento.CodTbOrcamento,8,2) 
		and Orcamento2.IDPeriodo = (Select IdPeriodo from TPeriodoOrcamento where Descricao like '%'+ '09/10' +'%')) as NP
from TOrcamento Orcamento
inner join TitmOrcamento itens (NoLock) on (itens.IdOrcamento = Orcamento.Idorcamento)
inner join TTbOrcamento Natureza (NoLock) on (Natureza.CodTbOrcamento = Orcamento.CodTbOrcamento)
where Orcamento.CodCCusto ='1.01.01.01'
and Substring(Orcamento.CodTbOrcamento,0,8) ='12.02.0'
and Orcamento.IDPeriodo =(Select IdPeriodo from TPeriodoOrcamento where Descricao like '%'+ '09/10' +'%')
order by Orcamento.CodTbOrcamento



