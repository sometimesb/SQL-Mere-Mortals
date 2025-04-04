USE SalesOrdersExample

SELECT ProductNumber, WholesalePrice, WholesalePrice - (WholesalePrice * 0.05) AS NewPrice
FROM Product_Vendors