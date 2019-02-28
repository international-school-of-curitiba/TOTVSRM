
---Select Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, MediaProva, Notafalta, '2' as CodEtapa, Descricao  from UDataAval where codtur = '1A'


Select * from UDataAval 

/* COPIA AS PROVAS DA PRIMEIRA ETAPA (1ST QUARTER) PARA AS OUTRAS ETAPAS (QUARTERS) */

-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '201ART', '1A', NumProva, PontConc, PontNum, Notafalta, '2', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1' and CodMat = '201ART'
-- CODETAPA 6 IS THE 3RD QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '201LRE', '1A', NumProva, PontConc, PontNum, Notafalta, '6', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1'
-- CODETAPA 7 IS THE 4TH QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '201LRE', '1A', NumProva, PontConc, PontNum, Notafalta, '7', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1'




/* COPIA AS PROVAS DA 1A na 1B */

-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '201LRE', '1B', NumProva, PontConc, PontNum, Notafalta, '2', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1'
-- CODETAPA 6 IS THE 3RD QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '201LRE', '1B', NumProva, PontConc, PontNum, Notafalta, '6', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1'
-- CODETAPA 7 IS THE 4TH QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '201LRE', '1B', NumProva, PontConc, PontNum, Notafalta, '7', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1'




/* COPIA AS PROVAS DA 1A na 2A */

-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '202LRE', '2A', NumProva, PontConc, PontNum, Notafalta, '1', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1'
-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '202LRE', '2A', NumProva, PontConc, PontNum, Notafalta, '2', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1'
-- CODETAPA 6 IS THE 3RD QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '202LRE', '2A', NumProva, PontConc, PontNum, Notafalta, '6', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1'
-- CODETAPA 7 IS THE 4TH QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '202LRE', '2A', NumProva, PontConc, PontNum, Notafalta, '7', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1'



/* COPIA AS PROVAS DA 2A na 2B */

-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '202LRE', '2B', NumProva, PontConc, PontNum, Notafalta, '1', Descricao, MediaProva  from UDataAval where codtur = '2A' AND CODETAPA = '1'
-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '202LRE', '2B', NumProva, PontConc, PontNum, Notafalta, '2', Descricao, MediaProva  from UDataAval where codtur = '2A' AND CODETAPA = '1'
-- CODETAPA 6 IS THE 3RD QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '202LRE', '2B', NumProva, PontConc, PontNum, Notafalta, '6', Descricao, MediaProva  from UDataAval where codtur = '2A' AND CODETAPA = '1'
-- CODETAPA 7 IS THE 4TH QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '202LRE', '2B', NumProva, PontConc, PontNum, Notafalta, '7', Descricao, MediaProva  from UDataAval where codtur = '2A' AND CODETAPA = '1'



/* COPIA AS PROVAS DA 2A na 3A */

-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '203LRE', '3A', NumProva, PontConc, PontNum, Notafalta, '1', Descricao, MediaProva  from UDataAval where codtur = '2A' AND CODETAPA = '1'
-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '203LRE', '3A', NumProva, PontConc, PontNum, Notafalta, '2', Descricao, MediaProva  from UDataAval where codtur = '2A' AND CODETAPA = '1'
-- CODETAPA 6 IS THE 3RD QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '203LRE', '3A', NumProva, PontConc, PontNum, Notafalta, '6', Descricao, MediaProva  from UDataAval where codtur = '2A' AND CODETAPA = '1'
-- CODETAPA 7 IS THE 4TH QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '203LRE', '3A', NumProva, PontConc, PontNum, Notafalta, '7', Descricao, MediaProva  from UDataAval where codtur = '2A' AND CODETAPA = '1'


/* COPIAR AS AVALIACOES DA 4A DO 1ST QUARTER PARA AS OUTRAS ETAPAS */ 

