/*

								SQL Template Version V1.3
								
    Author:						Frank Geisler, Johan Ludvig Brattås
    Create date:				2024-08-22
                                                                                                                                                                                                                         
    Project:					Microsoft Fabric Realtime Intelligence - O'Reilly

*/

ALTER TABLE graphdemo.sales_transaction  
ADD CONSTRAINT FK_sales_transaction_ID_product_product FOREIGN KEY(ID_product)
REFERENCES graphdemo.product (ID_product);
GO