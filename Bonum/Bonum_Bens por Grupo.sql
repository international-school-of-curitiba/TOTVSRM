/*Bens por Grupo*/

Select CodigoBarra, CodBem, IBEM.DESCRICAO, VrAquisicao, IBEM.IDGRUPOPATRIMONIO, IGRUPOPATRIMONIO.DESCRICAO,
--(Select Nome from Pfunc where chapa = chapafuncatual) as Responsavel,
CodLocalAtual,
(Select Nome from Ilocal where codlocal = CodLocalAtual) as Local,
codFilial,
Quantidade,
dtaquisicao,
NumeroDocumento
from Ibem
JOIN IGRUPOPATRIMONIO ON IBEM.IDGRUPOPATRIMONIO = IGRUPOPATRIMONIO.IDGRUPOPATRIMONIO
Where Ibem.Ativo = 1
and substring(codbem,1,2) like '%'
and len(codbem)= 7
Order by CodLocalAtual

--SELECT * FROM IGRUPOPATRIMONIO