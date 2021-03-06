
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER TRIGGER [INSERT_UPDATE_EDESCLAN_RATEIOS]
ON [dbo].[EDESCLAN]
FOR INSERT, UPDATE
AS
BEGIN
	insert into 
		flanratdep (codcoligada, idlan, codfilial, coddepartamento,valor)
	select
		f.codcoligada, f.idlan, 1, right(f.codtdo,4), f.valororiginal
	from 
		flan f, gdepto g, edesclan e
	where  
		idlan not in (
		select 
			idlan 
		from 
			flanratdep) 
		and f.codtdo not in ('000016') and right(f.codtdo,4) = g.coddepartamento 
		and g.codfilial = f.codfilial and g.codcoligada = f.codcoligada 
		and f.idlan = e.codlanc
END
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

