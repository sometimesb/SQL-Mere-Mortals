USE [EntertainmentAgencyExample]

SELECT Distinct Engagements.EntertainerID, (SELECT Entertainers.EntStageName FROM Entertainers WHERE Entertainers.EntertainerID = Engagements.EntertainerID)
FROM Engagements 
WHERE Engagements.CustomerID IN
(SELECT Customers.CustomerID 
FROM Customers
WHERE Customers.CustLastName = 'Berg')
