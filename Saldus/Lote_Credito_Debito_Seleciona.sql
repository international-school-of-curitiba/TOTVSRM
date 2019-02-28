select 	ClCtLote.Debito, 
	ClCtLote.Credito, 
	ClCtLote.Valor,   
	CHistp.Descricao,
	ClCtLote.CodCCusto,
	GCCusto.Nome,
	ClCtLote.Data
from	ClCtLote, CHistP, GCCusto 
Where 	ClCtLote.CodHistP = CHistp.CodHistP
and 	ClCtLote.CodCCusto = GCCusto.CodCcusto
Order by ClCtLote.Debito