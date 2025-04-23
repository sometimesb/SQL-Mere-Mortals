SELECT Engagements.StartDate, Entertainers.EntStageName, Customers.CustFirstName + ' ' + Customers.CustLastName AS CustomerName,
	ROW_NUMBER() OVER(
	ORDER BY Engagements.EngagementNumber) As Number,

	ROW_NUMBER() OVER(
	PARTITION BY Engagements.StartDate
	ORDER BY Engagements.StartDate) As NumberByDate
FROM Engagements
INNER JOIN Entertainers ON entertainers.EntertainerID = Engagements.EntertainerID
INNER JOIN Customers ON Customers.CustomerID = Engagements.CustomerID
