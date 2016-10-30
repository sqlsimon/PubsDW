CREATE TABLE [dbo].[DimPublishers](
	[PublisherKey] [int] NOT NULL PRIMARY KEY Identity,
	[PublisherId] [nchar](4) NOT NULL,
	[PublisherName] [nvarchar](50) NOT NULL
)