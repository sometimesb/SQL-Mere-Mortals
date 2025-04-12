USE BowlingLeagueExample

SELECT *
FROM
(Select DISTINCT Bowlers.BowlerLastName, Bowlers.BowlerFirstName, (SELECT AVG(RawScore) FROM Bowler_Scores WHERE Bowler_Scores.BOwlerID = Bowlers.BowleriD) AS AvgPersonalScore, (SELECT AVG(RawScore) FROM Bowler_Scores) AS OverallAvgScore
FROM Bowlers
INNER JOIN Bowler_Scores ON Bowler_Scores.BowlerID = Bowlers.BowlerID) AS SubQuery
WHERE SubQuery.AvgPersonalScore >= SubQuery.OverallAvgScore
ORDER BY SubQuery.BowlerLastName,SubQuery.BowlerFirstName