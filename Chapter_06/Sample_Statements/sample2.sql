USE SalesOrdersExample

SELECT ProductName
FROM Products
WHERE ProductName LIKE 'Dog%'
ORDER BY ProductName