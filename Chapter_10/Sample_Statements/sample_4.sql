USE [SchoolSchedulingExample]

SELECT Students.StudFirstName, Students.StudLastName , Student_Schedules.Grade, 'Student' AS 'Type'
FROM Students
INNER JOIN Student_Schedules ON Student_Schedules.StudentID = Students.StudentID
INNER JOIN Student_Class_Status ON Student_Class_Status.ClassStatus = Student_Schedules.ClassStatus
INNER JOIN Classes ON Classes.ClassID = Student_Schedules.ClassID
INNER JOIN Subjects ON Subjects.SubjectID = Classes.SubjectID
WHERE Student_Class_Status.ClassStatusDescription = 'Completed' AND Student_Schedules.Grade >= 85 AND Subjects.CategoryID = 'ART'

UNION

SELECT Staff.StfFirstName, Staff.StfLastName, Faculty_Subjects.ProficiencyRating AS Score, 'Faculty' AS Type
FROM Staff 
INNER JOIN Faculty_Subjects ON Staff.StaffID = Faculty_Subjects.StaffID
INNER JOIN Subjects ON Subjects.SubjectID = Faculty_Subjects.SubjectID
WHERE Faculty_Subjects.ProficiencyRating > 8 AND Subjects.CategoryID = 'ART'