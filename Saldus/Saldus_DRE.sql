
Select Top 1
	CConta.CodConta, Descricao,
	Round(
	isnull((Select Sum(Valor) from CLanca where Clanca.Credito between '3.1.01.001.0001' and '3.1.01.001.0001.9999' and Clanca.Data >= '08/01/2006' and Clanca.Data <= '08/31/2006'), 0) - 
	isnull((Select Sum(Valor) from CLanca where Clanca.Debito  between '3.1.01.001.0001' and '3.1.01.001.0001.9999' and Clanca.Data >= '08/01/2006' and Clanca.Data <= '08/31/2006'), 0), - 0.5) as Mensalidade,
	Round(
	isnull((Select Sum(Valor) from CLanca where Clanca.Credito between '3.1.01.001.0002' and '3.1.01.001.0002.9999' and Clanca.Data >= '08/01/2006' and Clanca.Data <= '08/31/2006'), 0) - 
	isnull((Select Sum(Valor) from CLanca where Clanca.Debito  between '3.1.01.001.0002' and '3.1.01.001.0002.9999' and Clanca.Data >= '08/01/2006' and Clanca.Data <= '08/31/2006'), 0), - 0.5) as Reserva
from CConta
where CConta.Reduzido = '206'


Select CodConta, CodConta +'.9999' from CConta Where Reduzido in (Select ContaDoGrupo from ZDRE)

/* 
CREATE TABLE dbo.ZDRE
( 	GRUPO		 Varchar(02), 
  	CONTADOGRUPO Varchar(03),
)
/*
Grupo #1 -> Receita Bruta/Educação
Grupo #2 -> Deduções
Grupo #3 -> Receita Operacional Líquida
Grupo #4 -> Custo dos Serviços
Grupo #5 -> Superavit Bruto
Grupo #6 -> Receitas (Despesas) Operacionais
Grupo #7 -> Resultado Operacional
Grupo #8 -> Resultado Não Operacionais
Grupo #9 -> Superávit do Exercício */

Insert into ZDRE (Grupo, ContaDoGrupo) Values ( '8', '498') 
Select * from ZDRE
*/