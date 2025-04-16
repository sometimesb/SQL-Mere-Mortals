USE BowlingLeagueExample

SELECT Bowlers.BowlerFirstName, Bowlers.BowlerLastName, MAX(Bowler_Scores.RawScore) AS MaxRawScore
FROM Bowlers
INNER JOIN Bowler_Scores ON Bowler_Scores.BowlerID = Bowlers.BowlerID
GROUP BY Bowlers.BowlerFirstName, Bowlers.BowlerLastName
ORDER BY 1,2