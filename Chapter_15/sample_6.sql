USE SchoolSchedulingModify

BEGIN TRANSACTION

SELECT Students.StudentID, Students.StudFirstName, Students.StudLastName, Students.StudGPA, SUM(Classes.Credits) AS TotalCredits,  ROUND(SUM(Classes.Credits * Student_Schedules.Grade) * 1.0 / NULLIF(SUM(Classes.Credits), 0), 2) AS CalculatedGPA
FROM Students
INNER JOIN Student_Schedules ON Student_Schedules.StudentID = Students.StudentID
INNER JOIN Classes ON Classes.ClassID = Student_Schedules.ClassID
WHERE Student_Schedules.ClassStatus=2
GROUP BY Students.StudentID, Students.StudFirstName, Students.StudLastName, Students.StudGPA


UPDATE Students
SET Students.StudGPA = GPAData.CalculatedGPA
FROM Students
INNER JOIN(
    SELECT Student_Schedules.StudentID,ROUND(SUM(Classes.Credits * Student_Schedules.Grade) * 1.0 / NULLIF(SUM(Classes.Credits), 0), 3) AS CalculatedGPA
    FROM Student_Schedules
    INNER JOIN Classes ON Classes.ClassID = Student_Schedules.ClassID
    WHERE Student_Schedules.ClassStatus=2
    GROUP BY Student_Schedules.StudentID
) AS GPAData ON Students.StudentID = GPAData.StudentID



SELECT Students.StudentID, Students.StudFirstName, Students.StudLastName, Students.StudGPA, SUM(Classes.Credits) AS TotalCredits,  ROUND(SUM(Classes.Credits * Student_Schedules.Grade) * 1.0 / NULLIF(SUM(Classes.Credits), 0), 2) AS CalculatedGPA
FROM Students
INNER JOIN Student_Schedules ON Student_Schedules.StudentID = Students.StudentID
INNER JOIN Classes ON Classes.ClassID = Student_Schedules.ClassID
WHERE Student_Schedules.ClassStatus=2
GROUP BY Students.StudentID, Students.StudFirstName, Students.StudLastName, Students.StudGPA

COMMIT