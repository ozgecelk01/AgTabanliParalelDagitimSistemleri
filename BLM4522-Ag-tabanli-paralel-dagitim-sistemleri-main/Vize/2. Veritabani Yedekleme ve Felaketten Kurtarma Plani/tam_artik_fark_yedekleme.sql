SELECT name, recovery_model_desc
FROM sys.databases
WHERE name = 'model';

USE [master]
ALTER DATABASE AdventureWorks2022 SET RECOVERY FULL;

BACKUP DATABASE AdventureWorks2022
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLEVAL2022\MSSQL\Backup\AW2022_FULL.bak'
WITH INIT, FORMAT, NAME = 'Full Backup';
GO

BACKUP DATABASE AdventureWorks2022
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLEVAL2022\MSSQL\Backup\AW2022_DIFF.bak'
WITH DIFFERENTIAL,
     INIT,
     NAME = 'Differential Backup';
GO

BACKUP LOG AdventureWorks2022
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLEVAL2022\MSSQL\Backup\AW2022_LOG.trn'
WITH INIT,
     NAME = 'Log Backup';
GO
