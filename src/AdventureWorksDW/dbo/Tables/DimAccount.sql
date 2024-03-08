CREATE TABLE [dbo].[DimAccount](
	[AccountKey] [int] IDENTITY(1,1) NOT NULL,
	[ParentAccountKey] [int] NULL,
	[AccountCodeAlternateKey] [int] NULL,
	[ParentAccountCodeAlternateKey] [int] NULL,
	[AccountDescription] [nvarchar](50) NULL,
	[AccountType] [nvarchar](50) NULL,
	[Operator] [nvarchar](50) NULL,
	[CustomMembers] [nvarchar](300) NULL,
	[ValueType] [nvarchar](50) NULL,
	[CustomMemberOptions] [nvarchar](200) NULL 
) ON [PRIMARY];
GO
ALTER TABLE [dbo].[DimAccount] ADD 
    CONSTRAINT [FK_DimAccount_DimAccount] FOREIGN KEY 
    (
        [ParentAccountKey]
    ) REFERENCES [dbo].[DimAccount] ([AccountKey]);
GO
ALTER TABLE [dbo].[DimAccount] WITH CHECK ADD 
    CONSTRAINT [PK_DimAccount] PRIMARY KEY CLUSTERED
	(
	[AccountKey]
	) ON [PRIMARY];