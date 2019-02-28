/*RELAÇÃO DE DEVEDORES POR PARCELA E ANO LETIVO*/

Select distinct  
        FCFO.CODCFO,
		FCFO.Nome,
	CAST(
	Case
            WHEN EDescLan.Parcela = 1 THEN '08'
            WHEN EDescLan.Parcela = 2 THEN '09'
            WHEN EDescLan.Parcela = 3 THEN '10'
            WHEN EDescLan.Parcela = 4 THEN '11'
            WHEN EDescLan.Parcela = 5 THEN '12'
            WHEN EDescLan.Parcela = 6 THEN '01'
            WHEN EDescLan.Parcela = 7 THEN '02'
            WHEN EDescLan.Parcela = 8 THEN '03'
            WHEN EDescLan.Parcela = 9 THEN '04'
            WHEN EDescLan.Parcela = 10 THEN '05'
            WHEN EDescLan.Parcela = 11 THEN '06'
            WHEN EDescLan.Parcela = 12 THEN '07'
       END AS CHAR(2)) +'/'+ 
       CAST(YEAR(eDescLan.Data) AS CHAR(4)) ParcelaAno,
        EDescLan.Parcela, FLAN.VALORORIGINAL, EDESCLAN.DESCRICAO
From 
	EdescLan, Flan, Ealunos, FCFO
where 	
	FLan.StatusLan = '0'
--and     FCFO.CodCFO = 'c01494'
and 	EDescLan.CodLanc = Flan.IDLan
and	EAlunos.Respons = FCFO.CodCFO
and     EAlunos.Matricula = EDesclan.MatAluno
and     EdescLan.Perletivo = '16/17'
Order by EdescLan.Parcela