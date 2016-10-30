/****** Create the Dimension Tables ******/

CREATE TABLE [dbo].[DimStores](
	[StoreKey] [int] NOT NULL PRIMARY KEY Identity,
	[StoreId] [nchar](4) NOT NULL,
	[StoreName] [nvarchar](50) NOT NULL,
	--[StoreState] [nChar](2) NOT NULL -- Removed for later demo
)