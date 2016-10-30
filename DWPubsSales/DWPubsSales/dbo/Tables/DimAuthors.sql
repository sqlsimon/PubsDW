CREATE TABLE [dbo].[DimAuthors](
	[AuthorKey] [int] NOT NULL PRIMARY KEY Identity,
	[AuthorId] [nchar](11) NOT NULL,
	[AuthorName] [nvarchar](100) NOT NULL,
	[AuthorState] [nchar](2) NOT NULL
)