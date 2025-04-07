USE BowlingLeagueExample

SELECT Teams.TeamName, Teams.CaptainID, Bowlers.TeamID, Bowlers.BowlerFirstName + ' ' + Bowlers.BowlerLastName AS CaptainName
FROM Teams
INNER JOIN Bowlers
ON Bowlers.BowlerID = Teams.CaptainID