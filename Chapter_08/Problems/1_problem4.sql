USE SalesOrdersExample

-- SELECT Vendors.VendName, Products.ProductName, Product_Vendors.WholesalePrice

SELECT Vendors.VendName, Products.ProductName, Product_Vendors.WholesalePrice
FROM Vendors

INNER JOIN Product_Vendors
ON Product_Vendors.VendorID = Vendors.VendorID
INNER JOIN Products
ON Product_Vendors.ProductNumber = Products.ProductNumber

WHERE Product_Vendors.WholesalePrice < 100