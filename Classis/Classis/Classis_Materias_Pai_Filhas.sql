Select
	Mat1.CodMat,
	Mat1.Materia,
	(Select Mat2.Codmat from Umaterias Mat2 where Mat2.codmat = Mat1.MateriaPai) as Materia_Filha,
	(Select Mat2.materia from Umaterias Mat2 where Mat2.codmat = Mat1.MateriaPai) as Nome_Filha,
	(Select Mat2.MateriaPai from Umaterias Mat2 where Mat2.codmat = Mat1.MateriaPai) as Filha_Filha
from Umaterias Mat1
Where Mat1.MateriaPai is not null

