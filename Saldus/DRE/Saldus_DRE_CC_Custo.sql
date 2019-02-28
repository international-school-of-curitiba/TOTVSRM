
Select Top 1 
(select Sum(Valor) from CLanca 
		where Clanca.Debito  >= '4.1.02' and Clanca.Debito  <= '4.1.02.9999' 
		and Clanca.Data >= '08/01/2006' and Clanca.Data <= '08/31/2006'
		and LCTREF in 
		(Select LCTREF from CRateioLC where 
			CodConta >= '4.1.02' and CodConta <= '4.1.02.9999'
			and data >= '08/01/2006' and Data <= '08/31/2006'
			and( 
			   (CodGerencial >= (Select CodGerencial from GCcusto where CodReduzido = '11IH000') and CodGerencial <= (Select CodGerencial from GCcusto where CodReduzido = '11SX730'))
			or (CodGerencial >= (Select CodGerencial from GCcusto where CodReduzido = '22IK000') and CodGerencial <= (Select CodGerencial from GCcusto where CodReduzido = '22SX730'))
			or (CodGerencial >= (Select CodGerencial from GCcusto where CodReduzido = '31IH000') and CodGerencial <= (Select CodGerencial from GCcusto where CodReduzido = '31SX730'))
			or (CodGerencial >= (Select CodGerencial from GCcusto where CodReduzido = '32IK000') and CodGerencial <= (Select CodGerencial from GCcusto where CodReduzido = '32SX730'))
			or (CodGerencial >= (Select CodGerencial from GCcusto where CodReduzido = '41IH000') and CodGerencial <= (Select CodGerencial from GCcusto where CodReduzido = '41SX730'))
			or (CodGerencial >= (Select CodGerencial from GCcusto where CodReduzido = '42IK000') and CodGerencial <= (Select CodGerencial from GCcusto where CodReduzido = '42SX730')) 
			or (CodGerencial >= (Select CodGerencial from GCcusto where CodReduzido = '51IH000') and CodGerencial <= (Select CodGerencial from GCcusto where CodReduzido = '51SX730'))
			or (CodGerencial >= (Select CodGerencial from GCcusto where CodReduzido = '52IK000') and CodGerencial <= (Select CodGerencial from GCcusto where CodReduzido = '52SX730'))
			or (CodGerencial >= (Select CodGerencial from GCcusto where CodReduzido = '61IH000') and CodGerencial <= (Select CodGerencial from GCcusto where CodReduzido = '61SX730'))
			or (CodGerencial >= (Select CodGerencial from GCcusto where CodReduzido = '62IK000') and CodGerencial <= (Select CodGerencial from GCcusto where CodReduzido = '62SX730'))
			)))  ,
(Select Sum(Valor) from CLanca 
        where Clanca.Credito >= '4.1.02' and Clanca.Credito <= '4.1.03.9999' 
        and Clanca.Data >= '08/01/2006' and Clanca.Data <= '09/30/2006'
		and LCTREF in 
		(Select LCTREF from CRateioLC where 
			CodConta >= '4.1.02' and CodConta <= '4.1.03.9999'
			and data >= '08/01/2006' and Data <= '09/30/2006'
			and( 
			   (CodGerencial >= (Select CodGerencial from GCcusto where CodReduzido = '11IH000') and CodGerencial <= (Select CodGerencial from GCcusto where CodReduzido = '11SX730'))
			or (CodGerencial >= (Select CodGerencial from GCcusto where CodReduzido = '22IK000') and CodGerencial <= (Select CodGerencial from GCcusto where CodReduzido = '22SX730'))
			or (CodGerencial >= (Select CodGerencial from GCcusto where CodReduzido = '31IH000') and CodGerencial <= (Select CodGerencial from GCcusto where CodReduzido = '31SX730'))
			or (CodGerencial >= (Select CodGerencial from GCcusto where CodReduzido = '32IK000') and CodGerencial <= (Select CodGerencial from GCcusto where CodReduzido = '32SX730'))
			or (CodGerencial >= (Select CodGerencial from GCcusto where CodReduzido = '41IH000') and CodGerencial <= (Select CodGerencial from GCcusto where CodReduzido = '41SX730'))
			or (CodGerencial >= (Select CodGerencial from GCcusto where CodReduzido = '42IK000') and CodGerencial <= (Select CodGerencial from GCcusto where CodReduzido = '42SX730')) 
			or (CodGerencial >= (Select CodGerencial from GCcusto where CodReduzido = '51IH000') and CodGerencial <= (Select CodGerencial from GCcusto where CodReduzido = '51SX730'))
			or (CodGerencial >= (Select CodGerencial from GCcusto where CodReduzido = '52IK000') and CodGerencial <= (Select CodGerencial from GCcusto where CodReduzido = '52SX730'))
			or (CodGerencial >= (Select CodGerencial from GCcusto where CodReduzido = '61IH000') and CodGerencial <= (Select CodGerencial from GCcusto where CodReduzido = '61SX730'))
			or (CodGerencial >= (Select CodGerencial from GCcusto where CodReduzido = '62IK000') and CodGerencial <= (Select CodGerencial from GCcusto where CodReduzido = '62SX730'))
			)))
from CConta
