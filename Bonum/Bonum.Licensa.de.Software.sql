--
Select * from IBcompl where ClassificacaoBem = '001' and MSOffice = 01
Select * from IBcompl where ClassificacaoBem = '012' and MSOffice = 01

--Select * from IBcompl where ip between '10.0.3' and '10.0.7'

/*
update IBcompl 
set classificacaobem = '001'
where ip between '10.0.6' and '10.0.7'
and sistemaop = '03'



update IBcompl 
set classificacaobem = null, ip = null, nomedobem = null
where ip between '10.0.3' and '10.0.4'
and sistemaop is null

*/


select codlocalatual, ILocal.Nome, Classificacaobem, Ibem.Descricao, Ibem.Codbem, Codigobarra, SistemaOP, MSoffice
from Ibem
inner join Ilocal (NoLock) on (Ilocal.CodLocal = IBem.CodLocalAtual)
join IBcompl (NoLock) on (IBcompl.CodBem = IBem.CodBem)
where Ibem.codbem like '07%' and Ibem.Ativo =1
and (Classificacaobem in (1, 12) or  Classificacaobem is null)


/*
update IBcompl 
set SistemaOP = '03', MSOffice = '02'
where sistemaop is null
and codbem in (
'07.0425',
'07.0436',
'07.0439',
'07.0452',
'07.0454',
'07.0456',
'07.0457',
'07.0458')

*/