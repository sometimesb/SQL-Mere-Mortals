USE [SchoolSchedulingExample]

--list students who have never withdrawn from a class

SELECT StudentsQuery.StudentID, StudentsQuery.StudFirstName
FROM Students AS StudentsQuery
LEFT JOIN
(SELECT Student_Schedules.StudentID
FROM Student_Schedules
INNER JOIN Student_Class_Status ON Student_Class_Status.ClassStatus = Student_Schedules.ClassStatus
WHERE [Student_Class_Status].[ClassStatusDescription] = 'Withdrew') AS WithdrewQuery
ON WithdrewQuery.StudentID = StudentsQuery.StudentID
WHERE WithdrewQuery.StudentID is Null