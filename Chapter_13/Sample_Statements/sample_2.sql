USE EntertainmentAgencyExample

SELECT Entertainers.EntertainerID, Members.MbrFirstName, Members.MbrLastName, Entertainer_Members.Status
FROM Entertainers
INNER JOIN [Entertainer_Members] ON Entertainer_Members. EntertainerID = Entertainers.EntertainerID
INNER JOIN Members ON Members.MemberID = Entertainer_Members.MemberID
INNER JOIN Engagements ON Engagements.EntertainerID = Entertainers.EntertainerID
WHERE Entertainer_Members.Status = 999