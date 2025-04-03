-- How many days elapsed between the order date and the ship date for each order?
USE SalesOrdersExample
SELECT OrderNumber, OrderDate, ShipDate, DATEDIFF(day, OrderDate, ShipDate) AS DaysElapsed
FROM Orders

-- You can't cast the date as an int like in the book for MSSQL - need DATEDIFF