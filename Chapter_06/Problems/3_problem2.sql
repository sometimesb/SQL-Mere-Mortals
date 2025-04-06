Use SchoolSchedulingExample

SELECT StudLastName + ' ' + StudFirstName AS StudentName, StudAreaCode, StudPhoneNumber, StudState
FROM Students
WHERE StudState NOT IN ('ID',  'OR', 'WA')
