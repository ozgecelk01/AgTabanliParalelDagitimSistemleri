CREATE TABLE dbo.SchemaChangeLog (
    ID INT IDENTITY PRIMARY KEY,
    EventType NVARCHAR(100),
    EventDDL NVARCHAR(MAX),
    EventTime DATETIME,
    ChangedBy NVARCHAR(100)
);
