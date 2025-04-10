-- List entertainers who have never been booked
USE [EntertainmentAgencyExample]

SELECT Engagements.EngagementNumber, Entertainers.EntertainerID, Entertainers. EntStageName
FROM Entertainers LEFT JOIN Engagements ON Engagements.EntertainerID = Entertainers.EntertainerID
WHERE Engagements.EngagementNumber is Null