-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '204LRE', '4A', NumProva, PontConc, PontNum, Notafalta, '2', Descricao, MediaProva  from UDataAval where codtur = '4A' AND CODETAPA = '1' AND CodMat = '204LRE'
-- CODETAPA 6 IS THE 3RD QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '204LRE', '4A', NumProva, PontConc, PontNum, Notafalta, '6', Descricao, MediaProva  from UDataAval where codtur = '4A' AND CODETAPA = '1' AND CodMat = '204LRE'
-- CODETAPA 7 IS THE 4TH QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '204LRE', '4A', NumProva, PontConc, PontNum, Notafalta, '7', Descricao, MediaProva  from UDataAval where codtur = '4A' AND CODETAPA = '1' AND CodMat = '204LRE'

/* COPIA AS AVALIACOES DA 4A PARA A 4B */

-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '204LRE', '4B', NumProva, PontConc, PontNum, Notafalta, '1', Descricao, MediaProva  from UDataAval where codtur = '4A' AND CODETAPA = '1' AND CodMat = '204LRE'
-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '204LRE', '4B', NumProva, PontConc, PontNum, Notafalta, '2', Descricao, MediaProva  from UDataAval where codtur = '4A' AND CODETAPA = '1' AND CodMat = '204LRE'
-- CODETAPA 6 IS THE 3RD QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '204LRE', '4B', NumProva, PontConc, PontNum, Notafalta, '6', Descricao, MediaProva  from UDataAval where codtur = '4A' AND CODETAPA = '1' AND CodMat = '204LRE'
-- CODETAPA 7 IS THE 4TH QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '204LRE', '4B', NumProva, PontConc, PontNum, Notafalta, '7', Descricao, MediaProva  from UDataAval where codtur = '4A' AND CODETAPA = '1' AND CodMat = '204LRE'



/* COPIA AS AVALIACOES DA 4A PARA A 5A */

-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '205LRE', '5A', NumProva, PontConc, PontNum, Notafalta, '1', Descricao, MediaProva  from UDataAval where codtur = '4A' AND CODETAPA = '1' AND CodMat = '204LRE'
-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '205LRE', '5A', NumProva, PontConc, PontNum, Notafalta, '2', Descricao, MediaProva  from UDataAval where codtur = '4A' AND CODETAPA = '1' AND CodMat = '204LRE'
-- CODETAPA 6 IS THE 3RD QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '205LRE', '5A', NumProva, PontConc, PontNum, Notafalta, '6', Descricao, MediaProva  from UDataAval where codtur = '4A' AND CODETAPA = '1' AND CodMat = '204LRE'
-- CODETAPA 7 IS THE 4TH QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '205LRE', '5A', NumProva, PontConc, PontNum, Notafalta, '7', Descricao, MediaProva  from UDataAval where codtur = '4A' AND CODETAPA = '1' AND CodMat = '204LRE'









/* TEM QUE DIGITAR TODAS AS AVALIACOES NA DISCIPLINA DE WRITTING DA 1A

/* COPIA AS PROVAS DA PRIMEIRA ETAPA (1ST QUARTER) PARA AS OUTRAS ETAPAS (QUARTERS) PARA WRITTING */

-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '201LWR', '1B', NumProva, PontConc, PontNum, Notafalta, '2', Descricao, MediaProva  from UDataAval where codtur = '1B' AND CODETAPA = '1' AND CODMAT = '201LWR'
-- CODETAPA 6 IS THE 3RD QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '201LWR', '1B', NumProva, PontConc, PontNum, Notafalta, '6', Descricao, MediaProva  from UDataAval where codtur = '1B' AND CODETAPA = '1'AND CODMAT = '201LWR'
-- CODETAPA 7 IS THE 4TH QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '201LWR', '1B', NumProva, PontConc, PontNum, Notafalta, '7', Descricao, MediaProva  from UDataAval where codtur = '1B' AND CODETAPA = '1'AND CODMAT = '201LWR'



