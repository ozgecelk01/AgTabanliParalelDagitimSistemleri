SELECT BusinessEntityID, FirstName, LastName
FROM Person.Person
WHERE FirstName IS NULL OR FirstName = ''
   OR LastName IS NULL OR LastName = '';
