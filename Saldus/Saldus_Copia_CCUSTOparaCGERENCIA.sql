Select * from CGerencia

Select CodReduzido from GCCusto
where CodCCusto not in (Select CodConta from CGerencia)



/* ATUALIZA O CADASTRO DAS CONTAS GERENCIAIS COM OS CODIGOS REDUZIDOS DO CENTRO DE CUSTOS 

Update CGerencia
Set CGerencia.Reduzido = GCCusto.CodReduzido
from CGerencia inner join GCCusto on (GCCusto.CodContaGer = CGerencia.CodConta)

*/



Select * from CGerencia
Select * from GCCusto



/* COPIA OS CENTRO DE CUSTOS NA TABELA DE CONTAS GERENCIAS 

Insert into CGerencia (CodColigada, CodConta, Reduzido, Descricao, Analitica, Natureza, Inativa)
Select 1, CodCCusto, CodReduzido, Substring(Nome,0,39) , Case when len(CodCCusto) = 18 then 1 else 0 end, 1, 0 from GCCusto
where CodCCusto not in (Select CodConta from CGerencia)

*/