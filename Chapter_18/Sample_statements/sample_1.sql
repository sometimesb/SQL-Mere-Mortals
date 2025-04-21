-- find all customers who ordered a bicycle and also ordered a helmet using exists
SELECT Customers.CustomerID, Customers.CustFirstName, Customers.CustLastName
FROM Customers
WHERE Exists
(
SELECT *
FROM Orders
INNER JOIN Order_Details ON Order_Details.OrderNumber = Orders.OrderNumber
INNER JOIN Products ON Products.ProductNumber = Order_Details.ProductNumber
WHERE Products.CategoryID = 2
AND Customers.CustomerID = Orders.CustomerID)
AND EXISTS
(
SELECT *
FROM Orders
INNER JOIN Order_Details ON Order_Details.OrderNumber = Orders.OrderNumber
INNER JOIN Products ON Products.ProductNumber = Order_Details.ProductNumber
WHERE Products.ProductName LIKE '%Helmet'
AND Customers.CustomerID = Orders.CustomerID)