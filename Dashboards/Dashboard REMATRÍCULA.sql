/* Dashboard REMATR�CULA */

SELECT 
	A.MATRICULA, A.NOME, EA.A_FAMILIA,
	CASE 
		WHEN (A.TIPOALUNO='1' OR A.TIPOALUNO='2') THEN 'LOCAL/TEMP'
		WHEN (A.TIPOALUNO='3' OR A.TIPOALUNO='4') THEN 'CORPORATE'
		WHEN (A.TIPOALUNO='5') THEN 'STAFF'
		WHEN (A.TIPOALUNO='6') THEN 'SCHOLARSHIP'
		ELSE 'UNDEFINED'
	END AS STD_TYPE,
	CASE  
		WHEN (UL.M_ATESTADOMEDICO IS NULL) THEN '0'
		WHEN (UL.M_ATESTADOMEDICO = '1') THEN 'NO'
		WHEN (UL.M_ATESTADOMEDICO = '2') THEN 'YES'
	END	AS ATESTADO, 
	CASE  
		WHEN (UL.M_ENTFORMULARIOFINANCEIRO IS NULL) THEN '0'
		WHEN (UL.M_ENTFORMULARIOFINANCEIRO = '1') THEN 'NO'
		WHEN (UL.M_ENTFORMULARIOFINANCEIRO = '2') THEN 'YES'
	END	AS FORMULARIO, 
	CASE  
		WHEN (UL.M_ENTACORDO IS NULL) THEN '0'
		WHEN (UL.M_ENTACORDO = '1') THEN 'NO'
		WHEN (UL.M_ENTACORDO = '2') THEN 'YES'
	END	AS CONTRATO,
	CASE
		WHEN ((UL.M_ATESTADOMEDICO IS NULL) AND (UL.M_ENTFORMULARIOFINANCEIRO IS NULL) AND (UL.M_ENTACORDO IS NULL)) THEN 'ENVELOPE N�O DEVOLVIDO'
		WHEN ((UL.M_ATESTADOMEDICO = 1) AND (UL.M_ENTFORMULARIOFINANCEIRO = 1) AND (UL.M_ENTACORDO = 1)) THEN 'ENVELOPE DEVOLVIDO SEM DOCUMENTOS'
		WHEN ((UL.M_ATESTADOMEDICO = 1) AND (UL.M_ENTFORMULARIOFINANCEIRO = 2) AND (UL.M_ENTACORDO = 2)) THEN 'FALTA ATESTADO M�DICO'
		WHEN ((UL.M_ATESTADOMEDICO = 2) AND (UL.M_ENTFORMULARIOFINANCEIRO = 1) AND (UL.M_ENTACORDO = 2)) THEN 'FALTA FORMUL�RIO'
		WHEN ((UL.M_ATESTADOMEDICO = 2) AND (UL.M_ENTFORMULARIOFINANCEIRO = 2) AND (UL.M_ENTACORDO = 1)) THEN 'FALTA CONTRATO'
		WHEN ((UL.M_ATESTADOMEDICO = 1) AND (UL.M_ENTFORMULARIOFINANCEIRO = 1) AND (UL.M_ENTACORDO = 2)) THEN 'FALTA ATESTADO M�DICO/FORMUL�RIO'
		WHEN ((UL.M_ATESTADOMEDICO = 1) AND (UL.M_ENTFORMULARIOFINANCEIRO = 2) AND (UL.M_ENTACORDO = 1)) THEN 'FALTA ATESTADO M�DICO/CONTRATO'
		WHEN ((UL.M_ATESTADOMEDICO = 1) AND (UL.M_ENTFORMULARIOFINANCEIRO = 1) AND (UL.M_ENTACORDO = 2)) THEN 'FALTA FORMUL�RIO/CONTRATO'
		WHEN ((UL.M_ATESTADOMEDICO = 2) AND (UL.M_ENTFORMULARIOFINANCEIRO = 2) AND (UL.M_ENTACORDO = 2)) THEN 'TODOS DEVOLVIDOS'
	END AS STATUS_ENVELOPE,
	CASE WHEN ((SELECT COUNT(U1.MATALUNO) FROM UMATRICPL U1 WHERE U1.MATALUNO = U.MATALUNO) > 1) THEN 'REENROLLMENT'
		ELSE 'NEW STUDENT'
	END AS ENR_TYPE, USITMAT.DESCRICAO AS ST_ENR,
	CASE WHEN ((SELECT COUNT(*) FROM EALUSERV WHERE EALUSERV.MATALUNO = U.MATALUNO AND EALUSERV.PERLETIVO = U.PERLETIVO) > 1 ) THEN 'CONTRATO GERADO'
		ELSE 'N�O GERADO'
	END AS STATUS_CONTRATO_FINANCEIRO,
	CASE
		WHEN U.CODCUR = 1 THEN 'ECC'
		WHEN (U.CODCUR = 2 AND U.PERIODO < 6) THEN 'ELEMENTARY'
		WHEN (U.CODCUR = 2 AND U.PERIODO > 5 AND U.PERIODO < 9) THEN 'MIDDLE'
		WHEN (U.CODCUR = 2 AND U.PERIODO = 9) THEN 'HIGH'
		WHEN (U.CODCUR = 3) THEN 'HIGH'
	END AS LEVEL,
	CASE
		WHEN U.CODCUR = 1 THEN 1
		WHEN (U.CODCUR = 2 AND U.PERIODO < 6) THEN 2
		WHEN (U.CODCUR = 2 AND U.PERIODO > 5 AND U.PERIODO < 9) THEN 3
		WHEN (U.CODCUR = 2 AND U.PERIODO = 9) THEN 4
		WHEN (U.CODCUR = 3) THEN 4
	END AS ORDERX, 
