USE SalesOrdersModify

BEGIN TRANSACTION

--get the quoted price and the new price
SELECT Order_Details.QuotedPrice, ROUND(Order_Details.QuotedPrice * 0.95,2)AS UpdatedPrice
FROM Order_Details
WHERE Order_Details.OrderNumber IN
-- get the orders who are associated with this filtered customer list. start from deep and work out
    (SELECT Orders.OrderNumber
    FROM Orders
    WHERE Orders.CustomerID IN
--get the customers who spent more then 50000 in the month of october and only show the customerID
        (SELECT Orders.CustomerID
        FROM Orders
        INNER JOIN Order_Details ON Orders.OrderNumber = Order_Details.OrderNumber
        WHERE (Orders.OrderDate BETWEEN '10/1/2017' AND '10/31/2017')
        GROUP BY Orders.CustomerID
        HAVING (SUM(dbo.Order_Details.QuotedPrice * dbo.Order_Details.QuantityOrdered) > 50000)))


UPDATE Order_Details
SET Order_Details.QuotedPrice = ROUND(Order_Details.QuotedPrice * 0.95,2)
WHERE Order_Details.OrderNumber IN
-- get the orders who are associated with this filtered customer list. start from deep and work out
    (SELECT Orders.OrderNumber
    FROM Orders
    WHERE Orders.CustomerID IN
--get the customers who spent more then 50000 in the month of october and only show the customerID
        (SELECT Orders.CustomerID
        FROM Orders
        INNER JOIN Order_Details ON Orders.OrderNumber = Order_Details.OrderNumber
        WHERE (Orders.OrderDate BETWEEN '10/1/2017' AND '10/31/2017')
        GROUP BY Orders.CustomerID
        HAVING (SUM(dbo.Order_Details.QuotedPrice * dbo.Order_Details.QuantityOrdered) > 50000)))


ROLLBACK