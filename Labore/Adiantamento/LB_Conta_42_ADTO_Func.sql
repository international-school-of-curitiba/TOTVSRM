declare @DTInicio as date;
declare @DTFim as date;
declare @MEScomp as int;
declare @ANOcomp as int;


set @DTInicio ='02/01/2016'
set @DTFim = '02/29/2016'
set @MEScomp = 02
set @ANOcomp = 2016


select
	Pfunc.NOME,
	sum(valor) Labore,
	(select sum(valor) from CPARTIDA where CPARTIDA.CREDITO = '1.1.03.001.0001.0003'  and DATA between @DTInicio and @DTFim and CPARTIDA.COMPLEMENTO like ' '+ PFUNC.nome) Saldus,

	sum(valor) - (select sum(valor) from CPARTIDA where CPARTIDA.CREDITO = '1.1.03.001.0001.0003'  and DATA between  @DTInicio and @DTFim and CPARTIDA.COMPLEMENTO like ' '+ PFUNC.nome) Diff,

	(select sum(PFF.valor) from PFFINANC PFF  where PFF.MESCOMP = PFFINANC.MESCOMP and PFF.ANOCOMP = PFFINANC.ANOCOMP 
		and PFF.CODEVENTO in (select PEVENTO.CODIGO from PEVENTO where PEVENTO.CONTACREDITO = 16) and PFF.CODEVENTO not in ('0503') and PFF.chapa = PFFINANC.CHAPA),

	sum(valor) - (select sum(valor) from CPARTIDA where CPARTIDA.CREDITO = '1.1.03.001.0001.0003'  and DATA between @DTInicio and @DTFim and CPARTIDA.COMPLEMENTO like ' '+ PFUNC.nome) +

	(select sum(PFF.valor) from PFFINANC PFF  where PFF.MESCOMP = PFFINANC.MESCOMP and PFF.ANOCOMP = PFFINANC.ANOCOMP 
		and PFF.CODEVENTO in (select PEVENTO.CODIGO from PEVENTO where PEVENTO.CONTACREDITO = 16) and PFF.CODEVENTO not in ('0503') and PFF.chapa = PFFINANC.CHAPA)


from PFFINANC
	inner join pfunc (nolock)  on (pfunc.chapa=pffinanc.chapa) 
 where MESCOMP = @MEScomp and ANOCOMP = @ANOcomp and CODEVENTO in (select PEVENTO.CODIGO from PEVENTO where PEVENTO.CONTACREDITO = 16)

group by Pfunc.NOME, PFFINANC.MESCOMP, PFFINANC.ANOCOMP, PFFINANC.CHAPA
order by NOME



/*
select 
	COMPLEMENTO, 
	sum(valor)
from CPARTIDA where CPARTIDA.CREDITO = '1.1.03.001.0001.0003'  and DATA between  '10/01/2015' and '10/31/2015'
group by COMPLEMENTO

*/