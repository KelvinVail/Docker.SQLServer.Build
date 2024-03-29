﻿CREATE TABLE [dbo].[FactFinance](
	[FinanceKey] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NOT NULL,
	[OrganizationKey] [int] NOT NULL,
	[DepartmentGroupKey] [int] NOT NULL,
	[ScenarioKey] [int] NOT NULL,
	[AccountKey] [int] NOT NULL,
	[Amount] [float] NOT NULL,
	[Date] [datetime] NULL
) ON [PRIMARY];
GO
ALTER TABLE [dbo].[FactFinance] ADD 
    CONSTRAINT [FK_FactFinance_DimScenario] FOREIGN KEY 
    (
        [ScenarioKey]
    ) REFERENCES [dbo].[DimScenario] ([ScenarioKey]),
    CONSTRAINT [FK_FactFinance_DimOrganization] FOREIGN KEY 
    (
        [OrganizationKey]
    ) REFERENCES [dbo].[DimOrganization] ([OrganizationKey]),
    CONSTRAINT [FK_FactFinance_DimDepartmentGroup] FOREIGN KEY 
    (
        [DepartmentGroupKey]
    ) REFERENCES [dbo].[DimDepartmentGroup] ([DepartmentGroupKey]),
	CONSTRAINT [FK_FactFinance_DimDate] FOREIGN KEY 
    (
        [DateKey]
    ) REFERENCES [dbo].[DimDate] ([DateKey]),
	CONSTRAINT [FK_FactFinance_DimAccount] FOREIGN KEY 
    (
        [AccountKey]
    ) REFERENCES [dbo].[DimAccount] ([AccountKey])	
	;