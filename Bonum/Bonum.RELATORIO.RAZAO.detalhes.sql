exec sp_executesql N'--PatRelRazaoAuxiliarProc
SELECT  IPATRIMONIO.CODFILIAL,
                                                         IPATRIMONIO.PATRIMONIO, ipatrimonio.idpatrimonio,
                                                         IGRUPOPATRIMONIO.CODCOLIGADA                         CODCOLIGADA,
                                                         IGRUPOCONTA.CODCONTA                  CODCONTA,
                                                         CCONTA.DESCRICAO                           DESCRICAO,
                                                         @1                                                   DATA,
                                                         0                                   TIPOGRUPO,--VALOR BASE
                                                         0                                                    TIPOITEM,--SALDO INICIAL
                                                         ISALDOCALCULOPATRIMONIOMOEDA.VALORBASECORRIGIDO ACR,
                                                         ISALDOCALCULOPATRIMONIOMOEDA.VALORBASEINDICE    ACRINDICE,
                                                         0.00                                                 DIM,
                                                         0.00                                                 DIMINDICE,
                                                         ''Valor Base'' DESCTIPOGRUPO,
                                                         ''Saldo Anterior'' DESCTIPOITEM,
                                                          0.00                                  AQUISICAO,
                                                          0.00                                  AQUISICAOINDICE,
                                                          0.00                                  ACRESCIMO,
                                                          0.00                                  ACRESCIMOINDICE,
                                                          0.00                                  BAIXA,
                                                          0.00                                  BAIXAINDICE,
                                                          0.00                                  TRANORIG,
                                                          0.00                                  TRANORIGINDICE,
                                                          0.00                                  TRANDEST,
                                                          0.00                                  TRANDESTINDICE,
                                                          ISALDOCALCULOPATRIMONIOMOEDA.REAVALIACAO          REAVALIACAO,
                                                          ''ISALDOCALCULOPATRIMONIOMOEDA''                                   TABELAORIGEM
                                                  FROM   ISALDOCALCULOPATRIMONIOMOEDA (NOLOCK) LEFT JOIN
                                                         IPATRIMONIO (NOLOCK) ON
			                                                      (IPATRIMONIO.CODCOLIGADA = ISALDOCALCULOPATRIMONIOMOEDA.CODCOLIGADA
				                                                      AND IPATRIMONIO.IDPATRIMONIO = ISALDOCALCULOPATRIMONIOMOEDA.IDPATRIMONIO) LEFT JOIN
                                                         IGRUPOPATRIMONIO (NOLOCK) ON
			                                                      ( IGRUPOPATRIMONIO.CODCOLIGADA = IPATRIMONIO.CODCOLIGADA
                                                              AND IGRUPOPATRIMONIO.IDGRUPOPATRIMONIO = IPATRIMONIO.IDGRUPOPATRIMONIO ) LEFT JOIN 
                                                         IDEFAULTCENARIOCALCULOGRUPO (NOLOCK) ON 
                                                            ( IDEFAULTCENARIOCALCULOGRUPO.CODCOLIGADA = IGRUPOPATRIMONIO.CODCOLIGADA
                                                              AND IDEFAULTCENARIOCALCULOGRUPO.IDGRUPOPATRIMONIO = IGRUPOPATRIMONIO.IDGRUPOPATRIMONIO) LEFT JOIN 
                                                         IGRUPOCONTA (NOLOCK) ON 
                                                            ( IGRUPOCONTA.CODCOLIGADA = IDEFAULTCENARIOCALCULOGRUPO.CODCOLIGADA
                                                              AND IGRUPOCONTA.IDGRUPOPATRIMONIO = IDEFAULTCENARIOCALCULOGRUPO.IDGRUPOPATRIMONIO
                                                              AND IGRUPOCONTA.IDCENARIOCALCULO = IDEFAULTCENARIOCALCULOGRUPO.IDCENARIOCALCULO) LEFT JOIN 
                                                         CCONTA (NOLOCK) ON 
                                                            ( CCONTA.CODCOLIGADA = IGRUPOCONTA.CODCOLIGADACONTA
                                                              AND CCONTA.CODCONTA = IGRUPOCONTA.CODCONTA ) 
                                                  WHERE  ISALDOCALCULOPATRIMONIOMOEDA.CODCOLIGADA = 1
                                                         AND ISALDOCALCULOPATRIMONIOMOEDA.IDCENARIOCALCULO = @IDCENARIOCALCULO_N
                                                         AND ISALDOCALCULOPATRIMONIOMOEDA.DATABASEPATRIMONIO <= @DATABASE_D
                                                         AND ISALDOCALCULOPATRIMONIOMOEDA.REAVALIACAO IS NOT NULL
                                                         AND IPATRIMONIO.TIPOOCORRENCIA <> 100
                                                         AND IPATRIMONIO.ATIVO = 1
                                                            
                                                         AND IPATRIMONIO.DATAAQUISICAO < @DATAAQUISICAO_D
                                                         AND ( IPATRIMONIO.IDGRUPOPATRIMONIO = 4 )
                                                         AND IDEFAULTCENARIOCALCULOGRUPO.IDCENARIOCALCULO = @IDCENARIOCALCULO2_N
                                                         AND IGRUPOCONTA.IDCLASSIFICACAO = 1
                                                          AND IGRUPOCONTA.CODCONTA IS NOT NULL
                                                  --GROUP  BY IPATRIMONIO.CODFILIAL,
                                                  --          IGRUPOPATRIMONIO.CODCOLIGADA,
                                                  --          IGRUPOCONTA.CODCONTA,
                                                  --          CCONTA.DESCRICAO
                                                  --          , ISALDOCALCULOPATRIMONIOMOEDA.REAVALIACAO
                                                  ORDER BY   ISALDOCALCULOPATRIMONIOMOEDA.REAVALIACAO',N'@1 datetime,@IDCENARIOCALCULO_N int,@DATABASE_D datetime,@DATAAQUISICAO_D datetime,@IDCENARIOCALCULO2_N int',@1='2012-12-31 00:00:00',@IDCENARIOCALCULO_N=1,@DATABASE_D='2013-01-01 00:00:00',@DATAAQUISICAO_D='2013-01-01 00:00:00',@IDCENARIOCALCULO2_N=1