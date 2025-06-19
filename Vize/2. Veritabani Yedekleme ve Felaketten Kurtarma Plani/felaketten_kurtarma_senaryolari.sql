DROP TABLE Person.EmailAddress;
SELECT * FROM Person.EmailAddress;

RESTORE DATABASE AdventureWorks2022_Restore
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLEVAL2022\MSSQL\Backup\AW2022_FULL.bak'
WITH
    MOVE 'AdventureWorks2022' TO 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLEVAL2022\MSSQL\Backup\AW2022_Restore.mdf',
    MOVE 'AdventureWorks2022_log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLEVAL2022\MSSQL\Backup\AW2022_Restore_log.ldf',
    REPLACE;
