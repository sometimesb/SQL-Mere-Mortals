USE SalesOrdersExample
SELECT VendName, VendStreetAddress + ', ' + VendCity + '  ' + VendState + '  ' + VendZipCode AS VendCompleteAddress, VendPhoneNumber 
FROM Vendors
ORDER BY VendName