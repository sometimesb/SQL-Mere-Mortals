USE SchoolSchedulingExample

SELECT DISTINCT Subjects.SubjectID, Subjects.SubjectName, Classes.WednesdaySchedule
FROM Classes
INNER JOIN Subjects
ON Classes.SubjectID = Subjects.SubjectID AND WednesdaySchedule = 1