
select CODTDO from FTDOCONT where CODCONTA = (
select CCONTA.CODCONTA from CCONTA where REDUZIDO = '68')