Select top 2 * from CrateioLC where CrateioLC.LCTRef = 30418
Select top 2 * from CLctLote  where CLctLote.LCTRef = 30418


Select 
	CrateioLC.data as CrateioLCdata, CLctLote.data as CLctLoteData, CLctLote.CodLote, * 
from CrateioLC
join CLctLote (NoLock) on (CLctLote.LCTRef = CrateioLC.LCTRef and CLctLote.CodLote = CrateioLC.CodLote)
where CLctLote.data != CrateioLC.data
and CLctLote.CodLote = 1202


Begin Tran 
Update CrateioLC
set CrateioLC.data = CLctLote.data
from CrateioLC
join CLctLote (NoLock) on (CLctLote.LCTRef = CrateioLC.LCTRef and CLctLote.CodLote = CrateioLC.CodLote)
where CLctLote.data != CrateioLC.data

Commit


Select 
	CRateioLC.data as Rateio, Clanca.data as Lancamento, * 
from CrateioLC
join Clanca (NoLock) on (CRateioLC.lctref = Clanca.LctRef and CRateioLC.CodLote = Clanca.CodLote)
and CRateioLC.data != Clanca.data
