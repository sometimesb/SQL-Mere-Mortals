USE SalesOrdersExample

SELECT Customers.CustFirstName + ' ' + Customers.CustLastName AS CustomerFullName, Orders.OrderDate
FROM Customers
INNER JOIN Orders
ON Orders.CustomerID = Customers.CustomerID
ORDER BY Orders.OrderDate