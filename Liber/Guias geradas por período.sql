/* Guias geradas por per�odo*/

SELECT * FROM DGUIAPERIODO
			WHERE (CODRECEITA = '3208' OR CODRECEITA = '0561')
				AND IDPER IN (
					SELECT IDPER FROM DPERIODO
						WHERE CODPER >= '01-01-2016' AND CODPER <= '12-31-2016' AND CODTRB = 'IRRFPF'
				)