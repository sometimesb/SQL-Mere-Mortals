USE SalesOrdersExample

SELECT Customers.CustFirstName,Customers.CustLastName, Employees.EmpFirstName, Employees.EmpLastName
FROM Customers
INNER JOIN Employees
ON Employees.EmpCity = Customers.CustCity

