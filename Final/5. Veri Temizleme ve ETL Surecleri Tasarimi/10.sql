SELECT EmailPromotion, COUNT(*) AS Count
FROM Person.Person
GROUP BY EmailPromotion
ORDER BY EmailPromotion;
