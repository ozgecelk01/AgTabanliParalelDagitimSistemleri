SELECT BusinessEntityID, EmailPromotion
FROM Person.Person
WHERE EmailPromotion NOT IN (0, 1, 2);
