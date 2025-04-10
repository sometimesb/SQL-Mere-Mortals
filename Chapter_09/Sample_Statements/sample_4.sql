USE [EntertainmentAgencyExample]

--filter first, then back join

SELECT *
FROM Musical_Styles AS MusicalStyles 
LEFT JOIN (
    SELECT Customers.CustomerID, Customers.CustFirstName + ' ' + Customers.CustLastName AS Name, Musical_Preferences.StyleID
    FROM Customers
    INNER JOIN Musical_Preferences ON Musical_Preferences.CustomerID = Customers.CustomerID
) AS CustomerPreferences 
ON MusicalStyles.StyleID = CustomerPreferences.StyleID;

-- you need to alias the subquery so you can access the columns b/c you can't just get the styleiD