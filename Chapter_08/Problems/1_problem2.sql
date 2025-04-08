USE SalesOrdersExample

SELECT DISTINCT Employees.EmpFirstName + ' ' + Employees.EmpLastName AS EmpFullName, Customers.CustFirstName + ' ' + Customers.CustLastName AS CustFullName
FROM Customers
INNER JOIN Orders
ON Orders.CustomerID = Customers.CustomerID
INNER JOIN Employees
ON Employees.EmployeeID = Orders.EmployeeID
ORDER BY Employees.EmpFirstName + ' ' + Employees.EmpLastName