-- CODETAPA 1 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '201LWR', '1A', NumProva, PontConc, PontNum, Notafalta, '1', Descricao, MediaProva  from UDataAval where codtur = '1B' AND CODETAPA = '1' AND CODMAT = '201LWR'
-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '201LWR', '1A', NumProva, PontConc, PontNum, Notafalta, '2', Descricao, MediaProva  from UDataAval where codtur = '1B' AND CODETAPA = '1' AND CODMAT = '201LWR'
-- CODETAPA 6 IS THE 3RD QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '201LWR', '1A', NumProva, PontConc, PontNum, Notafalta, '6', Descricao, MediaProva  from UDataAval where codtur = '1B' AND CODETAPA = '1'AND CODMAT = '201LWR'
-- CODETAPA 7 IS THE 4TH QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '201LWR', '1A', NumProva, PontConc, PontNum, Notafalta, '7', Descricao, MediaProva  from UDataAval where codtur = '1B' AND CODETAPA = '1'AND CODMAT = '201LWR'



/* COPIA DA 1A PARA 2A */ 

-- CODETAPA 1 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '202LWR', '2A', NumProva, PontConc, PontNum, Notafalta, '1', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1' AND CODMAT = '201LWR'
-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '202LWR', '2A', NumProva, PontConc, PontNum, Notafalta, '2', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1' AND CODMAT = '201LWR'
-- CODETAPA 6 IS THE 3RD QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '202LWR', '2A', NumProva, PontConc, PontNum, Notafalta, '6', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1'AND CODMAT = '201LWR'
-- CODETAPA 7 IS THE 4TH QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '202LWR', '2A', NumProva, PontConc, PontNum, Notafalta, '7', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1'AND CODMAT = '201LWR'



/* COPIA DA 2A PARA 2B */ 

-- CODETAPA 1 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '202LWR', '2B', NumProva, PontConc, PontNum, Notafalta, '1', Descricao, MediaProva  from UDataAval where codtur = '2A' AND CODETAPA = '1' AND CODMAT = '202LWR'
-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '202LWR', '2B', NumProva, PontConc, PontNum, Notafalta, '2', Descricao, MediaProva  from UDataAval where codtur = '2A' AND CODETAPA = '1' AND CODMAT = '202LWR'
-- CODETAPA 6 IS THE 3RD QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '202LWR', '2B', NumProva, PontConc, PontNum, Notafalta, '6', Descricao, MediaProva  from UDataAval where codtur = '2A' AND CODETAPA = '1'AND CODMAT = '202LWR'
-- CODETAPA 7 IS THE 4TH QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '202LWR', '2B', NumProva, PontConc, PontNum, Notafalta, '7', Descricao, MediaProva  from UDataAval where codtur = '2A' AND CODETAPA = '1'AND CODMAT = '202LWR'


/* COPIA DA 2B PARA 3A */ 

-- CODETAPA 1 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '203LWR', '3A', NumProva, PontConc, PontNum, Notafalta, '1', Descricao, MediaProva  from UDataAval where codtur = '2A' AND CODETAPA = '1' AND CODMAT = '202LWR'
-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '203LWR', '3A', NumProva, PontConc, PontNum, Notafalta, '2', Descricao, MediaProva  from UDataAval where codtur = '2A' AND CODETAPA = '1' AND CODMAT = '202LWR'
-- CODETAPA 6 IS THE 3RD QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '203LWR', '3A', NumProva, PontConc, PontNum, Notafalta, '6', Descricao, MediaProva  from UDataAval where codtur = '2A' AND CODETAPA = '1'AND CODMAT = '202LWR'
-- CODETAPA 7 IS THE 4TH QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '203LWR', '3A', NumProva, PontConc, PontNum, Notafalta, '7', Descricao, MediaProva  from UDataAval where codtur = '2A' AND CODETAPA = '1'AND CODMAT = '202LWR'




