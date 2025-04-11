USE SalesOrdersExample

SELECT Customers.CustFirstName, Customers.CustLastName, Customers.CustStreetAddress, Customers.CustZipCode
FROM Customers

UNION ALL
SELECT [Employees].EmpFirstName, Employees.EmpLastName, Employees.EmpStreetAddress, Employees.EmpZipCode
FROM Employees