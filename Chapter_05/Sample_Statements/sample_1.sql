-- What is the inventory of each product?
USE SalesOrdersExample
SELECT ProductName, (RetailPrice*QuantityOnHand) AS InventoryValue
FROM Products