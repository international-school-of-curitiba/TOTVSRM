select distinct 
	TMOV.CODCFO,
	(Select NOMEFANTASIA from FCFO where FCFO.CODCFO = TMOV.CODCFO)as Fornecedor,
	TMOV.NUMEROMOV, -- tmov.idmov, FLAN.IDLAN, 
	case 
		when FLAN.VALORBAIXADO > 0 AND FLAN.NFOUDUP != 1 and TMOVCONT.CODCONTA != '2.1.01.003.0001.0001'THEN
			(select 
				Case 
					when FLANCONT.IDLAN = 159264 then '5189.81'
					when FLANCONT.IDLAN = 154817 then '236.57'
					when FLANCONT.IDLAN = 155222 then '102.61'
				Else
					SUM(FLANCONT.VALOR) 
				end as Soma
			from FLANCONT where FLANCONT.IDLAN = FLAN.IDLAN and FLANCONT.CODCONTA = TMOVCONT.CODCONTA and TIPO = 1
			GROUP BY FLANCONT.IDLAN) 
		
		when FLAN.VALORBAIXADO > 0 AND FLAN.NFOUDUP != 1 and TMOVCONT.CODCONTA = '2.1.01.003.0001.0001' then
				
			(select SUM(TMOVCONT1.VALOR) from TMOVCONT TMOVCONT1 where TMOVCONT1.IDMOV = TMOV.IDMOV and TMOVCONT1.CODCONTA = TMOVCONT.CODCONTA)
		
		else 
			TMOV.VALORLIQUIDO 
			
	end as valor ,
	Flan.DATAVENCIMENTO,
	FLAN.DATABAIXA,
	TMOV.DATACONTABILIZACAO 
from 
	TMOVCONT 
Inner Join TMOV (NoLock) on (TMOV.IDMOV = TMOVCONT.IDMOV)
Inner Join FLAN (NoLock) on (FLAN.IDMOV = TMOVCONT.IDMOV)
where 
	TMOV.DATACONTABILIZACAO <= '08/31/2011' and TMOV.DATACONTABILIZACAO >= '01/01/2011' 
and TMOVCONT.CODCONTA = '2.1.01.003.0001.0001'
and TMOV.STATUS <> 'C'
and (FLAN.DATABAIXA > '08/31/2011'
or FLAN.DATABAIXA is null)




--select * from FLAN where NUMERODOCUMENTO like '%100911%'



/*
			(select 
				SUM(valor) 
			from 
				FLANCONT 
			where 
				FLANCONT.IDLAN = (select idlan from FLAN where IDFAT = (select IDFAT from FLAN where IDLAN = 153235) and FLAN.NFOUDUP != 1)
			and FLANCONT.CODCONTA = '2.1.01.003.0001.0001')
			
*/

--select * from FLAN where IDMOV = 98028
--select * from FLAN where IDLAN in (153235, 153234)

union 

select 
	FLAN.CODCFO,
	(Select NOMEFANTASIA from FCFO where FCFO.CODCFO = FLAN.CODCFO)as Fornecedor,
	 NUMERODOCUMENTO,
  	case 
	    when FLAN.VALORBAIXADO > 0 AND FLAN.NFOUDUP != 1 THEN
		(select 
			Case 
  			    when FLANCONT.IDLAN = 154508 then '1149.01'
			Else
			    SUM(FLANCONT.VALOR) 
			end as Soma
		  from 
			FLANCONT 
		  where 
			FLANCONT.IDLAN = FLAN.IDLAN 
		  and FLANCONT.CODCONTA in (Select FTDOCONT.CODCONTA from FTDOCONT where FTDOCONT.CODTDO = FLAN.CODTDO)
		  and TIPO = 1
		  GROUP BY FLANCONT.IDLAN)
	     else 
		  FLAN.VALORORIGINAL
	 end as valor ,
	 DATAVENCIMENTO,
	 DATABAIXA,
	 FLAN.DATACONTABILIZBX
From 
	FLAN 
where 
	FLAN.PAGREC = 2
and FLAN.STATUSLAN <> 2
and (FLAN.DATAVENCIMENTO <= '08/31/2011' or FLAN.DATAEMISSAO <= '08/31/2011')
and (FLAN.DATABAIXA > '08/31/2011' or FLAN.DATABAIXA is null)
and FLAN.CODTDO in (select CODTDO from FTDOCONT where CODCONTA = '2.1.01.003.0001.0001')
and FLAN.NFOUDUP != 1


union


select 
	FLAN.CODCFO,
	(Select NOMEFANTASIA from FCFO where FCFO.CODCFO = FLAN.CODCFO)as Fornecedor,
	 NUMERODOCUMENTO,
  	case 
	    when FLAN.VALORBAIXADO > 0 AND FLAN.NFOUDUP != 1 THEN
		(select 
			Case 
  			    when FLANCONT.IDLAN = 154508 then '1149.01'
			Else
			    SUM(FLANCONT.VALOR) 
			end as Soma
		  from 
			FLANCONT 
		  where 
			FLANCONT.IDLAN = FLAN.IDLAN 
		  and FLANCONT.CODCONTA in (Select FTDOCONT.CODCONTA from FTDOCONT where FTDOCONT.CODTDO = FLAN.CODTDO)
		  and TIPO = 1
		  GROUP BY FLANCONT.IDLAN)
	     else 
		  FLAN.VALORORIGINAL
	 end as valor ,
	 DATAVENCIMENTO,
	 DATABAIXA,
	 FLAN.DATACONTABILIZB
From 
	FLAN 
where 
 	FLAN.PAGREC = 2
and FLAN.STATUSLAN <> 2
and FLAN.DATAEMISSAO >= '08/01/2011' and FLAN.DATAEMISSAO <= '08/31/2011'
and FLAN.CODTDO in (select CODTDO from FTDOCONT where CODCONTA = '2.1.01.003.0001.0001')
order by Fornecedor

