USE SchoolSchedulingModify

BEGIN TRANSACTION

SELECT StudFirstName, StudLastName, StudZipCode
FROM Students
WHERE StudZipCode IN ('98270','98271')

UPDATE Students
SET StudZipCode = '360'
WHERE StudZipCode IN ('98270','98271')


SELECT StudFirstName, StudLastName, StudZipCode
FROM Students


COMMIT