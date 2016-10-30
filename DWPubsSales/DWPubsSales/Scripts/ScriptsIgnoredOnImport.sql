
USE [master]
GO

IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'DWPubsSales')
  BEGIN
     -- Close connections to the DWPubsSales database 
    ALTER DATABASE [DWPubsSales] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
    DROP DATABASE [DWPubsSales]
  END
GO

CREATE DATABASE [DWPubsSales] ON  PRIMARY 
( NAME = N'DWPubsSales'
, FILENAME = N'C:\_BISolutions\PubsSales.mdf' )
 LOG ON 
( NAME = N'DWPubsSales_log'
, FILENAME = N'C:\_BISolutions\DWPubsSales_log.LDF' )
GO

USE [DWPubsSales]
GO

-- All done! -- 
Select [Message] = 'The DWPubsSales data warehouse is now created'
GO



-- Since the date table has no associated source table we can fill the data
-- using a SQL script or wait until the ETL process. Either way, here is the 
-- code to use.

-- Create variables to hold the start and end date
DECLARE @StartDate datetime = '01/01/1990'
DECLARE @EndDate datetime = '01/01/1995' 

-- Use a while loop to add dates to the table
DECLARE @DateInProcess datetime
SET @DateInProcess = @StartDate

WHILE @DateInProcess <= @EndDate
 BEGIN
 -- Add a row into the date dimension table for this date
 INSERT INTO DimDates 
 ( [Date], [DateName], [Month], [MonthName], [Quarter], [QuarterName], [Year], [YearName] )
 VALUES ( 
  @DateInProcess -- [Date]
  , DateName( weekday, @DateInProcess )  -- [DateName]  
  , Month( @DateInProcess ) -- [Month]   
  , DateName( month, @DateInProcess ) -- [MonthName]
  , DateName( quarter, @DateInProcess ) -- [Quarter]
  , 'Q' + DateName( quarter, @DateInProcess ) + ' - ' + Cast( Year(@DateInProcess) as nVarchar(50) ) -- [QuarterName] 
  , Year( @DateInProcess )
  , Cast( Year(@DateInProcess ) as nVarchar(50) ) -- [Year] 
  )  
 -- Add a day and loop again
 SET @DateInProcess = DateAdd(d, 1, @DateInProcess)
 END

-- Check the table SELECT Top 10 * FROM DimDates

/****** Create the Fact Tables ******/

CREATE TABLE [dbo].[FactTitlesAuthors](
	[TitleKey] [int] NOT NULL,
	[AuthorKey] [int] NOT NULL,
	[AuthorOrder] [int] NOT NULL,
 CONSTRAINT [PK_FactTitlesAuthors] PRIMARY KEY CLUSTERED 
	( [TitleKey] ASC, [AuthorKey] ASC )
)


GO
