USE EntertainmentAgencyExample

SELECT (Agents.AgtFirstName + ' ' + Agents.AgtLastName) AS AgtFullName, Entertainers.EntStageName, Agents.AgtZipCode
FROM Agents
INNER JOIN Entertainers
ON Entertainers.EntZipCode = Agents.AgtZipCOde