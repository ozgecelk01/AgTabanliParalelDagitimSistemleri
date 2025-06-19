UPDATE Person.Person
SET EmailPromotion = 0
WHERE EmailPromotion NOT IN (0, 1, 2);
