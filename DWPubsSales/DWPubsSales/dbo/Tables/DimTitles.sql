CREATE TABLE [dbo].[DimTitles](
	[TitleKey] [int] NOT NULL PRIMARY KEY Identity,
	[TitleId] [nvarchar](6) NOT NULL,
	[TitleName] [nvarchar](100) NOT NULL,
	[TitleType] [nvarchar](50) NOT NULL,
	[PublisherKey] [int] NOT NULL,
	[TitlePrice] [decimal](18, 4) NOT NULL,
	[PublishedDateKey] [int] NOT NULL
)
GO
/****** Add Foreign Keys ******/
Alter Table [dbo].[DimTitles] With Check Add Constraint [FK_DimTitles_DimPublishers] 
Foreign Key   ([PublisherKey]) References [dbo].[DimPublishers] ([PublisherKey])
GO
Alter Table [dbo].[DimTitles]  With Check Add Constraint [FK_DimTitles_DimDates] 
Foreign Key ([PublishedDateKey]) References [dbo].[DimDates]	(	[DateKey]	)