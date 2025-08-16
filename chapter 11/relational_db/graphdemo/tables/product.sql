CREATE TABLE graphdemo.product 

/*

								SQL Template Version V1.3
								
    Author:						Frank Geisler, Johan Ludvig Brattås
    Create date:				2024-08-22
    Revision History:			yyyy-mm-dd Revisor
										DescriptionOfChanges
                                                                                                                                                                                                                                                                                   
    Project:					Microsoft Fabric Realtime Intelligence - O'Reilly
    Description:				This table holds product information

    Execution Example:			SELECT TOP 10 * from graphdemo.product 

*/

(
	--Primary key
		ID_product INT IDENTITY (1,1) NOT NULL
		
	--Real data
	, product_name VARCHAR(100) NOT NULL
	, category VARCHAR(50) NOT NULL
	, price DECIMAL(10,2) NOT NULL
	, stock_quantity INT NOT NULL
)
ON [DEFAULT];
GO 

ALTER TABLE graphdemo.product 
ADD CONSTRAINT PKCL_product_ID_product PRIMARY KEY CLUSTERED (ID_product) 
WITH (FILLFACTOR = 100) ON [DEFAULT];
GO

ALTER TABLE graphdemo.product 
ADD CONSTRAINT UQ_product_product_name UNIQUE (product_name)
WITH (FILLFACTOR = 100) ON [DEFAULT];
GO

EXECUTE sys.sp_addextendedproperty 
	@name = N'MS_Description'
,	@value = N'This table holds product information'
,	@level0type = N'SCHEMA'
,	@level0name = N'graphdemo'
,	@level1type = N'TABLE'
,	@level1name = N'product';
GO

EXECUTE sys.sp_addextendedproperty 
	@name = N'Author'
,	@value = N'Frank Geisler'
,	@level0type = N'SCHEMA'
,	@level0name = N'graphdemo'
,	@level1type = N'TABLE'
,	@level1name = N'product';
GO

EXECUTE sys.sp_addextendedproperty 
	@name = N'Project'
,	@value = N'sustainable_juice_dwh'
,	@level0type = N'SCHEMA'
,	@level0name = N'graphdemo'
,	@level1type = N'TABLE'
,	@level1name = N'product';
GO

EXECUTE sys.sp_addextendedproperty 
	@name = N'Execution_Sample'
,	@value = N'SELECT TOP 10 * from graphdemo.product '
,	@level0type = N'SCHEMA'
,	@level0name = N'graphdemo'
,	@level1type = N'TABLE'
,	@level1name = N'product';
GO