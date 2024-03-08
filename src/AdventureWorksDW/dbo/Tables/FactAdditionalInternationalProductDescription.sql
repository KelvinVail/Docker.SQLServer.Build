CREATE TABLE [dbo].[FactAdditionalInternationalProductDescription](
	[ProductKey] [int] NOT NULL,
	[CultureName] [nvarchar](50) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL
) ON [PRIMARY];
GO
ALTER TABLE [dbo].[FactAdditionalInternationalProductDescription] WITH CHECK ADD 
    CONSTRAINT [PK_FactAdditionalInternationalProductDescription_ProductKey_CultureName] PRIMARY KEY CLUSTERED 
    (
       [ProductKey],[CultureName]
    )  ON [PRIMARY];