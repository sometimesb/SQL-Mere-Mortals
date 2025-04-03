Use SchoolSchedulingExample

SELECT StfLastName + ', ' + StfFirstName As Staff, CAST(Salary AS Money) As Salary, CAST(Salary *0.07 AS Money) AS Bonus
FROM Staff