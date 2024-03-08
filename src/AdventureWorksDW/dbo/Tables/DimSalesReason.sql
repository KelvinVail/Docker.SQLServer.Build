CREATE TABLE [dbo].[DimSalesReason](
	[SalesReasonKey] [int] IDENTITY(1,1) NOT NULL,
	[SalesReasonAlternateKey] [int] NOT NULL,
	[SalesReasonName] [nvarchar](50) NOT NULL,
	[SalesReasonReasonType] [nvarchar](50) NOT NULL
) ON [PRIMARY];
GO
ALTER TABLE [dbo].[DimSalesReason] WITH CHECK ADD 
    CONSTRAINT [PK_DimSalesReason_SalesReasonKey] PRIMARY KEY CLUSTERED 
    (
        [SalesReasonKey]
    )  ON [PRIMARY];