/* COPIA DA 3A PARA 4A */ 

-- CODETAPA 1 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '204LWR', '4A', NumProva, PontConc, PontNum, Notafalta, '1', Descricao, MediaProva  from UDataAval where codtur = '2A' AND CODETAPA = '1' AND CODMAT = '202LWR'
-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '204LWR', '4A', NumProva, PontConc, PontNum, Notafalta, '2', Descricao, MediaProva  from UDataAval where codtur = '2A' AND CODETAPA = '1' AND CODMAT = '202LWR'
-- CODETAPA 6 IS THE 3RD QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '204LWR', '4A', NumProva, PontConc, PontNum, Notafalta, '6', Descricao, MediaProva  from UDataAval where codtur = '2A' AND CODETAPA = '1'AND CODMAT = '202LWR'
-- CODETAPA 7 IS THE 4TH QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '204LWR', '4A', NumProva, PontConc, PontNum, Notafalta, '7', Descricao, MediaProva  from UDataAval where codtur = '2A' AND CODETAPA = '1'AND CODMAT = '202LWR'



/* COPIA DA 4A PARA 4B */ 

-- CODETAPA 1 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '204LWR', '4B', NumProva, PontConc, PontNum, Notafalta, '1', Descricao, MediaProva  from UDataAval where codtur = '4A' AND CODETAPA = '1' AND CODMAT = '204LWR'
-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '204LWR', '4B', NumProva, PontConc, PontNum, Notafalta, '2', Descricao, MediaProva  from UDataAval where codtur = '4A' AND CODETAPA = '1' AND CODMAT = '204LWR'
-- CODETAPA 6 IS THE 3RD QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '204LWR', '4B', NumProva, PontConc, PontNum, Notafalta, '6', Descricao, MediaProva  from UDataAval where codtur = '4A' AND CODETAPA = '1'AND CODMAT = '204LWR'
-- CODETAPA 7 IS THE 4TH QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '204LWR', '4B', NumProva, PontConc, PontNum, Notafalta, '7', Descricao, MediaProva  from UDataAval where codtur = '4A' AND CODETAPA = '1'AND CODMAT = '204LWR'


/* COPIA DA 4B PARA 5A */ 

-- CODETAPA 1 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '205LWR', '5A', NumProva, PontConc, PontNum, Notafalta, '1', Descricao, MediaProva  from UDataAval where codtur = '4A' AND CODETAPA = '1' AND CODMAT = '204LWR'
-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '205LWR', '5A', NumProva, PontConc, PontNum, Notafalta, '2', Descricao, MediaProva  from UDataAval where codtur = '4A' AND CODETAPA = '1' AND CODMAT = '204LWR'
-- CODETAPA 6 IS THE 3RD QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '205LWR', '5A', NumProva, PontConc, PontNum, Notafalta, '6', Descricao, MediaProva  from UDataAval where codtur = '4A' AND CODETAPA = '1'AND CODMAT = '204LWR'
-- CODETAPA 7 IS THE 4TH QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '205LWR', '5A', NumProva, PontConc, PontNum, Notafalta, '7', Descricao, MediaProva  from UDataAval where codtur = '4A' AND CODETAPA = '1'AND CODMAT = '204LWR'


/* COPIAR AS AVALIACAOES DE ORAL COMMUNICATION 1ST QUARTER P/ TODAS ETAPAS */

Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '201LOC', '1A', NumProva, PontConc, PontNum, Notafalta, '1', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1' AND CODMAT = '201PCO'
-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '201LOC', '1A', NumProva, PontConc, PontNum, Notafalta, '2', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '2' AND CODMAT = '201LOC'
-- CODETAPA 6 IS THE 3RD QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '201LOC', '1A', NumProva, PontConc, PontNum, Notafalta, '6', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '2'AND CODMAT = '201LOC'
-- CODETAPA 7 IS THE 4TH QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '201LOC', '1A', NumProva, PontConc, PontNum, Notafalta, '7', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '2'AND CODMAT = '201LOC'

