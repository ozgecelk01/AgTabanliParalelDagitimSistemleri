SELECT * 
FROM Sales.SalesOrderDetail
WHERE ProductID IN (
    SELECT ProductID 
    FROM Production.Product
    WHERE Name LIKE '%Road%'
);

SELECT sod.*
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p ON sod.ProductID = p.ProductID
WHERE p.Name LIKE '%Road%';


SELECT sod.SalesOrderID, sod.SalesOrderDetailID, sod.CarrierTrackingNumber
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p ON sod.ProductID = p.ProductID
WHERE p.Name LIKE '%Road%';