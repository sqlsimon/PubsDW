-- We should create a date dimension table in the database
CREATE TABLE dbo.DimDates (
  [DateKey] int NOT NULL PRIMARY KEY IDENTITY
, [Date] datetime NOT NULL
, [DateName] nVarchar(50)
, [Month] int NOT NULL
, [MonthName] nVarchar(50) NOT NULL
, [Quarter] int NOT NULL
, [QuarterName] nVarchar(50) NOT NULL
, [Year] int NOT NULL
, [YearName] nVarchar(50) NOT NULL
)
