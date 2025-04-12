USE SalesOrdersExample

SELECT DISTINCT Products.ProductNumber, Products.ProductName, (SELECT AVG(RetailPrice) FROM Products) AS AvgRetailPrice
FROM Products
INNER JOIN Order_Details ON Order_Details.ProductNumber = Products.ProductNumber
WHERE Order_Details.QuotedPrice >= (SELECT AVG(RetailPrice) FROM Products) --the where is executed first which is why you can't back call the AvgRetailPrice