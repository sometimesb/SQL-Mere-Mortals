USE EntertainmentAgencyExample

SELECT EngagementNumber, StartDate, EndDate, ContractPrice
FROM Engagements
INNER JOIN Entertainers ON Entertainers.EntertainerID = Engagements.EntertainerID