USE EntertainmentAgencyExample;

SELECT EngagementNumber, ContractPrice, StartDate, EndDate,StartTime
FROM Engagements
WHERE     (StartDate <= '10/31/2017') AND (EndDate >= '10/1/2017') 
AND StartTime >= '12:00:00' AND StartTime <= '17:00:00'
