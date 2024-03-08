CREATE TABLE [dbo].[DimProductSubcategory](
	[ProductSubcategoryKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductSubcategoryAlternateKey] [int] NULL,
	[EnglishProductSubcategoryName] [nvarchar](50) NOT NULL,
	[SpanishProductSubcategoryName] [nvarchar](50) NOT NULL,
	[FrenchProductSubcategoryName] [nvarchar](50) NOT NULL,
	[ProductCategoryKey] [int] NULL
) ON [PRIMARY];
GO
ALTER TABLE [dbo].[DimProductSubcategory] ADD 
    CONSTRAINT [FK_DimProductSubcategory_DimProductCategory] FOREIGN KEY 
    (
        [ProductCategoryKey]
    ) REFERENCES [dbo].[DimProductCategory] ([ProductCategoryKey]);
GO
ALTER TABLE [dbo].[DimProductSubcategory] WITH CHECK ADD 
    CONSTRAINT [PK_DimProductSubcategory_ProductSubcategoryKey] PRIMARY KEY CLUSTERED 
    (
        [ProductSubcategoryKey]
    )  ON [PRIMARY];
GO
/****** Object:  Index [AK_DimProductSubcategory_ProductSubcategoryAlternateKey]    Script Date: 7/8/2016 2:40:37 PM ******/
ALTER TABLE [dbo].[DimProductSubcategory] ADD  CONSTRAINT [AK_DimProductSubcategory_ProductSubcategoryAlternateKey] UNIQUE NONCLUSTERED 
(
	[ProductSubcategoryAlternateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)