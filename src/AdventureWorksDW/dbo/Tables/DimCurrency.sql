CREATE TABLE [dbo].[DimCurrency](
	[CurrencyKey] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyAlternateKey] [nchar](3) NOT NULL,
	[CurrencyName] [nvarchar](50) NOT NULL
) ON [PRIMARY];
GO
ALTER TABLE [dbo].[DimCurrency] WITH CHECK ADD 
    CONSTRAINT [PK_DimCurrency_CurrencyKey] PRIMARY KEY CLUSTERED 
    (
       [CurrencyKey]
    )  ON [PRIMARY];
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_DimCurrency_CurrencyAlternateKey] ON [dbo].[DimCurrency]([CurrencyAlternateKey]) ON [PRIMARY];