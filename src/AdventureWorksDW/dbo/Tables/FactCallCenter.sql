CREATE TABLE [dbo].[FactCallCenter](
	[FactCallCenterID] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NOT NULL,
	[WageType] [nvarchar](15) NOT NULL,
	[Shift] [nvarchar](20) NOT NULL,
	[LevelOneOperators] [smallint] NOT NULL,
	[LevelTwoOperators] [smallint] NOT NULL,
	[TotalOperators] [smallint] NOT NULL,
	[Calls] [int] NOT NULL,
	[AutomaticResponses] [int] NOT NULL,
	[Orders] [int] NOT NULL,
	[IssuesRaised] [smallint] NOT NULL,
	[AverageTimePerIssue] [smallint] NOT NULL,
	[ServiceGrade] [float] NOT NULL,
	[Date] [datetime] NULL
) ON [PRIMARY];
GO
ALTER TABLE [dbo].[FactCallCenter] ADD 
    CONSTRAINT [FK_FactCallCenter_DimDate] FOREIGN KEY 
    (
        [DateKey]
    ) REFERENCES [dbo].[DimDate] ([DateKey]);
GO
ALTER TABLE [dbo].[FactCallCenter] WITH CHECK ADD 
    CONSTRAINT [PK_FactCallCenter_FactCallCenterID] PRIMARY KEY CLUSTERED 
    (
        [FactCallCenterID]
    )  ON [PRIMARY];
GO
/****** Object:  Index [AK_FactCallCenter_DateKey_Shift]    Script Date: 7/8/2016 2:43:49 PM ******/
ALTER TABLE [dbo].[FactCallCenter] ADD  CONSTRAINT [AK_FactCallCenter_DateKey_Shift] UNIQUE NONCLUSTERED 
(
	[DateKey] ASC,
	[Shift] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)