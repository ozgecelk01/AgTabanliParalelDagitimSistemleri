IF OBJECT_ID('Person.Person_Cleaned', 'U') IS NOT NULL
    DROP TABLE Person.Person_Cleaned;

CREATE TABLE Person.Person_Cleaned (
    BusinessEntityID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    EmailPromotion INT
);
