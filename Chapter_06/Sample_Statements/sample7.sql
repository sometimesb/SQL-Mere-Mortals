USE BowlingLeagueExample

SELECT WinningTeamID, MatchID, GameNumber
FROM Match_Games
WHERE GameNumber = 3  AND MatchID >= 1 and MATCHID <= 10