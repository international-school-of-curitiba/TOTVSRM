Select distinct
	PPessoa.Nome Responsavel,
	EAlunos.Nome Aluno,
	EdescLan.Parcela Parcela,
	EdescLan.TipoLanc Servico,
	FLan.ValorOriginal Valor
From 
	EdescLan, Flan, Ealunos, PPessoa
where 	
	FLan.StatusLan = '0' 
and 	EDescLan.CodLanc = Flan.IDLan
and     EdescLan.TipoLanc in (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16) 
and     EAlunos.Matricula = EdescLan.Mataluno
and	EAlunos.pai = PPessoa.codigo
Order by
	PPessoa.Nome


--Responsavel em aberto
Select Distinct
	PPessoa.Nome
From 
	EdescLan, Flan, Ealunos, PPessoa
where 	
	FLan.StatusLan = '0' 
and 	EDescLan.CodLanc = Flan.IDLan
and     EdescLan.TipoLanc in (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16) 
and     EAlunos.Matricula = EdescLan.Mataluno
and	EAlunos.pai = PPessoa.codigo



--Total por parcela por servico e por responsavel
Select distinct
	FCFO.Nome,
	sum(FLan.ValorOriginal)
From 
	EdescLan, Flan, Ealunos, FCFO
where 	
	FLan.StatusLan = '0' 
and 	EDescLan.CodLanc = Flan.IDLan
and     EAlunos.Matricula = EdescLan.Mataluno
and	Flan.CodCFO = FCFO.CodCFO
and     EdescLan.Parcela ='6' 
and 	EdescLan.TipoLanc= '1'
Group by 
	FCFO.Nome


Select * from Flan