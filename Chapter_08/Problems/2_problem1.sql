USE EntertainmentAgencyExample

SELECT Agents.AgtFirstName + ' ' + Agents.AgtLastName AS AgtFullName, Engagements.StartDate
FROM Agents
INNER JOIN Engagements
ON Engagements.AgentID = Agents.AgentID
ORDER BY Engagements.StartDate