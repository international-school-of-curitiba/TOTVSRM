
select * from FLAN where
CODTDO = '000003'
and TIPOCONTABILLAN = 1
and DATAVENCIMENTO between '11/01/2013'and '11/30/2013'
and flan.IDLAN not in (
select IDLAN from 
FLANCONT
where flancont.IDLAN in
(select IDLAN from FLAN where
CODTDO = '000003'
and TIPOCONTABILLAN = 1
and DATAVENCIMENTO between '11/01/2013'and '11/30/2013')
and TIPO = 1)



select IDLAN from 
FLANCONT
where flancont.IDLAN in
(select IDLAN from FLAN where
CODTDO = '000003'
and TIPOCONTABILLAN = 1
and DATAVENCIMENTO between '11/01/2013'and '11/30/2013')
and TIPO = 1
and IDLAN not in(
select IDLAN from FLAN where
CODTDO = '000003'
and TIPOCONTABILLAN = 1
and DATAVENCIMENTO between '11/01/2013'and '11/30/2013')