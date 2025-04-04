USE SalesOrdersExample
SELECT CustomerID, OrderDate, OrderNumber
FROM Orders
ORDER BY CustomerID, OrderDate DESC, OrderNumber;
