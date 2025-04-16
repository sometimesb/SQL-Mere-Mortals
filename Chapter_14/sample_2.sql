USE EntertainmentAgencyExample

SELECT Agents.AgtFirstName, Agents.AgtLastName, SUM(Engagements.ContractPrice) As ContractTotalPrice
FROM Agents
INNER JOIN Engagements ON Engagements.AgentID = Agents.AgentID
WHERE Engagements.StartDate >= '2017-12-01' AND Engagements.StartDate <= '2017-12-31'
GROUP BY Agents.AgtFirstName, Agents.AgtLastName
HAVING SUM(Engagements.ContractPrice) > 3000
ORDER BY 1,2