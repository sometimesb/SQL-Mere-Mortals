USE SalesOrdersExample;

--Filter THEN add back the nulls

SELECT * 
FROM Customers
LEFT OUTER JOIN
    (SELECT Orders.CustomerID, Orders.OrderDate, Order_Details.QuantityOrdered, Order_Details.QuotedPrice, Products.ProductName, Categories.CategoryDescription
    FROM
    (
        Orders INNER JOIN Order_Details ON Order_Details.OrderNumber = Orders.OrderNumber
        INNER JOIN Products ON Order_Details.ProductNumber = Products.ProductNumber
        INNER JOIN Categories ON Categories.CategoryID = Products.CategoryID
    )
    WHERE Categories.CategoryDescription = 'Bikes') AS RD
ON Customers.CustomerID = RD.CustomerID