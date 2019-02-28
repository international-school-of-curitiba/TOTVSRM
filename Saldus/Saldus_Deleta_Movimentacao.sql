Declare @MaiorLCTRef nvarchar(6);
Declare @MenorLCTRef nvarchar(6);

Set @MaiorLCTRef = '529582' --441433 até 441507
Set @MenorLCTRef = @MaiorLCTRef 

delete 
 tmovrat 
where 	cast(idmov as varchar) in (select integrachave from clanca where LCTREF >= @MaiorLCTRef and LCTREF <= @MenorLCTRef)

delete 
	tmovcont 
where 	cast(idmov as varchar) in (select integrachave from clanca where LCTREF >= @MaiorLCTRef and LCTREF <= @MenorLCTRef)


delete
	CRateioLc
where LCTREF >= @MaiorLCTRef and LCTREF <= @MenorLCTRef

delete 
	clanca 
where LCTREF >= @MaiorLCTRef and LCTREF <= @MenorLCTRef


/*
-- DELETA OS MOVIMENTO GERADO PELO NUCLEUS ...
delete 
	tmovrat 
where 	cast(idmov as varchar) in (select integrachave from clanca where data >= '04/01/06' and data <= '08/31/06' and LCTREF in ('19671', '19672','19673', '19674', '19676', '19677', '19678', '19679', '19680', '19682', '19683', '19684', '19685', '19686'))



delete 
	tmovcont 
where 	cast(idmov as varchar) in (select integrachave from clanca where data >= '04/01/06' and data <= '08/31/06' and LCTREF in ('19671', '19672','19673', '19674', '19676', '19677', '19678', '19679', '19680', '19682', '19683', '19684', '19685', '19686'))


delete 
	clanca 
where data >= '04/01/06' and data <= '08/31/06' and LCTREF in ('19671', '19672','19673', '19674', '19676', '19677', '19678', '19679', '19680', '19682', '19683', '19684', '19685', '19686')



--Select * from tmovrat where cast(idmov as varchar) in (select integrachave from clanca where LCTREF >= '18986')

Select * from CLanca where LCTREF >= '200829' and LCTREF <= '200829'
Compute sum(valor)

Update CLanca set debito= '2.1.01.002.0001.0009' where LCTREF >= '38992' and LCTREF <='39024'

Update CLanca set DATA = '12/31/2006' where LCTREF >= '44661' AND  LCTREF <= '44668'


Update CLanca set Valor ='1262.00' where LCTREF >= '157225' and LCTREF <= '157226'

update CrateioLC set VLRDebito = '1262.00' where LCTREF >= '157225' and LCTREF <= '157226'


*/