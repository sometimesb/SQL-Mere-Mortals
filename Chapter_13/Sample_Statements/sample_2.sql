USE EntertainmentAgencyExample

SELECT Entertainers.EntertainerID, Members.MbrFirstName, Members.MbrLastName,
    SUM(Engagements.ContractPRice)/ (SELECT COUNT(*) FROM Entertainer_Members WHERE Entertainer_Members.Status <> 3 AND Entertainer_Members.EntertainerID=Entertainers.EntertainerID) AS memberPay
FROM Entertainers
INNER JOIN [Entertainer_Members] ON Entertainer_Members. EntertainerID = Entertainers.EntertainerID
INNER JOIN Members ON Members.MemberID = Entertainer_Members.MemberID
INNER JOIN Engagements ON Engagements.EntertainerID = Entertainers.EntertainerID

WHERE Entertainer_Members.Status <> 3

GROUP BY Entertainers.EntertainerID, Members.MbrFirstName, Members.MbrLastName
ORDER BY Members.MbrLastName, Entertainers.EntertainerID
