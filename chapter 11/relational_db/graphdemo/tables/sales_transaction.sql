CREATE TABLE graphdemo.sales_transaction 

/*

								SQL Template Version V1.3
								
    Author:						Frank Geisler, Johan Ludvig Brattås
    Create date:				2024-08-22
    Revision History:			yyyy-mm-dd Revisor
										DescriptionOfChanges
                                                                                                                                                                                                                                                                                   
    Project:					Microsoft Fabric Realtime Intelligence - O'Reilly
    Description:				This table holds all transaction records

    Execution Example:			SELECT TOP 10 * from graphdemo.sales_transaction 

*/

(
	--Primary key
		ID_sales_transaction int IDENTITY (1,1) NOT NULL
	--Foreign Key
	,	ID_customer int NOT NULL
	,   ID_product int NOT NULL
	--Real data
	, purchase_date date NOT NULL
	, quantity int NOT NULL
	, price decimal(10,2) NOT NULL
)
ON [DEFAULT];
GO 

ALTER TABLE graphdemo.sales_transaction 
ADD CONSTRAINT PKCL_transaction_ID_transaction PRIMARY KEY CLUSTERED (ID_sales_transaction) 
WITH (FILLFACTOR = 100) ON [DEFAULT];
GO

EXECUTE sys.sp_addextendedproperty 
	@name = N'MS_Description'
,	@value = N'This table holds all transaction records'
,	@level0type = N'SCHEMA'
,	@level0name = N'graphdemo'
,	@level1type = N'TABLE'
,	@level1name = N'sales_transaction';
GO

EXECUTE sys.sp_addextendedproperty 
	@name = N'Author'
,	@value = N'Frank Geisler'
,	@level0type = N'SCHEMA'
,	@level0name = N'graphdemo'
,	@level1type = N'TABLE'
,	@level1name = N'sales_transaction';
GO

EXECUTE sys.sp_addextendedproperty 
	@name = N'Project'
,	@value = N'sustainable_juice_dwh'
,	@level0type = N'SCHEMA'
,	@level0name = N'graphdemo'
,	@level1type = N'TABLE'
,	@level1name = N'sales_transaction';
GO

EXECUTE sys.sp_addextendedproperty 
	@name = N'Execution_Sample'
,	@value = N'SELECT TOP 10 * from graphdemo.sales_transaction '
,	@level0type = N'SCHEMA'
,	@level0name = N'graphdemo'
,	@level1type = N'TABLE'
,	@level1name = N'sales_transaction';
GO