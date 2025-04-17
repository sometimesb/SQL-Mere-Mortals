USE SalesOrdersModify

BEGIN TRANSACTION

SELECT Orders.OrderNumber, Orders.OrderDate, Orders.ShipDate, Order_Details.QuotedPrice, CAST(Order_Details.QuotedPrice AS INT) * 0.98 AS UpdatedPrice
FROM Orders
INNER JOIN Order_Details ON Order_Details.OrderNumber = Orders.OrderNumber
WHERE DATEDIFF(day,Orders.OrderDate,Orders.ShipDate) > 30

-- UPDATE Order_Details
-- SET Order_Details.QuotedPrice = Order_Details.QuotedPrice * 0.98

-- FROM Order_Details
-- JOIN Orders ON Order_Details.OrderNumber = Orders.OrderNumber
-- WHERE DATEDIFF(day,Orders.OrderDate,Orders.ShipDate) > 30

COMMIT