USE EntertainmentAgencyExample

SELECT EngagementNumber, ContractPrice
FROM Engagements
WHERE StartDate = (SELECT MIN(StartDate) FROM Engagements)