CREATE TABLE [dbo].[DimGeography](
	[GeographyKey] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](30) NULL,
	[StateProvinceCode] [nvarchar](3) NULL,
	[StateProvinceName] [nvarchar](50) NULL,
	[CountryRegionCode] [nvarchar](3) NULL,
	[EnglishCountryRegionName] [nvarchar](50) NULL,
	[SpanishCountryRegionName] [nvarchar](50) NULL,
	[FrenchCountryRegionName] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](15) NULL,
	[SalesTerritoryKey] [int] NULL,
	[IpAddressLocator] [nvarchar](15) NULL
) ON [PRIMARY];
GO
ALTER TABLE [dbo].[DimGeography] ADD
    CONSTRAINT [FK_DimGeography_DimSalesTerritory]  FOREIGN KEY 
    (
        [SalesTerritoryKey]
    ) REFERENCES [dbo].[DimSalesTerritory] ([SalesTerritoryKey]);
GO
ALTER TABLE [dbo].[DimGeography] WITH CHECK ADD 
    CONSTRAINT [PK_DimGeography_GeographyKey] PRIMARY KEY CLUSTERED 
    (
       [GeographyKey]
    )  ON [PRIMARY];