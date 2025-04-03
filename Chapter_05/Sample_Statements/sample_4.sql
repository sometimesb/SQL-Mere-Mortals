-- What is the net amount for each of our contracts?
USE EntertainmentAgencyExample
SELECT EngagementNumber, ContractPrice, ContractPrice * 0.12 AS OurFee, ContractPrice - (ContractPrice * 0.12 ) AS NetAmount
FROM Engagements