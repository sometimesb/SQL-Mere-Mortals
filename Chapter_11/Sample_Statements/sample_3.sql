USE SchoolSchedulingExample

SELECT Subjects.SubjectName, (SELECT COUNT(*) FROM CLASSES WHERE MONDAYSCHEDULE = 1 AND Classes.SubjectID = Subjects.SubjectID) AS MONDAYCount
FROM Subjects