USE SchoolSchedulingExample

SELECT SUM(Salary) AS TotalSalary
FROM Staff
WHERE StfState = 'CA'