


DECLARE tnames_cursor CURSOR
FOR (Select Vlrdebito, LCTREF, DATA, CODCONTA
from CRateioLC
where LCTREF in
(Select lctref from Clanca
where data between '08/01/2008' and '09/30/2008'
and Documento like 'LB%'
and complemento like 'WILLIAM TOLIVER LIVINGSTON IV' and debito is not null)
and vlrdebito > 0 and lctref not in (158822, 158823));

OPEN tnames_cursor;

Declare @Valor money;
Declare @referencia sysname;
Declare @datadeposito sysname;
Declare @conta sysname;

FETCH NEXT FROM tnames_cursor INTO @Valor, @referencia, @datadeposito, @conta;
WHILE (@@FETCH_STATUS <> -1)
BEGIN
   IF (@@FETCH_STATUS <> -2)
   BEGIN   
--	select @referencia, @datadeposito, @conta, '1.01.01.02.01.1001', round(@Valor/4, 2), 0,1,1,0;
   delete CRateioLC where LCTREF = @referencia;
   insert into CRateioLC Values (1, @referencia, @datadeposito, @conta, '1.01.01.02.01.1001', round(@Valor/4, 2), 0,1,1,0);
   insert into CRateioLC Values (1, @referencia, @datadeposito, @conta, '1.01.01.02.02.1001', round(@Valor/4, 2), 0,1,1,0);
   insert into CRateioLC Values (1, @referencia, @datadeposito, @conta, '1.01.01.02.03.1001', round(@Valor/2, 2), 0,1,1,0);

   END;
  FETCH NEXT FROM tnames_cursor INTO @Valor, @referencia, @datadeposito, @conta;
END;   
   
CLOSE tnames_cursor;
DEALLOCATE tnames_cursor;