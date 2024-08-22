/*

								SQL Template Version V1.3
								
    Author:						Frank Geisler, Johan Ludvig Brattås
    Create date:				2024-08-22
                                                                                                                                                                                                                         
    Project:					Microsoft Fabric Realtime Intelligence - O'Reilly

*/

ALTER TABLE graphdemo.sales_transaction  
ADD CONSTRAINT FK_sales_transaction_ID_customer_customer FOREIGN KEY(ID_customer)
REFERENCES graphdemo.customer (ID_customer);
GO