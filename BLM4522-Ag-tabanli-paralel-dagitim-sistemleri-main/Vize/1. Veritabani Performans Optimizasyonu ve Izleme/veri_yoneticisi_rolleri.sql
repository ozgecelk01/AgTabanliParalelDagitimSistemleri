USE AdventureWorks2022;
CREATE LOGIN report_user_login WITH PASSWORD = 'Report123!';
CREATE LOGIN editor_user_login WITH PASSWORD = 'Edit123!';
CREATE LOGIN admin_user_login  WITH PASSWORD = 'Admin123!';

CREATE USER report_user FOR LOGIN report_user_login;
CREATE USER editor_user FOR LOGIN editor_user_login;
CREATE USER admin_user  FOR LOGIN admin_user_login;

CREATE ROLE report_role;
CREATE ROLE editor_role;
CREATE ROLE admin_role;

GRANT SELECT ON SCHEMA::Sales TO report_role;
GRANT SELECT, UPDATE ON SCHEMA::Sales TO editor_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::Sales TO admin_role;

EXEC sp_addrolemember 'report_role', 'report_user';
EXEC sp_addrolemember 'editor_role', 'editor_user';
EXEC sp_addrolemember 'admin_role', 'admin_user';

-- Report
SELECT TOP 10 * FROM Sales.SalesOrderHeader;

UPDATE Sales.SalesOrderHeader SET Comment = 'Test' WHERE SalesOrderID = 43659;

-- Editor
SELECT * FROM Sales.SalesOrderHeader;

SELECT SalesOrderID, Comment FROM Sales.SalesOrderHeader WHERE SalesOrderID = 43659;
UPDATE Sales.SalesOrderHeader SET Comment = 'Updated' WHERE SalesOrderID = 43659;
SELECT SalesOrderID, Comment FROM Sales.SalesOrderHeader WHERE SalesOrderID = 43659;

DELETE FROM Sales.SalesOrderHeader WHERE SalesOrderID = 43659; -- İzin yok.

--Admin
SELECT SalesOrderID, Comment FROM Sales.SalesOrderHeader WHERE SalesOrderID = 43660;
UPDATE Sales.SalesOrderHeader SET Comment = 'Admin OK' WHERE SalesOrderID = 43660;
SELECT SalesOrderID, Comment FROM Sales.SalesOrderHeader WHERE SalesOrderID = 43660;


SELECT * FROM Sales.SalesOrderHeader WHERE RevisionNumber = 1;
INSERT INTO [AdventureWorks2022].[Sales].[SalesOrderHeader] (RevisionNumber, OrderDate, DueDate, ShipDate, Status, OnlineOrderFlag,
    PurchaseOrderNumber, AccountNumber, CustomerID, SalesPersonID, TerritoryID, BillToAddressID, ShipToAddressID,
    ShipMethodID, CreditCardID, CreditCardApprovalCode, CurrencyRateID, SubTotal, TaxAmt, Freight, Comment, rowguid,
    ModifiedDate
)
VALUES (
    1, GETDATE(), DATEADD(DAY, 5, GETDATE()), DATEADD(DAY, 7, GETDATE()), 5, 1, N'PO99999', N'AC1234567', 11000, 279, 3,
    1, 1, 4, 10, N'APPROVED123', 1, 100.00, 10.00, 5.00, N'Test Order Inserted', NEWID(), GETDATE()
);