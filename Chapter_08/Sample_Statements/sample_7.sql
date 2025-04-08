USE BowlingLeagueExample

Select Tournaments.TourneyID AS Tourney, Tournaments.TourneyLocation AS Location, Tourney_Matches.MatchID, Tourney_Matches.Lanes, OddTeam.TeamName, EvenTeam.TeamName,
Match_Games.GameNumber,Winners.TeamName

FROM Tournaments
INNER JOIN Tourney_Matches
ON Tournaments.TourneyID = Tourney_Matches.TourneyID
INNER JOIN Teams AS OddTeam
ON OddTeam.TeamID = Tourney_Matches.OddLaneTeamID
INNER JOIN Teams AS EvenTeam
ON EvenTeam.TeamID = Tourney_Matches.EvenLaneTeamID
INNER JOIN Match_Games
ON Match_Games.MatchID = Tourney_Matches.MatchID
INNER JOIN Teams AS Winners
ON Winners.TeamID = Match_Games.WinningTeamID