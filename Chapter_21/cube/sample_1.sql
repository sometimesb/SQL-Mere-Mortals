SELECT Teams.TeamName, Bowlers.BowlerCity, AVG(Bowler_Scores.HandiCapScore) As AvgScore
FROM Teams
INNER JOIN Bowlers ON Bowlers.TeamID = Teams.TeamID
INNER JOIN Bowler_Scores ON Bowler_Scores.BowlerID = Bowlers.BowlerID
GROUP BY CUBE(Teams.TeamName, Bowlers.BowlerCity)
ORDER BY 1,2