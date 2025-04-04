Use EntertainmentAgencyExample
SELECT AgtFirstName + ' ' + AgtLastName AS Name, DateHired, DATEADD(day, 180, DateHired) AS PerformanceDate
FROM Agents