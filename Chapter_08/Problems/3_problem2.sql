USE SchoolSchedulingExample

SELECT (Students.StudLastName + ', ' + Students.StudFirstName) AS StudentFullName, Classes.ClassID, Subjects.SubjectName, Student_Class_Status.ClassStatusDescription
FROM Students
INNER JOIN Student_Schedules 
ON Students.StudentID = Student_Schedules.StudentID
INNER JOIN Classes
ON Classes.ClassID = Student_Schedules.ClassID
INNER JOIN Subjects
ON Subjects.SubjectID = Classes.SubjectID
INNER JOIN Student_Class_Status
ON Student_Class_Status.ClassStatus = Student_Schedules.ClassStatus

WHERE Student_Class_Status.ClassStatusDescription = 'Enrolled'