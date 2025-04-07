USE SalesOrdersExample

SELECT Products.ProductNumber, Products.ProductName, Products.ProductDescription, Products.CategoryID
FROM Products
INNER JOIN Categories ON Categories.CategoryID = Products.CategoryID