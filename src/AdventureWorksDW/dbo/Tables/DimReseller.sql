CREATE TABLE [dbo].[DimReseller](
	[ResellerKey] [int] IDENTITY(1,1) NOT NULL,
	[GeographyKey] [int] NULL,
	[ResellerAlternateKey] [nvarchar](15) NULL,
	[Phone] [nvarchar](25) NULL,
	[BusinessType] [varchar](20) NOT NULL,
	[ResellerName] [nvarchar](50) NOT NULL,
	[NumberEmployees] [int] NULL,
	[OrderFrequency] [char](1) NULL,
	[OrderMonth] [tinyint] NULL,
	[FirstOrderYear] [int] NULL,
	[LastOrderYear] [int] NULL,
	[ProductLine] [nvarchar](50) NULL,
	[AddressLine1] [nvarchar](60) NULL,
	[AddressLine2] [nvarchar](60) NULL,
	[AnnualSales] [money] NULL,
	[BankName] [nvarchar](50) NULL,
	[MinPaymentType] [tinyint] NULL,
	[MinPaymentAmount] [money] NULL,
	[AnnualRevenue] [money] NULL,
	[YearOpened] [int] NULL
) ON [PRIMARY];
GO
ALTER TABLE [dbo].[DimReseller] ADD
	CONSTRAINT [FK_DimReseller_DimGeography] FOREIGN KEY
	(
		[GeographyKey]
	) REFERENCES [dbo].[DimGeography] ([GeographyKey]);
GO
ALTER TABLE [dbo].[DimReseller] WITH CHECK ADD 
    CONSTRAINT [PK_DimReseller_ResellerKey] PRIMARY KEY CLUSTERED 
    (
        [ResellerKey]
    )  ON [PRIMARY];
GO
/****** Object:  Index [AK_DimReseller_ResellerAlternateKey]    Script Date: 7/8/2016 2:42:07 PM ******/
ALTER TABLE [dbo].[DimReseller] ADD  CONSTRAINT [AK_DimReseller_ResellerAlternateKey] UNIQUE NONCLUSTERED 
(
	[ResellerAlternateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)