/* 1A P/ 1B */

Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '201LOC', '1B', NumProva, PontConc, PontNum, Notafalta, '1', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1' AND CODMAT = '201LOC'
-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '201LOC', '1B', NumProva, PontConc, PontNum, Notafalta, '2', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1' AND CODMAT = '201LOC'
-- CODETAPA 6 IS THE 3RD QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '201LOC', '1B', NumProva, PontConc, PontNum, Notafalta, '6', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1'AND CODMAT = '201LOC'
-- CODETAPA 7 IS THE 4TH QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '201LOC', '1B', NumProva, PontConc, PontNum, Notafalta, '7', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1'AND CODMAT = '201LOC'

/* 1b p/2a */ 

Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '205LOC', '5A', NumProva, PontConc, PontNum, Notafalta, '1', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1' AND CODMAT = '201LOC'
-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '205LOC', '5A', NumProva, PontConc, PontNum, Notafalta, '2', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1' AND CODMAT = '201LOC'
-- CODETAPA 6 IS THE 3RD QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '205LOC', '5A', NumProva, PontConc, PontNum, Notafalta, '6', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1'AND CODMAT = '201LOC'
-- CODETAPA 7 IS THE 4TH QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '205LOC', '5A', NumProva, PontConc, PontNum, Notafalta, '7', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1'AND CODMAT = '201LOC'

/* PORTUGUES */ 

Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '205LOC', '5A', NumProva, PontConc, PontNum, Notafalta, '1', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1' AND CODMAT = '201LOC'
-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '201PCO', '1A', NumProva, PontConc, PontNum, Notafalta, '2', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1' AND CODMAT = '201PCO'
-- CODETAPA 6 IS THE 3RD QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '201PCO', '1A', NumProva, PontConc, PontNum, Notafalta, '6', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1'AND CODMAT = '201PCO'
-- CODETAPA 7 IS THE 4TH QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '201PCO', '1A', NumProva, PontConc, PontNum, Notafalta, '7', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1'AND CODMAT = '201PCO'



Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '205PCO', '5A', NumProva, PontConc, PontNum, Notafalta, '1', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1' AND CODMAT = '201PCO'
-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '205PCO', '5A', NumProva, PontConc, PontNum, Notafalta, '2', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1' AND CODMAT = '201PCO'
-- CODETAPA 6 IS THE 3RD QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '205PCO', '5A', NumProva, PontConc, PontNum, Notafalta, '6', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1'AND CODMAT = '201PCO'
-- CODETAPA 7 IS THE 4TH QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '205PCO', '5A', NumProva, PontConc, PontNum, Notafalta, '7', Descricao, MediaProva  from UDataAval where codtur = '1A' AND CODETAPA = '1'AND CODMAT = '201PCO'



Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '205BHG', '5A', NumProva, PontConc, PontNum, Notafalta, '1', Descricao, MediaProva  from UDataAval where codtur = '5A' AND CODETAPA = '1' AND CODMAT =  '204BHG'
-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '205BHG', '5A', NumProva, PontConc, PontNum, Notafalta, '2', Descricao, MediaProva  from UDataAval where codtur = '5A' AND CODETAPA = '1' AND CODMAT =  '205BHG'
-- CODETAPA 6 IS THE 3RD QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '205BHG', '5A', NumProva, PontConc, PontNum, Notafalta, '6', Descricao, MediaProva  from UDataAval where codtur = '5A' AND CODETAPA = '1'AND CODMAT =  '205BHG'
-- CODETAPA 7 IS THE 4TH QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '205BHG', '5A', NumProva, PontConc, PontNum, Notafalta, '7', Descricao, MediaProva  from UDataAval where codtur = '5A' AND CODETAPA = '1'AND CODMAT =  '205BHG'


