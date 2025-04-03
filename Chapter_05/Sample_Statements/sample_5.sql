Use SchoolSchedulingExample

-- DateDIFF with year literally calculates the difference in years, not days...
-- SELECT StfLastName + ', ' + StfFirstName AS Staff, DateHired, DATEDIFF(year,DateHired, '2017-10-01')-1 AS YearsWithSchool
-- FROM Staff

-- ORDER BY StfLastName, StfFirstName

SELECT StfLastName + ', ' + StfFirstName AS Staff, DateHired, (CAST(DATEDIFF(day,DateHired, '2017-10-01') AS integer)/365) AS YearsWithSchool
FROM Staff

ORDER BY StfLastName, StfFirstName