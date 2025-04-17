USE EntertainmentAgencyModify

--get the discount
SELECT Engagements.ContractPrice, Engagements.ContractPrice * 0.98 AS UpdatedPrice
FROM Engagements
WHERE Engagements.EngagementNumber IN
    --get the engagements for these customers
    (SELECT Engagements.EngagementNumber
    FROM Engagements
    WHERE Engagements.CustomerID IN
        --get the customers who booked more than $3000 in october 2017
        (SELECT Engagements.CustomerID
        FROM Engagements
        WHERE Engagements.StartDate BETWEEN '10/1/2017' AND '10/31/2017'
        GROUP BY  Engagements.CustomerID
        HAVING SUM(Engagements.ContractPrice) > 3000))