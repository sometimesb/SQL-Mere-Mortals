--list all products and display whether the poduct was sold in dec 2017
SELECT Products.ProductNumber, Products.ProductName,
	(CASE WHEN Products.ProductNumber IN 
		(SELECT Order_Details.ProductNumber
		FROM Order_Details INNER JOIN Orders ON Orders.OrderNumber = Order_Details.OrderNumber
		WHERE Orders.OrderDate >= '2017-12-01' AND Orders.OrderDate <= '2017-12-31')
		THEN 'Ordered'
		ELSE 'Not Ordered' END) As ProductOrdered
FROM Products

