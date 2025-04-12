USE SalesOrdersExample

SELECT COUNT(*) AS CustomersInCalifornia
FROM Customers
WHERE CustState = 'CA'