(
		SELECT COUNT(*) FROM EALUSERV WHERE A.MATRICULA = EALUSERV.MATALUNO AND U.PERLETIVO = EALUSERV.PERLETIVO
	) as GEROU_CONTRATO,
CASE WHEN (U.CODCUR = 1 AND U.PERIODO = 1) THEN 'Toddler'
WHEN (U.CODCUR = 1 AND U.PERIODO = 2) THEN 'Nursery'
WHEN (U.CODCUR = 1 AND U.PERIODO = 3) THEN 'Pre-K'
WHEN (U.CODCUR = 1 AND U.PERIODO = 4) THEN 'Kinder'
WHEN (U.CODCUR >= 2) THEN 'Grade ' + cast(U.PERIODO as varchar) end as Periodo, 
	CASE WHEN (U.CODCUR = 1 AND U.PERIODO = 1) THEN 1
		 WHEN (U.CODCUR = 1 AND U.PERIODO = 2) THEN 2
		 WHEN (U.CODCUR = 1 AND U.PERIODO = 3) THEN 3
		 WHEN (U.CODCUR = 1 AND U.PERIODO = 4) THEN 4
		 WHEN (U.CODCUR = 2 AND U.PERIODO = 1) THEN 5
		 WHEN (U.CODCUR = 2 AND U.PERIODO = 2) THEN 6
		 WHEN (U.CODCUR = 2 AND U.PERIODO = 3) THEN 7
		 WHEN (U.CODCUR = 2 AND U.PERIODO = 4) THEN 8
		 WHEN (U.CODCUR = 2 AND U.PERIODO = 5) THEN 9
		 WHEN (U.CODCUR = 2 AND U.PERIODO = 6) THEN 10
		 WHEN (U.CODCUR = 2 AND U.PERIODO = 7) THEN 11
		 WHEN (U.CODCUR = 2 AND U.PERIODO = 8) THEN 12
		 WHEN (U.CODCUR = 2 AND U.PERIODO = 9) THEN 13
		 WHEN (U.CODCUR = 3 AND U.PERIODO = 10) THEN 14
		 WHEN (U.CODCUR = 3 AND U.PERIODO = 11) THEN 15
		 WHEN (U.CODCUR = 3 AND U.PERIODO = 12) THEN 16 END
	AS CLASS_INDEX

	FROM EALUNOS A
	INNER JOIN EACOMPL EA ON A.MATRICULA = EA.MATRICULA
	INNER JOIN UMATRICPL U ON U.MATALUNO = A.MATRICULA
	INNER JOIN UMATRICPLLIVRE UL ON UL.MATALUNO = U.MATALUNO AND U.PERLETIVO = UL.PERLETIVO
	INNER JOIN USITMAT ON U.STATUS = USITMAT.CODSITMAT
WHERE U.PERLETIVO = '17/18'
		AND U.STATUS IN ('01','07')
		AND ((EA.A_DataEntradaISC <= GETDATE()+10 and A_DataSaidaISC is null) 
		OR 	(A_DataEntradaISC <= GETDATE() and A_DataSaidaISC > GETDATE())
		OR 	(A_ReturnedToISC <= GETDATE() and A_LeftISC_2 is null) 
		OR 	(A_ReturnedToISC <= GETDATE() and A_LeftISC_2 > GETDATE())) 
