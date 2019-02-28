SELECT EPROFES.CHAPA,
       	LEFT(LTRIM(STR((SUM(UPROFMATTURMA.NAULASSEMPROF*4.5)*100))),
	LEN(LTRIM(STR((SUM(UPROFMATTURMA.NAULASSEMPROF*4.5)*100))))-2),
	RIGHT(LTRIM(STR((SUM(UPROFMATTURMA.NAULASSEMPROF*4.5)*100))),2),
       GCCUSTO.CODCCUSTO
FROM 
       EPROFES, 
       UPROFMATTURMA,
       UGRADE,
       GCCUSTO
WHERE        
       UPROFMATTURMA.TIPOPROF = 'T'
and    UPROFMATTURMA.CODPERLET='05/06'
AND    EPROFES.CODPROF = UPROFMATTURMA.CODPROF
AND    UGRADE.CODMAT = UPROFMATTURMA.CODMAT
AND    UGRADE.CODMATG = GCCUSTO.CODREDUZIDO
GROUP BY 
       EPROFES.CHAPA,
       GCCUSTO.CODCCUSTO
ORDER BY
       EPROFES.CHAPA




AND    eprofes.chapa <> '000359'

select * from Eprofes where chapa='000359' or chapa= '000346'
order by NAULASSEMPROF


where NAULASSEMPROF here chapa='000346' or chapa= '000345'