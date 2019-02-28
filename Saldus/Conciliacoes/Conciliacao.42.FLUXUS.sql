select 
	PFUNC.NOME, MESCOMP, ANOCOMP, DTPAGTO, VALOR, PFFINANC.NROPERIODO
from 
	PFFINANC 
	JOIN PFUNC (NOLOCK) ON (PFUNC.CHAPA = PFFINANC.CHAPA)
WHERE MESCOMP = 5 and ANOCOMP = 2015
and CODEVENTO = '0503' 
ORDER BY MESCOMP, ANOCOMP, NOME

COMPUTE SUM(VALOR)


select 
-- desconto na 42

select 
	PFUNC.NOME, MESCOMP, ANOCOMP, sum(VALOR)as soma
from 
	PFFINANC 
	JOIN PFUNC (NOLOCK) ON (PFUNC.CHAPA = PFFINANC.CHAPA)
WHERE CODEVENTO in (select CODIGO from PEVENTO where PEVENTO.PROVDESCBASE = 'D' and PEVENTO.CONTACREDITO = 16 )

and MESCOMP = 5 and ANOCOMP = 2015
group by MESCOMP, ANOCOMP, NOME
ORDER BY MESCOMP, ANOCOMP, NOME



-- tudo o que foi descontado e nao foi para a 42

select 
	PFUNC.NOME, MESCOMP, ANOCOMP, sum(VALOR)as soma
from 
	PFFINANC 
	JOIN PFUNC (NOLOCK) ON (PFUNC.CHAPA = PFFINANC.CHAPA)
WHERE CODEVENTO not in (select CODIGO from PEVENTO where PEVENTO.PROVDESCBASE = 'D' and PEVENTO.CONTACREDITO = 16 )
and  CODEVENTO in (select CODIGO from PEVENTO where PEVENTO.PROVDESCBASE = 'D')
and  CODEVENTO not in ('0951','0961','0520','0500', '0502', '0513', '0533', '0519', '0501','0512', '0525')
and MESCOMP = 5 and ANOCOMP = 2015
group by MESCOMP, ANOCOMP, NOME
ORDER BY MESCOMP, ANOCOMP, NOME







