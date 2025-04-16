USE SchoolSchedulingExample

SELECT Categories.CategoryDescription, Students.StudFirstName, Students.StudLastName, ROUND(AVG(Student_Schedules.Grade),2) AS AverageGrade
FROM Students
INNER JOIN Student_Schedules ON Student_Schedules.StudentID = Students.StudentID
INNER JOIN Classes ON Classes.ClassID = Student_Schedules.ClassID
INNER JOIN Subjects ON Subjects.SubjectID = Classes.SubjectID
INNER JOIN Categories ON Subjects.CategoryID = Categories.CategoryID
INNER JOIN Student_Class_Status ON Student_Class_Status.ClassStatus = Student_Schedules.ClassStatus
WHERE Student_Class_Status.ClassStatusDescription = 'Completed'
GROUP BY Categories.CategoryDescription, Students.StudFirstName, Students.StudLastName
HAVING AVG(Student_Schedules.Grade) > 90
ORDER BY 2
