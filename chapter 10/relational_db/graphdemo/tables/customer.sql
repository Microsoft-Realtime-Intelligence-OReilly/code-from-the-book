CREATE TABLE graphdemo.customer 

/*

								SQL Template Version V1.3
								
    Author:						Frank Geisler, Johan Ludvig Brattås
    Create date:				2024-08-22
    Revision History:			yyyy-mm-dd Revisor
										DescriptionOfChanges
                                                                                                                                                                                                                                                                                   
    Project:					Microsoft Fabric Realtime Intelligence - O'Reilly
    Description:				This table holds customer data

    Execution Example:			SELECT TOP 10 * from graphdemo.customer 

*/

(
	--Primary key
		ID_customer INT IDENTITY (1,1) NOT NULL
		
	--Real data
	, name varchar(30) NOT NULL
	, age int NOT NULL
	, city varchar(50) NOT NULL
	, gender char(1) NOT NULL
	, segment varchar(30) NOT NULL
)
ON [DEFAULT];
GO 

ALTER TABLE graphdemo.customer 
ADD CONSTRAINT PKCL_customer_ID_customer PRIMARY KEY CLUSTERED (ID_customer) 
WITH (FILLFACTOR = 100) ON [DEFAULT];
GO

ALTER TABLE graphdemo.customer 
ADD CONSTRAINT CHK_customer_gender CHECK (gender IN ('m','f','n'));
GO

ALTER TABLE graphdemo.customer 
ADD CONSTRAINT CHK_customer_segment CHECK (segment IN ('Premium','Regular','Student'));
GO

EXECUTE sys.sp_addextendedproperty 
	@name = N'MS_Description'
,	@value = N'This table holds customer data'
,	@level0type = N'SCHEMA'
,	@level0name = N'graphdemo'
,	@level1type = N'TABLE'
,	@level1name = N'customer';
GO

EXECUTE sys.sp_addextendedproperty 
	@name = N'Author'
,	@value = N'Frank Geisler'
,	@level0type = N'SCHEMA'
,	@level0name = N'graphdemo'
,	@level1type = N'TABLE'
,	@level1name = N'customer';
GO

EXECUTE sys.sp_addextendedproperty 
	@name = N'Project'
,	@value = N'sustainable_juice_dwh'
,	@level0type = N'SCHEMA'
,	@level0name = N'graphdemo'
,	@level1type = N'TABLE'
,	@level1name = N'customer';
GO

EXECUTE sys.sp_addextendedproperty 
	@name = N'Execution_Sample'
,	@value = N'SELECT TOP 10 * from graphdemo.customer '
,	@level0type = N'SCHEMA'
,	@level0name = N'graphdemo'
,	@level1type = N'TABLE'
,	@level1name = N'customer';
GO