UPDATE Person.Person
SET FirstName = 'Unknown'
WHERE FirstName IS NULL OR FirstName = '';

UPDATE Person.Person
SET LastName = 'Unknown'
WHERE LastName IS NULL OR LastName = '';
