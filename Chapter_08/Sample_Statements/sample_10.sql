USE EntertainmentAgencyExample

SELECT DISTINCT EntStageName
FROM Entertainers
INNER JOIN Engagements
ON Engagements.EntertainerID = Entertainers.EntertainerID
INNER JOIN Customers
ON Engagements.CustomerID = Customers.CustomerID
WHERE Customers.CustLastName = 'Berg'

INTERSECT

SELECT DISTINCT EntStageName
FROM Entertainers
INNER JOIN Engagements
ON Engagements.EntertainerID = Entertainers.EntertainerID
INNER JOIN Customers
ON Engagements.CustomerID = Customers.CustomerID
WHERE Customers.CustLastName = 'Hallmark'