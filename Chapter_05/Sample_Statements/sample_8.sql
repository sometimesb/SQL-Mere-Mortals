-- What was the point spread between a bowler's handicap and raw score for each match and game played?
Use BowlingLeagueExample
SELECT BowlerID, MatchID, GameNumber, HandiCapScore, RawScore, HandiCapScore-RawScore AS PointDifference
FROM Bowler_Scores