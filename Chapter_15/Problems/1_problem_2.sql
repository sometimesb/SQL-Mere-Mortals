USE SalesOrdersModify

SELECT Products.ProductNumber, Products.RetailPrice, MAX(Product_Vendors.WholesalePrice) As MaximumholeSalePriceAcrossVendors, MAX(Product_Vendors.WholesalePrice) * 1.35 AS ReMappedRetailPrice
FROM Products
INNER JOIN Product_Vendors ON Product_Vendors.PRoductNumber = Products.ProductNumber
WHERE Products.CategoryID = 1
GROUP BY Products.ProductNumber, Products.RetailPrice
HAVING Products.RetailPrice < MAX(Product_Vendors.WholesalePrice) * 1.35
