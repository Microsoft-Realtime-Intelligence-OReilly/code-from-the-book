CREATE TABLE graphdemo.interaction 

/*

								SQL Template Version V1.3
								
    Author:						Frank Geisler, Johan Ludvig Brattås
    Create date:				2024-08-22
    Revision History:			yyyy-mm-dd Revisor
										DescriptionOfChanges
                                                                                                                                                                                                                                                                                   
    Project:					Microsoft Fabric Realtime Intelligence - O'Reilly
    Description:				This table holds records about interactions between customers.

    Execution Example:			SELECT TOP 10 * from graphdemo.interaction 

*/

(
	--Primary key
		ID_interaction INT IDENTITY (1,1) NOT NULL
	--Foreign Key
	,	ID_source_customer INT NOT NULL
	,   ID_target_customer INT NOT NULL
	--Real data
	, interaction_type VARCHAR(50) NOT NULL
	, interaction_date DATE NOT NULL
	, weight DECIMAL(10,2) NOT NULL
)
ON [DEFAULT];
GO 

ALTER TABLE graphdemo.interaction 
ADD CONSTRAINT PKCL_interaction_ID_interaction PRIMARY KEY CLUSTERED (ID_interaction) 
WITH (FILLFACTOR = 100) ON [DEFAULT];
GO

ALTER TABLE graphdemo.interaction 
ADD CONSTRAINT CHK_interaction_interaction_type CHECK (interaction_type in ('referral', 'email', 'social media') );
GO

EXECUTE sys.sp_addextendedproperty 
	@name = N'MS_Description'
,	@value = N'This table holds records about interactions between customers.'
,	@level0type = N'SCHEMA'
,	@level0name = N'graphdemo'
,	@level1type = N'TABLE'
,	@level1name = N'interaction';
GO

EXECUTE sys.sp_addextendedproperty 
	@name = N'Author'
,	@value = N'Frank Geisler'
,	@level0type = N'SCHEMA'
,	@level0name = N'graphdemo'
,	@level1type = N'TABLE'
,	@level1name = N'interaction';
GO

EXECUTE sys.sp_addextendedproperty 
	@name = N'Project'
,	@value = N'sustainable_juice_dwh'
,	@level0type = N'SCHEMA'
,	@level0name = N'graphdemo'
,	@level1type = N'TABLE'
,	@level1name = N'interaction';
GO

EXECUTE sys.sp_addextendedproperty 
	@name = N'Execution_Sample'
,	@value = N'SELECT TOP 10 * from graphdemo.interaction '
,	@level0type = N'SCHEMA'
,	@level0name = N'graphdemo'
,	@level1type = N'TABLE'
,	@level1name = N'interaction';
GO