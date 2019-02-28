Select 
	CodCCusto,CGerencia.CodConta, CodContager, CodReduzido, Reduzido, Nome, Descricao, *
From 
	Gccusto
	inner Join CGerencia (NoLock) on (CGerencia.CodConta = CodCCusto)
Where
	CodReduzido != Reduzido
	
-- Select * from PContasGer

Select * from TUsuarioCCusto where CodCCusto = '1.01.01.06.60.6009'
Select * from PCCusto where codccusto = '1.01.01.06.61.6009'

Declare @CCustoAPAGAR as varchar(20)

Set @CCustoAPAGAR = '1.02.01.06.69.6009'

delete PCCusto where codccusto = @CCustoAPAGAR
delete TUsuarioCCusto where CodCCusto = @CCustoAPAGAR
