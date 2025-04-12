USE SalesOrdersExample

SELECT Customers.CustFirstName, Customers.CustLastName
FROM Customers
WHERE Customers.CustomerID IN

(SELECT Orders.CustomerID
FROM Orders
INNER JOIN Order_Details ON Order_Details.OrderNumber = Orders.OrderNumber
INNER JOIN Products ON Products.ProductNumber = Order_Details.ProductNumber
INNER JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE Categories.CategoryDescription IN ('Clothing', 'Accessories'))