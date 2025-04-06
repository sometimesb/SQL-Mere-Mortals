USE BowlingLeagueExample

SELECT BowlerFirstNAme, BowlerLastName, TeamID 
FROM Bowlers
WHERE (TeamID = 3 OR TeamID = 4 OR TeamID = 5) AND BowlerLastName LIKE 'H%'