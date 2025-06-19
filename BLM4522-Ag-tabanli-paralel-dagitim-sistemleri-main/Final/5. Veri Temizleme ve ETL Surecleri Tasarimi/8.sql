INSERT INTO Person.Person_Cleaned (BusinessEntityID, FirstName, LastName, EmailPromotion)
SELECT BusinessEntityID, FirstName, LastName, EmailPromotion
FROM Person.Person;
