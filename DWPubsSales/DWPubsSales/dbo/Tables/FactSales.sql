CREATE TABLE [dbo].[FactSales](
	[OrderNumber] [nvarchar](50) NOT NULL,
	[OrderDateKey] [int] NOT NULL,
	[TitleKey] [int] NOT NULL,
	[StoreKey] [int] NOT NULL,
	[SalesQuantity] [int] NOT NULL,
 CONSTRAINT [PK_FactSales] PRIMARY KEY CLUSTERED 
	( [OrderNumber] ASC,[OrderDateKey] ASC, [TitleKey] ASC, [StoreKey] ASC )
)
GO
Alter Table [dbo].[FactSales] With Check Add Constraint [FK_FactSales_DimStores] 
Foreign Key ([StoreKey]) References [dbo].[DimStores] ([Storekey])
GO
Alter Table [dbo].[FactSales] With Check Add Constraint [FK_FactSales_DimTitles] 
Foreign Key ([TitleKey]) References [dbo].[DimTitles] ([TitleKey])
GO
Alter Table [dbo].[FactSales]  With Check Add Constraint [FK_FactSales_DimDates] 
Foreign Key ([OrderDateKey]) References [dbo].[DimDates]	(	[DateKey]	)