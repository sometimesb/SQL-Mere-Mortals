Use SalesOrdersExample

SELECT Customers.CustFirstName, Customers.CustLastName, 'Bike' AS ProdType
FROM Customers
INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID
INNER JOIN Order_Details ON Orders.OrderNumber = Order_Details.OrderNumber
INNER JOIN Products ON Products.ProductNumber = Order_Details.ProductNumber
WHERE Products.ProductName LIKE '%bike%'

UNION

SELECT Customers.CustFirstName, Customers.CustLastName, 'Helmet' as ProdType
FROM Customers
INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID
INNER JOIN Order_Details ON Orders.OrderNumber = Order_Details.OrderNumber
INNER JOIN Products ON Products.ProductNumber = Order_Details.ProductNumber
WHERE Products.ProductName LIKE '%helmet%'