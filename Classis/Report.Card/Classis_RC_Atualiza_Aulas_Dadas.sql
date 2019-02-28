/* Atualiza o campo de Aulas Dadas com o total de aulas gerado na Lista de Presença - Fazer todos dos quarter */

Update Umatalun set  ad1 = (Select Count(*) from UListaPresenca 
where UListaPresenca.perletivo = '08/09' and UListaPresenca.MatAluno = Umatalun.MatAluno and UListaPresenca.codmat = UMatAlun.CodMat
Group by UListaPresenca.codmat)
where UMatAlun.perletivo = '08/09'

/* Advisory */

Update Umatalun set  ad1 = '3'
where UMatAlun.perletivo = '06/07'
and UMatAlun.CodMat LIKE '%adv'


/* Technology */

Update Umatalun set  ad1 = '0'
where UMatAlun.perletivo = '06/07'
and UMatAlun.CodMat LIKE '%tec'


Update Umatalun set ad2 = (Select Count(*) from corpore_teste.dbo.UListaPresenca 
where corpore_teste.dbo.UListaPresenca.Codetapa = 2 and corpore_teste.dbo.UListaPresenca.perletivo = '08/09' and corpore_teste.dbo.UListaPresenca.MatAluno = Umatalun.MatAluno and corpore_teste.dbo.UListaPresenca.codmat = UMatAlun.CodMat
Group by corpore_teste.dbo.UListaPresenca.codmat)
where UMatAlun.perletivo = '08/09'



Select * from UListaPresenca 
where UListaPresenca.Codetapa = '2' and UListaPresenca.perletivo = '08/09'