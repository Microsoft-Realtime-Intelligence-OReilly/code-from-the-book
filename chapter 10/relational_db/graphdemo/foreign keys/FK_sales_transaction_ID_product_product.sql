/*

								SQL Template Version V1.3
								
    Author:						Frank Geisler, Johan Ludvig Brattås
    Create date:				2024-08-22
                                                                                                                                                                                                                         
    Project:					Microsoft Fabric Realtime Intelligence - O'Reilly

*/

ALTER TABLE graphdemo.interaction  
ADD CONSTRAINT FK_interaction_ID_target_customer_customer FOREIGN KEY(ID_target_customer)
REFERENCES graphdemo.customer (ID_customer);
GO