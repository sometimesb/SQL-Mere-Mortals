USE SalesOrdersModify

BEGIN TRANSACTION

--the select that finds the appropriate item to update
SELECT Products.ProductNumber, Products.ProductName,Products.RetailPrice, MIN(PRoduct_Vendors.WholesalePrice) * 1.45 AS UpdatedMinimumRetailPrice
FROM Products
INNER JOIN Product_Vendors ON Product_Vendors.ProductNumber = Products.ProductNumber
WHERE Products.CategoryID = 2 
GROUP BY Products.ProductNumber, Products.ProductName,Products.RetailPrice
HAVING Products.RetailPrice < 1.45 *MIN(PRoduct_Vendors.WholesalePrice)

--convert to updates
UPDATE Products
SET Products.RetailPrice = 1.45 * (SELECT MIN(WholesalePrice) FROM Product_Vendors WHERE Product_Vendors.ProductNumber = Products.ProductNumber
    )


FROM Products
INNER JOIN Product_Vendors ON Product_Vendors.ProductNumber = Products.ProductNumber
WHERE Products.CategoryID = 2 
    AND RetailPrice < 1.45 * (SELECT MIN(WholesalePrice) FROM Product_Vendors WHERE Product_Vendors.ProductNumber = Products.ProductNumber
    )

SELECT Products.ProductNumber, Products.ProductName,Products.RetailPrice
FROM Products
INNER JOIN Product_Vendors ON Product_Vendors.ProductNumber = Products.ProductNumber
WHERE Products.CategoryID = 2 
GROUP BY Products.ProductNumber, Products.ProductName,Products.RetailPrice

COMMIT