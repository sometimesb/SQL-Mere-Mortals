USE EntertainmentAgencyExample

SELECT Customers.CustFirstName, Customers.CustLastName, (SELECT MAX(StartDate) FROM Engagements Where Engagements.CustomerID = Customers.CustomerID) AS LastBooking
FROM Customers