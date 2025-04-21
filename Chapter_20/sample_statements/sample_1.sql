-- list all employees and customers who live in the same state and indicate whether the customer has ever placed an order with the employee
SELECT Employees.EmpFirstName, Employees.EmpLastName, Employees.EmpState, Customers.CustFirstName, Customers.CustLastName, Customers.CustAreaCode, Customers.CustPhoneNumber, Customers.CustState,
	(CASE WHEN Customers.CustomerID IN
	(SELECT Orders.CustomerID 
	FROM Orders
	WHERE Orders.EmployeeID = Employees.EMployeeID)
	THEN 'You ordered from the same state!'
	ELSE '' END) as CustStauts
From Employees 
CROSS JOIN Customers
WHERE Employees.EmpState = Customers.CustState