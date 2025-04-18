CREATE DATABASE EntertainmentAgencyModify;

USE EntertainmentAgencyModify;

CREATE TABLE Agents ( 
 AgentID int NOT NULL AUTO_INCREMENT PRIMARY KEY, 
 AgtFirstName nvarchar (25) NULL , 
 AgtLastName nvarchar (25) NULL , 
 AgtStreetAddress nvarchar (50) NULL , 
 AgtCity nvarchar (30) NULL , 
 AgtState nvarchar (2) NULL , 
 AgtZipCode nvarchar (10) NULL , 
 AgtPhoneNumber nvarchar (15) NULL , 
 DateHired date NULL , 
 Salary decimal(15, 2) NULL DEFAULT 0 , 
 CommissionRate float(24) NULL DEFAULT 0 );

CREATE TABLE Customers ( 
 CustomerID int NOT NULL AUTO_INCREMENT PRIMARY KEY, 
 CustFirstName nvarchar (25) NULL , 
 CustLastName nvarchar (25) NULL , 
 CustStreetAddress nvarchar (50) NULL , 
 CustCity nvarchar (30) NULL , 
 CustState nvarchar (2) NULL , 
 CustZipCode nvarchar (10) NULL , 
 CustPhoneNumber nvarchar (15) NULL );

CREATE TABLE Engagements ( 
 EngagementNumber int NOT NULL AUTO_INCREMENT PRIMARY KEY, 
 StartDate date NULL , 
 EndDate date NULL , 
 StartTime time NULL ,  
 StopTime time NULL , 
 ContractPrice decimal(15,2) NULL DEFAULT 0 , 
 CustomerID int NULL DEFAULT 0 , 
 AgentID int NULL DEFAULT 0 , 
 EntertainerID int NULL DEFAULT 0 );

CREATE TABLE Engagements_Archive ( 
 EngagementNumber int NOT NULL PRIMARY KEY , 
 StartDate date NULL , EndDate date NULL , 
 StartTime time NULL , StopTime time NULL , 
 ContractPrice decimal(15,2) NULL , 
 CustomerID int NULL , 
 AgentID int NULL , 
 EntertainerID int NULL );

CREATE TABLE Entertainer_Members ( 
 EntertainerID int NOT NULL , 
 MemberID int NOT NULL DEFAULT 0 , 
 Status smallint NULL DEFAULT 0 );

CREATE TABLE Entertainer_Styles ( 
 EntertainerID int NOT NULL , 
 StyleID int NOT NULL DEFAULT 0 );

CREATE TABLE Entertainers ( 
 EntertainerID int NOT NULL AUTO_INCREMENT PRIMARY KEY, 
 EntStageName nvarchar (50) NULL , 
 EntSSN nvarchar (12) NULL , 
 EntStreetAddress nvarchar (50) NULL , 
 EntCity nvarchar (30) NULL , 
 EntState nvarchar (2) NULL , 
 EntZipCode nvarchar (10) NULL , 
 EntPhoneNumber nvarchar (15) NULL , 
 EntWebPage nvarchar (50) NULL , 
 EntEMailAddress nvarchar (50) NULL , 
 DateEntered date NULL , 
 EntPricePerDay decimal(15,2) NULL );

CREATE TABLE Members ( 
 MemberID int NOT NULL AUTO_INCREMENT PRIMARY KEY, 
 MbrFirstName nvarchar (25) NULL , 
 MbrLastName nvarchar (25) NULL , 
 MbrPhoneNumber nvarchar (15) NULL , 
 Gender nvarchar (2) NULL );

CREATE TABLE Musical_Preferences ( 
 CustomerID int NOT NULL DEFAULT 0 , 
 StyleID int NOT NULL DEFAULT 0 );

CREATE TABLE Musical_Styles ( 
 StyleID int NOT NULL AUTO_INCREMENT PRIMARY KEY, 
 StyleName nvarchar (75) NULL );

CREATE INDEX AgtZipCode ON Agents(AgtZipCode);

CREATE INDEX CustZipCode ON Customers(CustZipCode);

CREATE INDEX AgentsEngagements ON Engagements(AgentID);

CREATE INDEX CustomerID ON Engagements(CustomerID);

CREATE INDEX EmployeeID ON Engagements(AgentID);

CREATE INDEX EntertainerID ON Engagements(EntertainerID);

CREATE INDEX CustomerID ON Engagements_Archive(CustomerID);

CREATE INDEX EmployeeID ON Engagements_Archive(AgentID);

CREATE INDEX EntertainerID ON Engagements_Archive(EntertainerID);

ALTER TABLE Entertainer_Members 
 ADD CONSTRAINT Entertainer_Members_PK PRIMARY KEY 
 ( 
 EntertainerID, 
 MemberID 
 );

CREATE INDEX EntertainersEntertainer_Members ON Entertainer_Members(EntertainerID);

CREATE INDEX MembersEntertainer_Members ON Entertainer_Members(MemberID);

ALTER TABLE Entertainer_Styles 
 ADD CONSTRAINT Entertainer_Styles_PK PRIMARY KEY 
 ( 
 EntertainerID, 
 StyleID 
 );

CREATE INDEX EntertainersEntertainer_Styles ON Entertainer_Styles(EntertainerID);

CREATE INDEX Musical_StylesEntertainer_Styles ON Entertainer_Styles(StyleID);

CREATE INDEX EntZipCode ON Entertainers(EntZipCode);

ALTER TABLE Musical_Preferences 
 ADD CONSTRAINT Musical_Preferences_PK PRIMARY KEY 
 ( 
 CustomerID, 
 StyleID 
 );

CREATE INDEX CustomerID ON Musical_Preferences(CustomerID);

CREATE INDEX StyleID ON Musical_Preferences(StyleID);

ALTER TABLE Engagements 
 ADD CONSTRAINT Engagements_FK00 FOREIGN KEY 
 ( 
 AgentID 
 ) REFERENCES Agents ( 
 AgentID 
 ), 
 ADD CONSTRAINT Engagements_FK01 FOREIGN KEY 
 ( 
 CustomerID 
 ) REFERENCES Customers ( 
 CustomerID 
 ), 
 ADD CONSTRAINT Engagements_FK02 FOREIGN KEY 
 ( 
 EntertainerID 
 ) REFERENCES Entertainers ( 
 EntertainerID 
 );

ALTER TABLE Entertainer_Members 
 ADD CONSTRAINT Entertainer_Members_FK00 FOREIGN KEY 
 ( 
 EntertainerID 
 ) REFERENCES Entertainers ( 
 EntertainerID 
 ), 
 ADD CONSTRAINT Entertainer_Members_FK01 FOREIGN KEY 
 ( 
 MemberID 
 ) REFERENCES Members ( 
 MemberID 
 );

ALTER TABLE Entertainer_Styles 
 ADD CONSTRAINT Entertainer_Styles_FK00 FOREIGN KEY 
 ( 
 EntertainerID 
 ) REFERENCES Entertainers ( 
 EntertainerID 
 ), 
 ADD CONSTRAINT Entertainer_Styles_FK01 FOREIGN KEY 
 ( 
 StyleID 
 ) REFERENCES Musical_Styles 
 ( 
 StyleID 
 );

ALTER TABLE Musical_Preferences 
 ADD CONSTRAINT Musical_Preferences_FK00 FOREIGN KEY 
 ( 
 CustomerID 
 ) REFERENCES Customers ( 
 CustomerID 
 ), 
 ADD CONSTRAINT Musical_Preferences_FK01 FOREIGN KEY 
 ( 
 StyleID 
 ) REFERENCES Musical_Styles ( 
 StyleID 
 );

