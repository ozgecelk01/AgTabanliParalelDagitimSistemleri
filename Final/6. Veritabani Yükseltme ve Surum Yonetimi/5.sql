CREATE TRIGGER trg_DDL_Change_Log
ON DATABASE
FOR DDL_DATABASE_LEVEL_EVENTS
AS
BEGIN
    INSERT INTO dbo.SchemaChangeLog(EventType, EventDDL, EventTime, ChangedBy)
    SELECT EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'NVARCHAR(100)'),
           EVENTDATA().value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]', 'NVARCHAR(MAX)'),
           GETDATE(),
           SYSTEM_USER;
END;
