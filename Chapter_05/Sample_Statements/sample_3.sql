-- How long is each engagement due to run?
USE EntertainmentAgencyExample
SELECT EngagementNumber, CAST((DATEDIFF(day, StartDate, EndDate)+1) AS VARCHAR) + ' day(s)' AS DaysLeftToRun
FROM Engagements