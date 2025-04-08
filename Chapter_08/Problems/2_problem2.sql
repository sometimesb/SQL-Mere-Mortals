USE EntertainmentAgencyExample

SELECT DISTINCT (Customers.CustFirstName + ' ' + Customers.CustLastName) AS CustFullName, Entertainers.EntStageName
FROM Customers
INNER JOIN Engagements
ON Engagements.CustomerID = Customers.CustomerID
INNER JOIN Entertainers
ON Entertainers.EntertainerID = Engagements.EntertainerID