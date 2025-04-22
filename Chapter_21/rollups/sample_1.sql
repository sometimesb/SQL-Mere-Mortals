-- for each category of product, show me by state the count of orders and how much revenue the customers have generated.
-- give me a subtotal for each category plus a grand total

SELECT Categories.CategoryDescription, Customers.CustState, COUNT(DISTINCT Orders.OrderNumber) As OrderCount, SUM(Order_details.QuotedPrice * Order_Details.QuantityOrdered) As Revenue
FROM Order_Details
INNER JOIN Orders ON Orders.OrderNumber = Order_Details.OrderNumber
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID
INNER JOIN Products ON Products.ProductNumber = Order_Details.ProductNumber
INNER JOIN Categories ON Categories.CategoryID = Products.CategoryID
GROUP BY ROLLUP(Categories.CategoryDescription,Customers.CustState)