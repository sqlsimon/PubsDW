Alter Table [dbo].[FactTitlesAuthors] With Check Add Constraint [FK_FactTitlesAuthors_DimAuthors] 
Foreign Key  ([AuthorKey]) References [dbo].[DimAuthors] ([AuthorKey])