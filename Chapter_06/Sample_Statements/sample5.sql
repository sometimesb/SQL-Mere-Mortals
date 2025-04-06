USE SchoolSchedulingExample

SELECT StfFirstName, StfLastName, Salary
FROM Staff
WHERE Salary >= 40000 AND Salary <= 50000
ORDER BY  StfLastname,StfFirstName