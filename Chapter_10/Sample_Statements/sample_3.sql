USE [EntertainmentAgencyExample]

SELECT Agents.AgtLastName + ' ' + Agents.AgtFirstName AS Name, 'Agent' AS Type
FROM Agents

UNION ALL

SELECT Entertainers.EntStageName, 'Entertainers' AS Type
FROM Entertainers
