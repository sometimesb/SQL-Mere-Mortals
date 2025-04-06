USE EntertainmentAgencyExample

SELECT EngagementNumber, DATEDIFF(day, StartDate, EndDate) AS DaysRunning
FROM ENGAGEMENTS
WHERE DATEDIFF(day, StartDate, EndDate) = 3