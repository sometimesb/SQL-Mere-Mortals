SELECT Categories.CategoryDescription, Vendors.VendState, SUM(Products.QuantityOnHand) As QuantityOnHand
FROM Products
INNER JOIN Categories ON Categories.CategoryID = Products.CategoryID
INNER JOIN Product_Vendors ON Product_Vendors.ProductNumber = Products.ProductNumber
INNER JOIN Vendors ON Vendors.VendorID = Product_Vendors.VendorID
GROUP BY CUBE(Categories.CategoryDescription, Vendors.VendState)