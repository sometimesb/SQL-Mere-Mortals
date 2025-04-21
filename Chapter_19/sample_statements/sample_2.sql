SELECT ProductNumber, ProductName
FROM Products

SELECT Order_Details.ProductNumber, Products.ProductName, SUM(ORder_Details.QuantityOrdered) As TotalQuantityOrdered,
	(CASE WHEN SUM(ORder_Details.QuantityOrdered) <= 200 THEN 'Poor'
		  WHEN SUM(ORder_Details.QuantityOrdered) > 200 and SUM(ORder_Details.QuantityOrdered) <= 500 THEN 'Average'
		  WHEN SUM(ORder_Details.QuantityOrdered) > 500 AND SUM(ORder_Details.QuantityOrdered) <= 1000 THEN 'Good'
		  WHEN SUM(ORder_Details.QuantityOrdered) > 1000 THEN 'Excellcent'
	ELSE 'Other' END) SalesQuality
FROM Order_Details
INNER JOIN Products ON Products.ProductNumber = Order_Details.ProductNumber
GROUP BY Order_Details.ProductNumber,Products.ProductName
ORDER BY 1