CREATE TABLE [dbo].[DimDepartmentGroup](
	[DepartmentGroupKey] [int] IDENTITY(1,1) NOT NULL,
	[ParentDepartmentGroupKey] [int] NULL,
	[DepartmentGroupName] [nvarchar](50) NULL
) ON [PRIMARY];
GO
ALTER TABLE [dbo].[DimDepartmentGroup] ADD 
    CONSTRAINT [FK_DimDepartmentGroup_DimDepartmentGroup] FOREIGN KEY 
    (
        [ParentDepartmentGroupKey]
    ) REFERENCES [dbo].[DimDepartmentGroup] ([DepartmentGroupKey]);
GO
ALTER TABLE [dbo].[DimDepartmentGroup] WITH CHECK ADD 
    CONSTRAINT [PK_DimDepartmentGroup] PRIMARY KEY CLUSTERED 
    (
        [DepartmentGroupKey]
    )  ON [PRIMARY];