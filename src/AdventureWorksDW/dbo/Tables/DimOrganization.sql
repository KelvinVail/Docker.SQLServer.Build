CREATE TABLE [dbo].[DimOrganization](
	[OrganizationKey] [int] IDENTITY(1,1) NOT NULL,
	[ParentOrganizationKey] [int] NULL,
	[PercentageOfOwnership] [nvarchar](16) NULL,
	[OrganizationName] [nvarchar](50) NULL,
	[CurrencyKey] [int] NULL
) ON [PRIMARY];
GO
ALTER TABLE [dbo].[DimOrganization] ADD 
    CONSTRAINT [FK_DimOrganization_DimCurrency] FOREIGN KEY 
    (
        [CurrencyKey]
    ) REFERENCES [dbo].[DimCurrency] ([CurrencyKey]),
    CONSTRAINT [FK_DimOrganization_DimOrganization] FOREIGN KEY 
    (
        [ParentOrganizationKey]
    )REFERENCES [dbo].[DimOrganization] ([OrganizationKey]);
GO
ALTER TABLE [dbo].[DimOrganization] WITH CHECK ADD 
    CONSTRAINT [PK_DimOrganization] PRIMARY KEY CLUSTERED 
    (
       [OrganizationKey]
    )  ON [PRIMARY];