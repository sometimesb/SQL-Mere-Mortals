USE EntertainmentAgencyModify

--get commission rate
SELECT Agents.CommissionRate, Agents.CommissionRate + ((0.5/100)) As NewComissionRate
FROM Agents
WHERE Agents.AgentID IN
--find engagements with 20k
(SELECT Engagements.AgentID
FROM Engagements
GROUP BY Engagements.AgentID
HAVING SUM(Engagements.ContractPrice) > 20000)