USE [SchoolSchedulingExample]

--List the faculty members not teaching a class

SELECT Staff.StaffID, Staff.StfFirstName, Staff.StfLastName, Faculty_Classes.ClassID
FROM Staff
LEFT OUTER JOIN Faculty_Classes ON Faculty_Classes.StaffID = Staff.StaffID
WHERE Faculty_Classes.ClassID is NULL