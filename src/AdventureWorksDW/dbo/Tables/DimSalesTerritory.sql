CREATE TABLE [dbo].[DimSalesTerritory](
	[SalesTerritoryKey] [int] IDENTITY(1,1) NOT NULL,
	[SalesTerritoryAlternateKey] [int] NULL,
	[SalesTerritoryRegion] [nvarchar](50) NOT NULL,
	[SalesTerritoryCountry] [nvarchar](50) NOT NULL,
	[SalesTerritoryGroup] [nvarchar](50) NULL,
	[SalesTerritoryImage] [varbinary](max) NULL
) ON [PRIMARY];
GO
ALTER TABLE [dbo].[DimSalesTerritory] WITH CHECK ADD 
    CONSTRAINT [PK_DimSalesTerritory_SalesTerritoryKey] PRIMARY KEY CLUSTERED 
    (
        [SalesTerritoryKey]
    )  ON [PRIMARY];
GO
/****** Object:  Index [AK_DimSalesTerritory_SalesTerritoryAlternateKey]    Script Date: 7/8/2016 2:43:13 PM ******/
ALTER TABLE [dbo].[DimSalesTerritory] ADD  CONSTRAINT [AK_DimSalesTerritory_SalesTerritoryAlternateKey] UNIQUE NONCLUSTERED 
(
	[SalesTerritoryAlternateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)