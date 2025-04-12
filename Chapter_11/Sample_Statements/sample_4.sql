USE BowlingLeagueExample

SELECT Bowlers.BowlerFirstName, Bowlers.BowlerLastName, (Select MAX(RawScore) FROM Bowler_Scores WHERE Bowler_Scores.BowlerID = Bowlers.BowlerID) AS HIGHSCORE
FROM Bowlers