/*

								SQL Template Version V1.3
								
    Author:						Frank Geisler, Johan Ludvig Brattås
    Create date:				2024-08-22
    Revision History:			yyyy-mm-dd Revisor
										DescriptionOfChanges
                                                                                                                                                                                                                                                                                   
    Project:					Microsoft Fabric Realtime Intelligence - O'Reilly
    Description:				This schema holds all objects for setting up the data for the graph demo of chapter 10.

*/

CREATE SCHEMA graphdemo AUTHORIZATION dbo;
GO

EXECUTE sys.sp_addextendedproperty 
    @name = N'MS_Description'
,	@value = N'This schema holds all objects for setting up the data for the graph demo of chapter 10.'
,	@level0type = N'SCHEMA'
,	@level0name = N'graphdemo';
GO

EXECUTE sys.sp_addextendedproperty 
    @name = N'Author'
,	@value = N'Frank Geisler'
,	@level0type = N'SCHEMA'
,	@level0name = N'graphdemo';
GO

EXECUTE sys.sp_addextendedproperty 
    @name = N'Project'
,	@value = N'sustainable_juice_dwh'
,	@level0type = N'SCHEMA'
,	@level0name = N'graphdemo';
GO