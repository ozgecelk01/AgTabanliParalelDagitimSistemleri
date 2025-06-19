UPDATE Person.Person
SET FirstName = UPPER(LEFT(FirstName, 1)) + LOWER(SUBSTRING(FirstName, 2, LEN(FirstName) - 1));

UPDATE Person.Person
SET LastName = UPPER(LEFT(LastName, 1)) + LOWER(SUBSTRING(LastName, 2, LEN(LastName) - 1));
