CREATE TABLE [dbo].[DimProductCategory](
	[ProductCategoryKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategoryAlternateKey] [int] NULL,
	[EnglishProductCategoryName] [nvarchar](50) NOT NULL,
	[SpanishProductCategoryName] [nvarchar](50) NOT NULL,
	[FrenchProductCategoryName] [nvarchar](50) NOT NULL
) ON [PRIMARY];
GO
ALTER TABLE [dbo].[DimProductCategory] WITH CHECK ADD 
    CONSTRAINT [PK_DimProductCategory_ProductCategoryKey] PRIMARY KEY CLUSTERED 
    (
        [ProductCategoryKey]
    )  ON [PRIMARY];
GO
/****** Object:  Index [AK_DimProductCategory_ProductCategoryAlternateKey]    Script Date: 7/8/2016 2:40:13 PM ******/
ALTER TABLE [dbo].[DimProductCategory] ADD  CONSTRAINT [AK_DimProductCategory_ProductCategoryAlternateKey] UNIQUE NONCLUSTERED 
(
	[ProductCategoryAlternateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)