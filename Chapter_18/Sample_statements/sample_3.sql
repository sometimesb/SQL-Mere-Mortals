--list the entertainers who played engagements for customers berg and hallmark with exists
SELECT Entertainers.EntertainerID, Entertainers.EntStageName
FROM Entertainers
WHERE EXISTS
(
SELECT *
FROM Engagements
INNER JOIN Customers ON Customers.CustomerID = Engagements.CustomerID
WHERE Customers.CustLastName = 'Berg'
AND Engagements.EntertainerID = Entertainers.EntertainerID
)
AND EXISTS
(
SELECT *
FROM Engagements
INNER JOIN Customers ON Customers.CustomerID = Engagements.CustomerID
WHERE Customers.CustLastName = 'Hallmark'
AND Engagements.EntertainerID = Entertainers.EntertainerID
)

--BASIC ANSWER
SELECT Engagements.EntertainerID
FROM Engagements
INNER JOIN Entertainers ON Entertainers.EntertainerID = Engagements.EntertainerID
INNER JOIN Customers ON Customers.CustomerID = Engagements.CustomerID
WHERE Customers.CustLastName = 'Hallmark'

INTERSECT

SELECT Engagements.EntertainerID
FROM Engagements
INNER JOIN Entertainers ON Entertainers.EntertainerID = Engagements.EntertainerID
INNER JOIN Customers ON Customers.CustomerID = Engagements.CustomerID
WHERE Customers.CustLastName = 'Berg'