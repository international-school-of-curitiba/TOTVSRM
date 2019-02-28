select mataluno, * from umatalun where codmat = '303iha' and perletivo = '06/07' and codtur = '11A'

Select * from Umatturma where codmat = '303iha' and codperlet = '06/07' and codtur = '11A'

UPDATE UMATTURMA SET NUMALUNOS = (SELECT COUNT(CODTUR) FROM UMATALUN
WHERE CODTUR = '10A'AND PERLETIVO = '06/07'	AND CODMAT = '302WHI')
WHERE CODTUR = '10A'	AND CODPERLET = '06/07'	AND CODMAT = '302WHI'