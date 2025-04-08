-- Find all customers who ordered a bike, helmet, and then both

USE SalesOrdersExample

SELECT DISTINCT Customers.CustFirstName, Customers.CustLastName
FROM Orders
INNER JOIN Order_Details 
ON Order_Details.OrderNumber = Orders.OrderNumber
INNER JOIN Products
ON Products.ProductNumber = Order_Details.ProductNumber
INNER JOIN Customers
ON Orders.CustomerID = CUstomers.CustomerID
WHERE ProductName LIKE '%Bike'

INTERSECT

SELECT DISTINCT Customers.CustFirstName, Customers.CustLastName
FROM Orders
INNER JOIN Order_Details 
ON Order_Details.OrderNumber = Orders.OrderNumber
INNER JOIN Products
ON Products.ProductNumber = Order_Details.ProductNumber
INNER JOIN Customers
ON Orders.CustomerID = CUstomers.CustomerID
WHERE ProductName LIKE '%Helmet'