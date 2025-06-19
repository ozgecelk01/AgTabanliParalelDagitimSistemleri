SELECT
    SUM(CASE WHEN FirstName = 'Unknown' THEN 1 ELSE 0 END) AS UnknownFirstNames,
    SUM(CASE WHEN LastName = 'Unknown' THEN 1 ELSE 0 END) AS UnknownLastNames
FROM Person.Person;
