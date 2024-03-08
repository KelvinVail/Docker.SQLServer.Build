CREATE TABLE [dbo].[DimScenario](
	[ScenarioKey] [int] IDENTITY(1,1) NOT NULL,
	[ScenarioName] [nvarchar](50) NULL
) ON [PRIMARY];
GO
ALTER TABLE [dbo].[DimScenario] WITH CHECK ADD 
    CONSTRAINT [PK_DimScenario] PRIMARY KEY CLUSTERED 
    (
        [ScenarioKey]
    )  ON [PRIMARY];