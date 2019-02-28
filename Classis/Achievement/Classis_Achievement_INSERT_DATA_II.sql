	Declare @Subject as nvarchar(4)
	Declare @Value1 as nvarchar(4)
	Declare @Value2 as nvarchar(4)
	Declare @Value3 as nvarchar(4)
	Declare @Value4 as nvarchar(4)
	Declare @Value5 as nvarchar(4)
	Declare @Value6 as nvarchar(4)
	Declare @Value7 as nvarchar(4)

	Set @Subject = '14'

	Set @Value1 = '900'
	Set @Value2 = '7.7'
	Set @Value3 = '220'
	Set @Value4 = '5'
	Set @Value5 = '0'
	Set @Value6 = '19'
	Set @Value7 = '3'


	insert into isc.dbo.achiev_data values (@Subject, '114', '4', @Value1, getdate(), '10/11')
	insert into isc.dbo.achiev_data values (@Subject, '113', '4', @Value2, getdate(), '10/11')
	insert into isc.dbo.achiev_data values (@Subject, '111', '4', @Value3, getdate(), '10/11')
	insert into isc.dbo.achiev_data values (@Subject, '71', '4', @Value4, getdate(), '10/11')
	insert into isc.dbo.achiev_data values (@Subject, '72', '4', @Value5, getdate(), '10/11')
	insert into isc.dbo.achiev_data values (@Subject, '73', '4', @Value6, getdate(), '10/11')
    insert into isc.dbo.achiev_data values (@Subject, '55', '4', @Value7, getdate(), '10/11')


 