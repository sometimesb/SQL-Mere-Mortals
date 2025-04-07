USE SalesOrdersExample

SELECT Products.ProductNumber, Products.ProductName, Categories.CategoryDescription
FROM Products
INNER JOIN Categories ON Categories.CategoryID = Products.CategoryID