CREATE TABLE [dbo].[FactSalesQuota](
	[SalesQuotaKey] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeKey] [int] NOT NULL,
	[DateKey] [int] NOT NULL,
	[CalendarYear] [smallint] NOT NULL,
	[CalendarQuarter] [tinyint] NOT NULL,
	[SalesAmountQuota] [money] NOT NULL,
	[Date] [datetime] NULL
) ON [PRIMARY];
GO
ALTER TABLE [dbo].[FactSalesQuota] ADD 
    CONSTRAINT [FK_FactSalesQuota_DimEmployee] FOREIGN KEY([EmployeeKey])
			REFERENCES [dbo].[DimEmployee] ([EmployeeKey]),
    CONSTRAINT [FK_FactSalesQuota_DimDate] FOREIGN KEY([DateKey])
			REFERENCES [dbo].[DimDate] ([DateKey]);
GO
ALTER TABLE [dbo].[FactSalesQuota] WITH CHECK ADD 
    CONSTRAINT [PK_FactSalesQuota_SalesQuotaKey] PRIMARY KEY CLUSTERED 
    (
       [SalesQuotaKey]
    )  ON [PRIMARY];