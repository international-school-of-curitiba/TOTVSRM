select DEPRECIACAO, * from iCALCULORAZAO where data = '09/30/2015' AND DEPRECIACAO >= '20.08' 
AND IDPATRIMONIO IN (select IDPATRIMONIO from IPATRIMONIO where IDGRUPOPATRIMONIO = 4)

ORDER BY DEPRECIACAO


-- AND  DEPRECIACAO <= '22.87' AND  IDPATRIMONIO = 1349

select 
	
	* 
from IPATRIMONIO where IPATRIMONIO.IDPATRIMONIO = 597




UPDATE ICALCULORAZAO SET 
	DEPRECIACAO = DEPRECIACAO - 9.02, 
	DEPRECIACAOAJUSTADA = DEPRECIACAOAJUSTADA - 9.02, 
	DEPRECIACAOACUMULADA = DEPRECIACAOACUMULADA - 9.02, 
	DEPRECIACAOACUMULADACORRIGIDA = DEPRECIACAOACUMULADACORRIGIDA - 9.02
WHERE IDPATRIMONIO = 597 AND DATA= '09/30/2015'