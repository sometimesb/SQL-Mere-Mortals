SELECT Teams.TeamName, Bowlers.BowlerCity, COUNT(*) As GamesBowled
FROM Teams
INNER JOIN Bowlers ON Bowlers.TeamID = Teams.TeamID
INNER JOIN Bowler_Scores ON Bowler_Scores.BowlerID = Bowlers.BowlerID
GROUP BY GROUPING SETS(Teams.TeamName, Bowlers.BowlerCity)
