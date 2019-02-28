 Select Distinct Ealunos.MATRICULA from EALUNOS
inner join EDESCLAN (NoLock) on (EDESCLAN.MataLuno = EALUNOS.MATRICULA)
inner join FLAN (NoLock) on (FLan.idlan = Edesclan.CodLanc and Flan.perletivo = Edesclan.perletivo)
inner Join EACOMPL (NoLock) on (EACOMPL.MATRICULA = EALUNOS.MATRICULA)
where 
	((EDESCLAN.PERLETIVO = '09/10' and EDESCLAN.PARCELA >= 6) 
or 	(EDESCLAN.PERLETIVO = '10/11' and EDESCLAN.PARCELA <= 5))
and  Flan.STATUSLAN = 1
and Ealunos.MATRICULA in (Select distinct EDESCLAN.MATALUNO from FLAN inner join Edesclan (NoLock) on (FLan.idlan = Edesclan.CodLanc and Flan.perletivo = Edesclan.perletivo) where FLAN.STATUSLAN = 0 and Flan.PAGREC = 1 and DATAVENCIMENTO <= '12/31/2010')

--and EACOMPL.A_DATAENTRADAISC <= '12/31/2010'
order by  Ealunos.MATRICULA --, EDESCLAN.PARCELA



/*
0  Em Aberto
1  Baixado
2  Cancelado
3  Baixado por Acordo
 */



