USE SchoolSchedulingExample

SELECT StudFirstName, StudLastName, StudCity
FROM Students
WHERE StudLastName = 'Kennedy' OR StudCity = 'Seattle'