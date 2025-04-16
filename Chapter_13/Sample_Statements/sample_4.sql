USE BowlingLeagueExample

SELECT Tournaments.TourneyID, Tournaments.TourneyLocation, Tourney_Matches.MatchID, Teams.TeamName, SUM(Bowler_Scores.HandiCapScore) AS TotalHandiCapScore
FROM Tournaments
INNER JOIN Tourney_Matches ON Tourney_Matches.TourneyID = Tournaments.TourneyID
INNER JOIN Match_Games ON Tourney_Matches.MatchID = Match_Games.MatchID
INNER JOIN Bowler_Scores ON Bowler_Scores.MatchID = Match_Games.MatchID AND Match_Games.GameNumber = Bowler_Scores.GameNumber
INNER JOIN Bowlers ON Bowlers.BowlerID = Bowler_Scores.BowlerID
INNER JOIN Teams ON Teams.TeamID = Bowlers.TeamID
GROUP BY Tournaments.TourneyID, Tournaments.TourneyLocation, Tourney_Matches.MatchID, Teams.TeamName
ORDER BY Tournaments.TourneyID, Tourney_Matches.MatchID, Teams.TeamName