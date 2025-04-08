USE EntertainmentAgencyExample

SELECT DISTINCT Entertainers.EntStageName
FROM Entertainers
INNER JOIN Engagements
ON Entertainers.EntertainerID = Engagements.EntertainerID
INNER JOIN Customers
ON Engagements.CustomerID = Customers.CustomerID
WHERE Customers.CustLastName = 'Berg' OR Customers.CustLastName = 'Hallmark'