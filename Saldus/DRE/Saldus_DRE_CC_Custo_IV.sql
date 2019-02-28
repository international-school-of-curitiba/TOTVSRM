Select  - Round(sum(ISNULL(VlrDebito, 0) - ISNULL(VlrCredito, 0)), - 0.5)from CRateioLC where 
CodConta >= :Espelho#16 and CodConta <= :Espelho#17
and data >= :DATA_INICIO and Data <= :DATA_FIM
and CASE WHEN :Espelho#15 = '267' THEN CodGerencial end >= '1.01.01.05.50.5000' 
and CASE WHEN :Espelho#15 = '267' THEN CodGerencial end <= '1.01.01.05.59.5900'
or (CodGerencial >= '1.01.01.06.60.6000' and CodGerencial <= '1.01.01.06.69.6093')
or (CodGerencial >= '1.02.01.05.50.5000' and CodGerencial <= '1.02.01.05.59.5900')
or (CodGerencial >= '1.02.01.06.60.6000' and CodGerencial <= '1.02.01.06.69.6093')
or (CodGerencial >= '1.03.01.05.50.5000' and CodGerencial <= '1.03.01.05.59.5900')
or (CodGerencial >= '1.03.01.06.60.6000' and CodGerencial <= '1.03.01.06.69.6093')
or (CodGerencial >= '1.03.02.05.50.5000' and CodGerencial <= '1.03.02.05.59.5900')
or (CodGerencial >= '1.03.02.06.60.6000' and CodGerencial <= '1.03.02.06.69.6093')
or (CodGerencial >= '1.04.01.05.50.5000' and CodGerencial <= '1.04.01.05.59.5900')
or (CodGerencial >= '1.04.01.06.60.6000' and CodGerencial <= '1.04.01.06.69.6093')
or (CodGerencial >= '1.04.02.05.50.5000' and CodGerencial <= '1.04.02.05.59.5900')
or (CodGerencial >= '1.04.02.06.60.6000' and CodGerencial <= '1.04.02.06.69.6093')
or (CodGerencial >= '1.05.01.05.50.5000' and CodGerencial <= '1.05.01.05.59.5900')
or (CodGerencial >= '1.05.01.06.60.6000' and CodGerencial <= '1.05.01.06.69.6093')
or (CodGerencial >= '1.05.02.05.50.5000' and CodGerencial <= '1.05.02.05.59.5900')
or (CodGerencial >= '1.05.02.06.60.6000' and CodGerencial <= '1.05.02.06.69.6093')
or (CodGerencial >= '1.06.01.05.50.5000' and CodGerencial <= '1.06.01.05.59.5900')
or (CodGerencial >= '1.06.01.06.60.6000' and CodGerencial <= '1.06.01.06.69.6093')
or (CodGerencial >= '1.06.02.05.50.5000' and CodGerencial <= '1.06.02.05.59.5900')
or (CodGerencial >= '1.06.02.06.60.6000' and CodGerencial <= '1.06.02.06.69.6093')
) end