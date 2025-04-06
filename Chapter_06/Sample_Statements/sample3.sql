USE EntertainmentAgencyExample

SELECT EntStageName, EntPhoneNumber, EntCity
FROM Entertainers
WHERE EntCity IN ('Bellevue','Redmond', 'Woodinville')