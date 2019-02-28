Select 
CodPerlet, 
DATEADD(dd, -(DAY(DATEADD(mm,1,DTINICIO))-1),DATEADD(mm,1,DTINICIO)) as 'August.01',
DateAdd(mm,1,(DATEADD(dd, -(DAY(DATEADD(mm,1,DTINICIO))),DATEADD(mm,1,DTINICIO))))as 'August.31',
DateAdd(mm,1,(DATEADD(dd, -(DAY(DATEADD(mm,1,DTINICIO))-1),DATEADD(mm,1,DTINICIO)))) as 'Sep.01',
DateAdd(mm,1,(DATEADD(dd, -(DAY(DATEADD(mm,1,DTINICIO))),DATEADD(mm,2,DTINICIO)))) as 'Sep.30',
DateAdd(mm,1,(DATEADD(dd, -(DAY(DATEADD(mm,1,DTINICIO))-1),DATEADD(mm,2,DTINICIO)))) as 'Out.01',
DateAdd(mm,1,(DATEADD(dd, -(DAY(DATEADD(mm,1,DTINICIO))),DATEADD(mm,3,DTINICIO))))+ 1 as 'Out.31',
DateAdd(mm,1,(DATEADD(dd, -(DAY(DATEADD(mm,1,DTINICIO))-1),DATEADD(mm,3,DTINICIO)))) as 'Nov.01',
DateAdd(mm,1,(DATEADD(dd, -(DAY(DATEADD(mm,1,DTINICIO))),DATEADD(mm,4,DTINICIO)))) as 'Nov.30',
DateAdd(mm,1,(DATEADD(dd, -(DAY(DATEADD(mm,1,DTINICIO))-1),DATEADD(mm,4,DTINICIO)))) as 'Dec.01',
DateAdd(mm,1,(DATEADD(dd, -(DAY(DATEADD(mm,1,DTINICIO))),DATEADD(mm,5,DTINICIO))))+ 1 as 'Dec.31',
DateAdd(mm,1,(DATEADD(dd, -(DAY(DATEADD(mm,1,DTINICIO))-1),DATEADD(mm,5,DTINICIO)))) as 'Jan.01',
DateAdd(mm,1,(DATEADD(dd, -(DAY(DATEADD(mm,1,DTINICIO))),DATEADD(mm,6,DTINICIO)))) as 'Jan.31',
DateAdd(mm,1,(DATEADD(dd, -(DAY(DATEADD(mm,1,DTINICIO))-1),DATEADD(mm,6,DTINICIO)))) as 'Feb.01',
DateAdd(mm,1,(DATEADD(dd, -(DAY(DATEADD(mm,1,DTINICIO))),DATEADD(mm,7,DTINICIO))))as 'Feb.28',
DateAdd(mm,1,(DATEADD(dd, -(DAY(DATEADD(mm,1,DTINICIO))),DATEADD(mm,7,DTINICIO)))) + 1 as 'Mar.01',
DateAdd(mm,1,(DATEADD(dd, -(DAY(DATEADD(mm,1,DTINICIO))-1),DATEADD(mm,8,DTINICIO))))-1 as 'Mar.31',
DateAdd(mm,1,(DATEADD(dd, -(DAY(DATEADD(mm,1,DTINICIO))-1),DATEADD(mm,8,DTINICIO)))) as 'April.01',
DateAdd(mm,1,(DATEADD(dd, -(DAY(DATEADD(mm,1,DTINICIO))),DATEADD(mm,9,DTINICIO)))) as 'April.30',
DateAdd(mm,1,(DATEADD(dd, -(DAY(DATEADD(mm,1,DTINICIO))-1),DATEADD(mm,9,DTINICIO)))) as 'May.01',
DateAdd(mm,1,(DATEADD(dd, -(DAY(DATEADD(mm,1,DTINICIO))),DATEADD(mm,10,DTINICIO)))) + 1 as 'Mary.31',
DateAdd(mm,1,(DATEADD(dd, -(DAY(DATEADD(mm,1,DTINICIO))-1),DATEADD(mm,10,DTINICIO))))as 'June.01',
DateAdd(mm,1,(DATEADD(dd, -(DAY(DATEADD(mm,1,DTINICIO))),DATEADD(mm,11,DTINICIO)))) as 'June.30',
DateAdd(mm,1,(DATEADD(dd, -(DAY(DATEADD(mm,1,DTINICIO))-1),DATEADD(mm,11,DTINICIO)))) as 'July.01',
DateAdd(mm,1,(DATEADD(dd, -(DAY(DATEADD(mm,1,DTINICIO))),DATEADD(mm,12,DTINICIO)))) + 1 as 'July.31'

from EperLet
--where CodPerlet in ('06/07', '08/09', '09/10','10/11') 


/*
	dateadd(d, 1, dateadd(m, -12, DTFim)),  dateadd(m, -11, DTFim),
	dateadd(d, 1, dateadd(m, -11, DTFim)),  dateadd(m, -10, DTFim),
 DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,DTFim),0)),
 DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,DTFim),0)),

CAST(CAST(YEAR(DTFim) AS VARCHAR(4)) + '/' + 
                CAST(MONTH(DTFim) AS VARCHAR(2)) + '/01' AS DATETIME),*/
