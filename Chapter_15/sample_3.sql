USE EntertainmentAgencyModify

BEGIN TRANSACTION

SELECT Salary, Salary*1.06
FROM Agents

UPDATE Agents
SET Salary = Salary*1.06

SELECT *
FROM Agents

COMMIT