USE SalesOrdersExample

Select Products.ProductName
FROM Products -- left
LEFT JOIN Order_Details
ON Order_Details.ProductNumber = Products.ProductNumber
WHERE Order_Details.ProductNumber is NULL