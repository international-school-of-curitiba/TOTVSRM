Select
	UDataAval.CodMat, UDataAval.NumProva,
	UDataAval.CodEtapa,
	UDataAval.Descricao,
	Case when UDataAval.NumProva = '1' and UDataAval.CodEtapa= '1' then 
		(Select P1 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '2' and UDataAval.CodEtapa= '1' then 
		(Select P2 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '3'  and UDataAval.CodEtapa= '1' then 
		(Select P3 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '4'  and UDataAval.CodEtapa= '1' then 
		(Select P4 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '5'  and UDataAval.CodEtapa= '1' then 
		(Select P5 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '6' and UDataAval.CodEtapa= '1' then 
		(Select P6 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '7' and UDataAval.CodEtapa= '1' then 
		(Select P7 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '8' and UDataAval.CodEtapa= '1' then 
		(Select P8 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '9' and UDataAval.CodEtapa= '1' then 
		(Select P9 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '10' and UDataAval.CodEtapa= '1' then 
		(Select P10 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '11' and UDataAval.CodEtapa= '1' then 
		(Select P11 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '12' and UDataAval.CodEtapa= '1' then 
		(Select P12 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '13' and UDataAval.CodEtapa= '1' then 
		(Select P13 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '14' and UDataAval.CodEtapa= '1' then 
		(Select P14 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '15' and UDataAval.CodEtapa= '1' then 
		(Select P15 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '16' and UDataAval.CodEtapa= '1' then 
		(Select P16 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '17' and UDataAval.CodEtapa= '1' then 
		(Select P17 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '18' and UDataAval.CodEtapa= '1' then 
		(Select P18 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '19' and UDataAval.CodEtapa= '1' then 
		(Select P19 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '20' and UDataAval.CodEtapa= '1' then 
		(Select P20 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	end as NotaQ1,
	Case when UDataAval.NumProva = '1' and UDataAval.CodEtapa= '2' then 
		(Select P1 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '2' and UDataAval.CodEtapa= '2' then 
		(Select P2 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '3' and UDataAval.CodEtapa= '2' then 
		(Select P3 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '4' and UDataAval.CodEtapa= '2' then 
		(Select P4 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '5' and UDataAval.CodEtapa= '2' then 
		(Select P5 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '6' and UDataAval.CodEtapa= '2' then 
		(Select P6 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '7' and UDataAval.CodEtapa= '2' then 
		(Select P7 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '8' and UDataAval.CodEtapa= '2' then 
		(Select P8 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '9' and UDataAval.CodEtapa= '2' then 
		(Select P9 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '10' and UDataAval.CodEtapa= '2' then 
		(Select P10 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '11' and UDataAval.CodEtapa= '2' then 
		(Select P11 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '12' and UDataAval.CodEtapa= '2' then 
		(Select P12 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '13' and UDataAval.CodEtapa= '2' then 
		(Select P13 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '14' and UDataAval.CodEtapa= '2' then 
		(Select P14 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '15' and UDataAval.CodEtapa= '2' then 
		(Select P15 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '16' and UDataAval.CodEtapa= '2' then 
		(Select P16 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '17' and UDataAval.CodEtapa= '2' then 
		(Select P17 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '18' and UDataAval.CodEtapa= '2' then 
		(Select P18 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '19' and UDataAval.CodEtapa= '2' then 
		(Select P19 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '20' and UDataAval.CodEtapa= '2' then 
		(Select P20 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
             End as NotaQ2,
	Case when UDataAval.NumProva = '1' and UDataAval.CodEtapa= '6' then 
		(Select P1 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '2' and UDataAval.CodEtapa= '6' then 
		(Select P2 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '3'  and UDataAval.CodEtapa= '6' then 
		(Select P3 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '4'  and UDataAval.CodEtapa= '6' then 
		(Select P4 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '5'  and UDataAval.CodEtapa= '6' then 
		(Select P5 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '6'  and UDataAval.CodEtapa= '6' then 
		(Select P6 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '7' and UDataAval.CodEtapa= '6' then 
		(Select P7 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '8'  and UDataAval.CodEtapa= '6' then 
		(Select P8 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '9'  and UDataAval.CodEtapa= '6' then 
		(Select P9 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '10'  and UDataAval.CodEtapa= '6' then 
		(Select P10 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '11'  and UDataAval.CodEtapa= '6' then 
		(Select P11 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '12'  and UDataAval.CodEtapa= '6' then 
		(Select P12 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '13'  and UDataAval.CodEtapa= '6' then 
		(Select P13 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '14'  and UDataAval.CodEtapa= '6' then 
		(Select P14 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '15'  and UDataAval.CodEtapa= '6' then 
		(Select P15 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '16'  and UDataAval.CodEtapa= '6' then 
		(Select P16 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '17'  and UDataAval.CodEtapa= '6' then 
		(Select P17 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '18'  and UDataAval.CodEtapa= '6' then 
		(Select P18 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '19'  and UDataAval.CodEtapa= '6' then 
		(Select P19 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '20'  and UDataAval.CodEtapa= '6' then 
		(Select P20 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
             End as NotaQ3,
	Case when UDataAval.NumProva = '1' and UDataAval.CodEtapa= '7' then 
		(Select P1 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '2' and UDataAval.CodEtapa= '7' then 
		(Select P2 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '3'  and UDataAval.CodEtapa= '7' then 
		(Select P3 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '4'  and UDataAval.CodEtapa= '7' then 
		(Select P4 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '5'  and UDataAval.CodEtapa= '7' then 
		(Select P5 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '6'  and UDataAval.CodEtapa= '7' then 
		(Select P6 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '7' and UDataAval.CodEtapa= '7' then 
		(Select P7 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '8'  and UDataAval.CodEtapa= '7' then 
		(Select P8 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '9'  and UDataAval.CodEtapa= '7' then 
		(Select P9 From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '10'  and UDataAval.CodEtapa= '7' then 
		(Select P10 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '11'  and UDataAval.CodEtapa= '7' then 
		(Select P11 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '12'  and UDataAval.CodEtapa= '7' then 
		(Select P12 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '13'  and UDataAval.CodEtapa= '7' then 
		(Select P13 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '14'  and UDataAval.CodEtapa= '7' then 
		(Select P14 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '15'  and UDataAval.CodEtapa= '7' then 
		(Select P15 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '16'  and UDataAval.CodEtapa= '7' then 
		(Select P16 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '17'  and UDataAval.CodEtapa= '7' then 
		(Select P17 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '18'  and UDataAval.CodEtapa= '7' then 
		(Select P18 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '19'  and UDataAval.CodEtapa= '7' then 
		(Select P19 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '20'  and UDataAval.CodEtapa= '7' then 
		(Select P20 From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EAlunoTPR.Mataluno=:Espelho#2 and EAlunoTPR.Perletivo=:Espelho#1)
             End as NotaQ4
from UDataAval
Right join EAlunoTPR (NoLock) on (EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodEtp = UDataAval.CodEtapa and EAlunoTPR.CodTur = UDataAval.CodTur )
Inner Join EAlunos (nolock) on (Ealunos.Matricula = EalunoTPR.Mataluno)
Where EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1 /*and EAlunoTPR.CodEtp = '1'*/
Order by CodEtapa
