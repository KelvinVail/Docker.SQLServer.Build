CREATE TABLE [dbo].[FactResellerSales](
	[ProductKey] [int] NOT NULL,
	[OrderDateKey] [int] NOT NULL,
	[DueDateKey] [int] NOT NULL,
	[ShipDateKey] [int] NOT NULL,
	[ResellerKey] [int] NOT NULL,
	[EmployeeKey] [int] NOT NULL,
	[PromotionKey] [int] NOT NULL,
	[CurrencyKey] [int] NOT NULL,
	[SalesTerritoryKey] [int] NOT NULL,
	[SalesOrderNumber] [nvarchar](20) NOT NULL,
	[SalesOrderLineNumber] [tinyint] NOT NULL,
	[RevisionNumber] [tinyint] NULL,
	[OrderQuantity] [smallint] NULL,
	[UnitPrice] [money] NULL,
	[ExtendedAmount] [money] NULL,
	[UnitPriceDiscountPct] [float] NULL,
	[DiscountAmount] [float] NULL,
	[ProductStandardCost] [money] NULL,
	[TotalProductCost] [money] NULL,
	[SalesAmount] [money] NULL,
	[TaxAmt] [money] NULL,
	[Freight] [money] NULL,
	[CarrierTrackingNumber] [nvarchar](25) NULL,
	[CustomerPONumber] [nvarchar](25) NULL,
	[OrderDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[ShipDate] [datetime] NULL
) ON [PRIMARY];
GO
ALTER TABLE [dbo].[FactResellerSales] ADD 
    CONSTRAINT [FK_FactResellerSales_DimCurrency] FOREIGN KEY([CurrencyKey])
			REFERENCES [dbo].[DimCurrency] ([CurrencyKey]),
	CONSTRAINT [FK_FactResellerSales_DimDate] FOREIGN KEY([OrderDateKey])
			REFERENCES [dbo].[DimDate] ([DateKey]),
	CONSTRAINT [FK_FactResellerSales_DimDate1] FOREIGN KEY([DueDateKey])
			REFERENCES [dbo].[DimDate] ([DateKey]),
	CONSTRAINT [FK_FactResellerSales_DimDate2] FOREIGN KEY([ShipDateKey])
			REFERENCES [dbo].[DimDate] ([DateKey]),
	CONSTRAINT [FK_FactResellerSales_DimEmployee] FOREIGN KEY([EmployeeKey])
			REFERENCES [dbo].[DimEmployee] ([EmployeeKey]),
	CONSTRAINT [FK_FactResellerSales_DimProduct] FOREIGN KEY([ProductKey])
			REFERENCES [dbo].[DimProduct] ([ProductKey]),
	CONSTRAINT [FK_FactResellerSales_DimPromotion] FOREIGN KEY([PromotionKey])
			REFERENCES [dbo].[DimPromotion] ([PromotionKey]),
	CONSTRAINT [FK_FactResellerSales_DimReseller] FOREIGN KEY([ResellerKey])
			REFERENCES [dbo].[DimReseller] ([ResellerKey]),
	CONSTRAINT [FK_FactResellerSales_DimSalesTerritory] FOREIGN KEY([SalesTerritoryKey])
			REFERENCES [dbo].[DimSalesTerritory] ([SalesTerritoryKey]);
GO
ALTER TABLE [dbo].[FactResellerSales] WITH CHECK ADD 
    CONSTRAINT [PK_FactResellerSales_SalesOrderNumber_SalesOrderLineNumber] PRIMARY KEY CLUSTERED 
    (
        [SalesOrderNumber], [SalesOrderLineNumber]
    )  ON [PRIMARY];