Select 
	Orcamento.CodTbOrcamento,
	Natureza.Descricao,
	ValorOrcado
from TOrcamento Orcamento
inner join TitmOrcamento itens (NoLock) on (itens.IdOrcamento = Orcamento.Idorcamento)
inner join TTbOrcamento Natureza (NoLock) on (Natureza.CodTbOrcamento = Orcamento.CodTbOrcamento)
where Orcamento.CodCCusto ='1.01.01.01'
and Substring(Orcamento.CodTbOrcamento,0,6) ='12.01'
and Orcamento.IDPeriodo =(Select IdPeriodo from TPeriodoOrcamento where Descricao like '%'+ '09/10' +'%')

Union 

Select 
	Orcamento.CodTbOrcamento,
	Natureza.Descricao,
	ValorOrcado
from TOrcamento Orcamento
inner join TitmOrcamento itens (NoLock) on (itens.IdOrcamento = Orcamento.Idorcamento)
inner join TTbOrcamento Natureza (NoLock) on (Natureza.CodTbOrcamento = Orcamento.CodTbOrcamento)
where Orcamento.CodCCusto ='1.01.01.01'
and Substring(Orcamento.CodTbOrcamento,0,6) ='12.02'
and Orcamento.IDPeriodo =(Select IdPeriodo from TPeriodoOrcamento where Descricao like '%'+ '09/10' +'%')
order by Orcamento.CodTbOrcamento

Select 
	Orcamento.CodTbOrcamento,
	Natureza.Descricao,
	ValorOrcado
from TOrcamento Orcamento
inner join TitmOrcamento itens (NoLock) on (itens.IdOrcamento = Orcamento.Idorcamento)
inner join TTbOrcamento Natureza (NoLock) on (Natureza.CodTbOrcamento = Orcamento.CodTbOrcamento)
where Orcamento.CodCCusto ='1.01.01.01'
and Substring(Orcamento.CodTbOrcamento,0,6) ='12.03'
and Orcamento.IDPeriodo =(Select IdPeriodo from TPeriodoOrcamento where Descricao like '%'+ '09/10' +'%')
order by Orcamento.CodTbOrcamento