-- Display a list of all bowlers and addresses formatted suitably for a mailing list, sorted by Zip code
USE BowlingLeagueExample
SELECT BowlerFirstName + ' ' + BowlerLastName AS FullName, BowlerAddress, BowlerCity + ', ' + BowlerState + ' ' + BowlerZip AS CityStateZip, BowlerZip
FROM Bowlers
ORDER BY BowlerZip