
Select CRLC.data, CLOTE.data, * from CRateioLC CRLC,
CLCTLOte CLOTE where CRLC.LCTRef = CLOTE.LCTREF
and CLOTE.codlote = 1201


/* RATEIO COM O LOTE */
Select CRLC.data as crat, CLOTE.data as clotes, * from CRateioLC CRLC,
CLCTLOte CLOTE where CRLC.LCTRef = CLOTE.LCTREF and CRLC.codLote = CLOTE.CodLote
and CRLC.data != CLOTE.data

Begin tran
update CRateioLC
set CRateioLC.Data = CLctLote.data
from CRateioLC, CLctLote 
where CRateioLC.LCTRef = CLctLote.LCTREF and CRateioLC.codLote != CLctLote.CodLote
and CRateioLC.data != CLctLote.data
and CLctLote.codlote != 0
Commit

/* RATEIO COM O LANCAMENTO */
Select CRateioLC.data as Rateio, Clanca.data as Lancamento, * from CrateioLC
join Clanca on (CRateioLC.lctref = Clanca.LctRef and CRateioLC.CodLote = Clanca.CodLote and CRateioLC.data != Clanca.data)
and CRateioLC.codlote != 0

Begin tran
update CRateioLC
set CRateioLC.Data = Clanca.data
from CRateioLC
join Clanca on (CRateioLC.lctref = Clanca.LctRef and CRateioLC.CodLote = Clanca.CodLote and CRateioLC.data != Clanca.data)
commit