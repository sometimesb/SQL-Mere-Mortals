SELECT DISTINCT Entertainers.EntertainerID, Entertainers.EntStageName,
	(CASE WHEN Entertainers.EntertainerID IN
		(SELECT EntertainerID 
		FROM Engagements
		WHERE '2017-12-25' BETWEEN StartDate AND EndDate)
		THEN 'Booked'
		ELSE 'Not Booked' END) 
		AS BookingStatus
FROM Entertainers

