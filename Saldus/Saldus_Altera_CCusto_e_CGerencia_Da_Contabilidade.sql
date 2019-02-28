
Select 
	(Select CodReduzido from GCCusto where GCCusto.CodCCusto = CLanca.CodCCusto),
	* 
from Clanca
where
	Clanca.Data >= '08/01/2006'
and Clanca.Data <= '07/31/2007'
and Clanca.Debito = '4.1.02.001.0001.0002'
and Clanca.CodCCusto like '1.0%.0%.03%'
Compute Sum(Valor)




Select 
	(Select CodReduzido from GCCusto where 
	CodCCusto = 
	Case 
		when 
			CodGerencial = '1.04.02.03.17.2510' then '1.02.01.03.17.2510' 
		when 
			CodGerencial = '1.04.02.03.17.2500' then '1.02.01.03.17.2500' 
		else '1.01'+ Substring(CodGerencial,5,20) 
	end),
	Case when CodGerencial = '1.04.02.03.17.2510' then '1.04.02.03.17.2510' else '1.01'+ Substring(CodGerencial,5,20) end,
	(Select CodReduzido from GCCusto where CodCCusto = CodGerencial),
	
	CodGerencial,
	* 
from CRateioLc
where LCTREF in (
Select 
	LCTREF
from Clanca
where
	Clanca.Data >= '08/01/2006'
and Clanca.Data <= '07/31/2007'
and Clanca.Debito = '4.1.02.001.0001.0002'
and Clanca.CodCCusto like '1.04.0%.03%')
Compute Sum(VLRDebito)




ALTER TABLE TMOVRAT NoCHECK CONSTRAINT FKTMOVRAT_CRATEIOLCINT
GO
Update CRateioLc
Set CodGerencial = Case 
		when 
			CodGerencial = '1.04.02.03.17.2510' then '1.02.01.03.17.2510' 
		when 
			CodGerencial = '1.04.02.03.17.2500' then '1.02.01.03.17.2500' 
		else '1.01'+ Substring(CodGerencial,5,20) 
	end
where LCTREF in (
Select 
	LCTREF
from Clanca
where
	Clanca.Data >= '08/01/2006'
and Clanca.Data <= '07/31/2007'
and Clanca.Debito = '4.1.02.001.0001.0002'
and Clanca.CodCCusto like '1.04.0%.03%')

GO
ALTER TABLE TMOVRAT CHECK CONSTRAINT FKTMOVRAT_CRATEIOLCINT
GO
update TMOVRAT
set CodContager = Case 
		when 
			CodContager = '1.04.02.03.17.2510' then '1.02.01.03.17.2510' 
		when 
			CodContager = '1.04.02.03.17.2500' then '1.02.01.03.17.2500' 
		else '1.01'+ Substring(CodContager,5,20) 
	end
where LCTRefInt in (
Select 
	LCTREF
from Clanca
where
	Clanca.Data >= '08/01/2006'
and Clanca.Data <= '07/31/2007'
and Clanca.Debito = '4.1.02.001.0001.0002'
and Clanca.CodCCusto like '1.04.0%.03%')
GO


Update Clanca
Set CodCCusto  = Case 
		when 
			CodCCusto = '1.04.02.03.17.2510' then '1.02.01.03.17.2510' 
		when 
			CodCCusto = '1.04.02.03.17.2500' then '1.02.01.03.17.2500' 
		else '1.01'+ Substring(CodCCusto,5,20) 
	end
where 
	Clanca.Data >= '08/01/2006'
and Clanca.Data <= '07/31/2007'
and Clanca.Debito = '4.1.02.001.0001.0002'
and Clanca.CodCCusto like '1.04.0%.03%'

