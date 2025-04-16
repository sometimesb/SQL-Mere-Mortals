USE BowlingLeagueExample

SELECT Bowlers.BowlerFirstName, Bowlers.BowlerLastName, ROUND(AVG(CAST(Bowler_Scores.RawScore AS FLOAT)), 0) AS AverageRawScorePerPerson, MAX(Bowler_Scores.RawScore) As HighestSCore
FROM Bowlers
INNER JOIN Bowler_Scores ON Bowler_Scores.BowlerID = Bowlers.BowlerID
GROUP BY Bowlers.BowlerFirstName, Bowlers.BowlerLastName
HAVING MAX(Bowler_Scores.RawScore) > ROUND(AVG(CAST(Bowler_Scores.RawScore AS FLOAT)), 0) + 20
ORDER BY 1,2
