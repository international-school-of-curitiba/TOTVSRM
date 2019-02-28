

SELECT Codmat, a1, f1, AD1, a2, f2, AD2, a3, a4, a5, a6, f6, AD6, a7, f7, AD7, a8,a9,a10, a0 FROM UMATALUN
WHERE PERLETIVO = '06/07'
and Mataluno = '00282'
AND CODMAT in( '303FILO')


update UMATALUN
set a1 =91  ,
	ad1=20  ,
	a2 =90 ,
	ad2=22  , 
	a3 =91  , 
	a4 =null, 
	a5 =91  ,
	a6 =91  ,
	ad6=21  ,
	a7 =90  ,
	ad7=17  , 
	a8 =91  , 
	a9 =null, 
	a10=91 ,
	a0 =91
WHERE PERLETIVO = '06/07'
and Mataluno = '00282'
AND CODMAT in( '303FILO')

/*
UPDATE UMATALUN
SET AD1 = 20, AD2 = 22, AD6=21 , AD7=17
WHERE PERLETIVO = '06/07'
AND CODCUR = 3
AND CODMAT = '303LEME'
AND AD6 =1

*/