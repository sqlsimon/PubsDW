CREATE TABLE [dbo].[FactTitlesAuthors](
	[TitleKey] [int] NOT NULL,
	[AuthorKey] [int] NOT NULL,
	[AuthorOrder] [int] NOT NULL,
 CONSTRAINT [PK_FactTitlesAuthors] PRIMARY KEY CLUSTERED 
	( [TitleKey] ASC, [AuthorKey] ASC )
)

