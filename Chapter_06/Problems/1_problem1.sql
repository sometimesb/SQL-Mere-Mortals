USE SalesOrdersExample

SELECT VendName, VendCity
FROM Vendors
WHERE VendCity IN ('Ballard','Bellevue', 'Redmond')