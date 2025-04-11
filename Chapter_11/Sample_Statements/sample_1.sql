USE SalesOrdersExample

SELECT Vendors.VendName, (SELECT COUNT(*) FROM Product_Vendors WHERE Product_Vendors.VendorID = Vendors.VendorID) AS ProductCountPerVendor
FROM Vendors