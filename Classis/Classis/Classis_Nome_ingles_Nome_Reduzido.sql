--Select A_NomeIng, Matricula from EAcompl where a_nomeing is null

SELECT A_NomeIng, 
	  SUBSTRING(A_NomeIng,PATINDEX('%,%',A_NomeIng)+2, LEN(A_NomeIng))+' '+ 
 	  SUBSTRING(A_NomeIng,0, LEN(A_NomeIng)-(PATINDEX('%,%', REVERSE(A_NomeIng))-1))
FROM EAcompl


-- Update EACompl set A_NomeReduzido = SUBSTRING(A_NomeIng,PATINDEX('%,%',A_NomeIng)+2, LEN(A_NomeIng))+' '+ 
-- 	  SUBSTRING(A_NomeIng,0, LEN(A_NomeIng)-(PATINDEX('%,%', REVERSE(A_NomeIng))-1))