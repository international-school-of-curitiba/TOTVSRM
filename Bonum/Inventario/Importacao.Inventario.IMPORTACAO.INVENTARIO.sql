Select 
	Inventario.codigobarra, 
	(Select top 1 Chapa from Pfunc where Nome = funcionario) as func, 
	(Select top 1 codlocal from ILocal where nome = local)as localizacao, local
from Inventario
inner join Ibem (NoLock) on (Ibem.Codigobarra = Inventario.codigobarra)
order by localizacao, funcionario

update Inventario set funcionario = 'MARIA LUCIA FERREIRA DOS SANTOS' where funcionario = 'SORELLA'

Update Inventario Set local = 'Campus VS' where local = 'Vila Schaffer'



select nome from PFunc where codsituacao <> 'D' and nome >= 'LUC'order by nome