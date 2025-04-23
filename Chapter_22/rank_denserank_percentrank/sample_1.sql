SELECT Employees.EmployeeID, Employees.EMPFirstName + ' ' + Employees.EMPLastName AS EmployeeName, COUNT(DISTINCT(Orders.OrderNumber)) As OrdersReceived,
	RANK() OVER(
	ORDER BY COUNT(DISTINCT(Orders.OrderNumber)) DESC) As Rank
	
FROM Employees
INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN Order_Details ON Order_Details.OrderNumber = Orders.OrderNumber
GROUP BY Employees.EmployeeID, Employees.EMPFirstName, Employees.EMPLastName