USE SalesOrdersExample

SELECT Orders.OrderNumber, Orders.OrderDate, Order_Details.ProductNumber, Products.ProductName, Order_Details.QuotedPrice AS Price, Order_Details.QuantityOrdered AS Qty, Order_Details.QuotedPrice * Order_Details.QuantityOrdered AS AmountOWED
FROM Orders
INNER JOIN Order_Details
ON Order_Details.OrderNumber = Orders.OrderNumber
INNER JOIN Products
ON Products.ProductNumber = Order_Details.ProductNumber
