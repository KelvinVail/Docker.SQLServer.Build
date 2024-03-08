CREATE TABLE [dbo].[FactSurveyResponse](
	[SurveyResponseKey] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[ProductCategoryKey] [int] NOT NULL,
	[EnglishProductCategoryName] [nvarchar](50) NOT NULL,
	[ProductSubcategoryKey] [int] NOT NULL,
	[EnglishProductSubcategoryName] [nvarchar](50) NOT NULL,
	[Date] [datetime] NULL
) ON [PRIMARY];
GO
ALTER TABLE [dbo].[FactSurveyResponse]  ADD 
    CONSTRAINT [FK_FactSurveyResponse_DateKey] FOREIGN KEY([DateKey])
			REFERENCES [dbo].[DimDate] ([DateKey]),
	CONSTRAINT [FK_FactSurveyResponse_CustomerKey] FOREIGN KEY([CustomerKey])
			REFERENCES [dbo].[DimCustomer] ([CustomerKey]);
GO
ALTER TABLE [dbo].[FactSurveyResponse] WITH CHECK ADD 
    CONSTRAINT [PK_FactSurveyResponse_SurveyResponseKey] PRIMARY KEY CLUSTERED 
    (
        [SurveyResponseKey]
    )  ON [PRIMARY];