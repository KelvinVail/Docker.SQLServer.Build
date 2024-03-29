﻿CREATE TABLE [dbo].[FactInternetSalesReason](
	[SalesOrderNumber] [nvarchar](20) NOT NULL,
	[SalesOrderLineNumber] [tinyint] NOT NULL,
	[SalesReasonKey] [int] NOT NULL
) ON [PRIMARY];
GO
ALTER TABLE [dbo].[FactInternetSalesReason] ADD 
    CONSTRAINT [FK_FactInternetSalesReason_FactInternetSales] FOREIGN KEY 
    (
        [SalesOrderNumber], [SalesOrderLineNumber]
    ) REFERENCES [dbo].[FactInternetSales] ([SalesOrderNumber], [SalesOrderLineNumber]),
	CONSTRAINT [FK_FactInternetSalesReason_DimSalesReason] FOREIGN KEY
	(
		[SalesReasonKey]
	) REFERENCES [dbo].[DimSalesReason] ([SalesReasonKey]);
GO
ALTER TABLE [dbo].[FactInternetSalesReason] WITH CHECK ADD 
    CONSTRAINT [PK_FactInternetSalesReason_SalesOrderNumber_SalesOrderLineNumber_SalesReasonKey] PRIMARY KEY CLUSTERED 
    (
        [SalesOrderNumber], [SalesOrderLineNumber], [SalesReasonKey]
    )  ON [PRIMARY];