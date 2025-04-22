SELECT BuildingCode, ClassRoomID, SemesterNo, SubjectCode, COUNT(*) As NumberOfSessions
FROM CH20_Class_Schedule_Calendar
GROUP BY ROLLUP(BuildingCode, ClassRoomID, SemesterNo, SubjectCode)