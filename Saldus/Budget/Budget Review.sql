
DECLARE tnames_cursor CURSOR 

FOR(select CCONTA.REDUZIDO from CCONTA where REDUZIDO in (377,385,386,388,389,390,392,545,424,529,536,541,593)); 

OPEN tnames_cursor;


DECLARE @CONTA AS sysname;

FETCH NEXT FROM tnames_cursor INTO @conta; 
WHILE (@@FETCH_STATUS <> -1)
BEGIN
   IF (@@FETCH_STATUS <> -2)
   BEGIN   

	
Select DISTINCT
	@CONTA,
	TMOV.DATAEMISSAO,
	TPRODUTO.DESCRICAO,
	CAST(TITMMOV.PRECOUNITARIO * TITMMOV.QUANTIDADE AS MONEY),
	REPLACE(ISNULL(TITMMOVHISTORICO.HISTORICOCURTO,''), char(13)+char(10),'' ),
	TMOV.IDMOV, TMOV.CODTMV
from 
	TITMMOV 
INNER JOIN TMOV (NOLOCK) ON (TMOV.IDMOV = TITMMOV.IDMOV)
INNER JOIN TPRODUTO (NOLOCK) ON (TPRODUTO.IDPRD = TITMMOV.IDPRD)
INNER JOIN TITMMOVHISTORICO (NOLOCK) ON (TITMMOVHISTORICO.IDMOV = TITMMOV.IDMOV)

where 
	TITMMOV.CODTB2FAT in (select CODTB2FAT from TTB2CONT where tipo = 1 and CODCONTA = (select CCONTA.CODCONTA FROM CCONTA WHERE CCONTA.REDUZIDO = @CONTA))
AND TMOV.DATAEMISSAO BETWEEN '08/01/2015' AND '12/31/2015'
AND TMOV.CODTMV IN (SELECT  CODTMV FROM  TITMTMV WHERE TITMTMV.EFEITOSALDOORCA = 'A' )

ORDER BY TMOV.DATAEMISSAO


   END;
   FETCH NEXT FROM tnames_cursor INTO @Conta;
END;
CLOSE tnames_cursor;
DEALLOCATE tnames_cursor;

