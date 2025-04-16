USE SalesOrdersExample

SELECT Customers.CustFirstName + ' ' + Customers.CustLastName AS CustFullName, Orders.OrderDate,
    SUM(Order_Details.QuotedPrice * Order_Details.QuantityOrdered) AS TotalQuotedPrice
FROM Customers
INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID
INNER JOIN Order_Details ON Order_Details.OrderNumber = Orders.OrderNumber
GROUP BY Customers.CustFirstName, Customers.CustLastName, Orders.OrderDate
ORDER BY Customers.CustFirstName, Orders.OrderDate
