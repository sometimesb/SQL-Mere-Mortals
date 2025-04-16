USE SchoolSchedulingExample

SELECT Staff.StfFirstName, Staff.StfLastName, COUNT(Faculty_Classes.ClassID) AS ClassCount
FROM Staff
LEFT JOIN Faculty_Classes ON Faculty_Classes.StaffID = Staff.StaffID
GROUP BY Staff.StfFirstName, Staff.StfLastName
HAVING COUNT(Faculty_Classes.ClassID) < 3