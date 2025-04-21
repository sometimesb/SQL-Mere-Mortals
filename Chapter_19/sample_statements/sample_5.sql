--searched
SELECT Staff.StaffID, Staff.StfFIrstName, Staff.StfLastName, Faculty.Status,Faculty.Title, Staff.Salary, 
	(CASE WHEN Title = 'Instructor' THEN CAST(ROUND(Staff.Salary * 1.05,0)AS Money) 
		  WHEN Title = 'Associate Professor' THEN CAST(ROUND(Staff.Salary * 1.04,0)AS Money) 
		  WHEN Title = 'Professor' THEN CAST(ROUND(Staff.Salary * 1.035,0)AS Money) 

	ELSE Staff.Salary END) As NewSalary
FROM Staff
INNER JOIN Faculty ON Faculty.StaffID = Staff.StaffID
WHERE Faculty.Status = 'Full Time'

--simple
SELECT Staff.StaffID, Staff.StfFIrstName, Staff.StfLastName, Faculty.Status,Faculty.Title, Staff.Salary, 
	(CASE Title 
		  WHEN 'Instructor' THEN CAST(ROUND(Staff.Salary * 1.05,0)AS Money) 
		  WHEN'Associate Professor' THEN CAST(ROUND(Staff.Salary * 1.04,0)AS Money) 
		  WHEN 'Professor' THEN CAST(ROUND(Staff.Salary * 1.035,0)AS Money) 

	ELSE Staff.Salary END) As NewSalary
FROM Staff
INNER JOIN Faculty ON Faculty.StaffID = Staff.StaffID
WHERE Faculty.Status = 'Full Time'