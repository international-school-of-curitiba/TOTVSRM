select ibem.codigobarra, ibem.descricao, ilocal.nome, ibcompl.nomedobem, GConsist.Descricao, ibcompl.ip, Ibem.CodFilial
from ibem
inner join ibcompl (NoLock) on (Ibem.Codbem = Ibcompl.codbem)
inner join ilocal (NoLock) on (ibem.codlocalatual = ilocal.codlocal)
inner join GConsist (NoLock) on (Gconsist.CodCliente = IBCompl.sistemaop)
where ibcompl.sistemaop is not null
and ibem.ativo = 1 
and ibem.codbem between '07' and '08'
and GCONSIST.Descricao like '%Office%'
and GCONSIST.aplicacao = 'I'
and GCONSIST.codtabela = '0002'
Order by Ibem.CodFilial, Ibem.CodLocalAtual

