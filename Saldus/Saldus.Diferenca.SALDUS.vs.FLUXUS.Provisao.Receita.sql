
select CODTDO, * from FLAN where DATAVENCIMENTO between '02/01/2012' and '02/29/2012'
and CODTDO = 000003 and NFOUDUP =1

compute sum(valororiginal)

select  , * from  
	update FLAN
	set TipoContabilLan = 1
	 where IDLAN in(162540)


select
FLan.StatusLan , Flan.TipoContabilLan ,
 * from EDESCLAN, Flan
where mataluno = 01190
and EDESCLAN.CODLANC = flan.IDLAN
and EDescLan.Parcela ='08'
and EDescLan.TipoLanc = 09



SELECT 
 IDLAN, *
FROM EDescLan, FLan 
WHERE 
	EDescLan.Parcela ='07' 
AND EDescLan.TipoLanc = 01 
AND EDescLan.CodLanc = FLan.IdLan 
AND FLan.StatusLan <> 2 
AND EDescLan.PerLetivo='13/14' 
and Flan.TipoContabilLan = 1
and Flan.IDLAN not in(
select SUBSTRING(INTEGRACHAVE,2,6) from CLANCA where DEBITO = '1.1.02.001.0001.0001'
and DATA between '02/01/2014' and '02/28/2014')
compute sum(valororiginal)



select * from CLANCA where DEBITO = '1.1.02.001.0001.0001'
and DATA between '02/01/2014' and '02/28/2014'
and SUBSTRING(INTEGRACHAVE,2,6) not in (
SELECT 
 IDLAN
FROM EDescLan, FLan 
WHERE 
	EDescLan.Parcela ='07' 
AND EDescLan.TipoLanc = 01 
AND EDescLan.CodLanc = FLan.IdLan 
AND FLan.StatusLan <> 2 
AND EDescLan.PerLetivo='13/14' 
and Flan.TipoContabilLan = 1)

select * from EDESCLAN where MATALUNO = 00317 and PERLETIVO = '13/14' 
and EDescLan.TipoLanc = 01 


--update EDESCLAN 
--set CODLANC = 207898
--where MATALUNO = 00317 and PERLETIVO = '13/14' 
--and EDescLan.TipoLanc = 01 and CODLANC = 221200