USE EntertainmentAgencyExample;

SELECT EngagementNumber, ContractPrice, StartDate, EndDate,StartTime
FROM Engagements
WHERE StartDate = EndDate
