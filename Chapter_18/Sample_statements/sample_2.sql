--find all customers who have not ordered a bike or tire
SELECT Customers.CustomerID, Customers.CustFirstName, Customers.CustLastName
FROM Customers
WHERE Customers.CustomerID NOT IN 
	(SELECT Orders.CustomerID
	FROM Orders
	INNER JOIN Order_Details ON Order_Details.OrderNumber = Orders.OrderNumber
	INNER JOIN Products ON Products.ProductNumber = Order_Details.ProductNumber
	WHERE Products.CategoryID = 2)
--bike
AND Customers.CustomerID NOT IN 
	(SELECT Orders.CustomerID
	FROM Orders
	INNER JOIN Order_Details ON Order_Details.OrderNumber = Orders.OrderNumber
	INNER JOIN Products ON Products.ProductNumber = Order_Details.ProductNumber
	WHERE Products.CategoryID = 6)
--tires


-- OR THIS SOLUTIOn
--find all customers who have not ordered a bike or tire
SELECT Customers.CustomerID, Customers.CustFirstName, Customers.CustLastName
FROM Customers
WHERE Customers.CustomerID NOT IN 
	(SELECT Orders.CustomerID
	FROM Orders
	INNER JOIN Order_Details ON Order_Details.OrderNumber = Orders.OrderNumber
	INNER JOIN Products ON Products.ProductNumber = Order_Details.ProductNumber
	WHERE Products.CategoryID = 2 OR Products.CategoryID = 6)

