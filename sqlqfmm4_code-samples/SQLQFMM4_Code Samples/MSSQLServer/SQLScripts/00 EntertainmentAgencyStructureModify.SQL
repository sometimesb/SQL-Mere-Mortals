CREATE DATABASE EntertainmentAgencyModify
GO

use EntertainmentAgencyModify
GO

CREATE TABLE Agents (
	AgentID int IDENTITY (1, 1) NOT NULL ,
	AgtFirstName nvarchar (25) NULL ,
	AgtLastName nvarchar (25) NULL ,
	AgtStreetAddress nvarchar (50) NULL ,
	AgtCity nvarchar (30) NULL ,
	AgtState nvarchar (2) NULL ,
	AgtZipCode nvarchar (10) NULL ,
	AgtPhoneNumber nvarchar (15) NULL ,
	DateHired date NULL ,
	Salary money NULL ,
	CommissionRate float(24) NULL ,
)
GO

CREATE TABLE Customers (
	CustomerID int IDENTITY (1, 1) NOT NULL ,
	CustFirstName nvarchar (25) NULL ,
	CustLastName nvarchar (25) NULL ,
	CustStreetAddress nvarchar (50) NULL ,
	CustCity nvarchar (30) NULL ,
	CustState nvarchar (2) NULL ,
	CustZipCode nvarchar (10) NULL ,
	CustPhoneNumber nvarchar (15) NULL 
)
GO

CREATE TABLE Engagements (
	EngagementNumber int IDENTITY (1, 1) NOT NULL ,
	StartDate date NULL ,
	EndDate date NULL ,
	StartTime time NULL ,
	StopTime time NULL ,
	ContractPrice money NULL ,
	CustomerID int NULL ,
	AgentID int NULL ,
	EntertainerID int NULL 
)
GO

CREATE TABLE Engagements_Archive (
	EngagementNumber int NOT NULL ,
	StartDate date NULL ,
	EndDate date NULL ,
	StartTime time NULL ,
	StopTime time NULL ,
	ContractPrice money NULL ,
	CustomerID int NULL ,
	AgentID int NULL ,
	EntertainerID int NULL 
)
GO

CREATE TABLE Entertainer_Members (
	EntertainerID int NOT NULL ,
	MemberID int NOT NULL ,
	Status smallint NULL 
)
GO

CREATE TABLE Entertainer_Styles (
	EntertainerID int NOT NULL ,
	StyleID int NOT NULL 
)
GO

CREATE TABLE Entertainers (
	EntertainerID int IDENTITY (1, 1) NOT NULL ,
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
	EntPricePerDay money NULL 
)
GO

CREATE TABLE Members (
	MemberID int IDENTITY (1, 1) NOT NULL ,
	MbrFirstName nvarchar (25) NULL ,
	MbrLastName nvarchar (25) NULL ,
	MbrPhoneNumber nvarchar (15) NULL ,
	Gender nvarchar (2) NULL 
)
GO

CREATE TABLE Musical_Preferences (
	CustomerID int NOT NULL ,
	StyleID int NOT NULL 
)
GO

CREATE TABLE Musical_Styles (
	StyleID int IDENTITY (1, 1) NOT NULL ,
	StyleName nvarchar (75) NULL 
)
GO

 ALTER TABLE Agents ADD 
	CONSTRAINT Salary_Default DEFAULT (0) FOR Salary,
	CONSTRAINT Commision_Rate_Default DEFAULT (0) FOR CommissionRate,
	CONSTRAINT Agents_PK PRIMARY KEY   
	(
		AgentID
	)  
GO

 CREATE  INDEX AgtZipCode ON Agents(AgtZipCode)
GO

ALTER TABLE Customers ADD 
	CONSTRAINT Customers_PK PRIMARY KEY   
	(
		CustomerID
	)  
GO

 CREATE  INDEX CustZipCode ON Customers(CustZipCode)
GO

ALTER TABLE Engagements ADD 
	CONSTRAINT Contract_Price_Default DEFAULT (0) FOR ContractPrice,
	CONSTRAINT EN_Customer_ID_Default DEFAULT (0) FOR CustomerID,
	CONSTRAINT EN_Agent_ID_Default DEFAULT (0) FOR AgentID,
	CONSTRAINT EN_Entertainer_ID_Default DEFAULT (0) FOR EntertainerID,
	CONSTRAINT Engagements_PK PRIMARY KEY   
	(
		EngagementNumber
	)  
GO

 CREATE  INDEX AgentsEngagements ON Engagements(AgentID)
GO

 CREATE  INDEX CustomerID ON Engagements(CustomerID)
GO

 CREATE  INDEX EmployeeID ON Engagements(AgentID)
GO

 CREATE  INDEX EntertainerID ON Engagements(EntertainerID)
GO

ALTER TABLE Engagements_Archive ADD
        CONSTRAINT Engagements_Archive_PK PRIMARY KEY 
        (
                EngagementNumber
        )
GO

CREATE  INDEX CustomerID ON Engagements_Archive(CustomerID)
GO

CREATE  INDEX EmployeeID ON Engagements_Archive(AgentID)
GO

CREATE  INDEX EntertainerID ON Engagements_Archive(EntertainerID)
GO

ALTER TABLE Entertainer_Members ADD 
	CONSTRAINT EM_Member_ID_Default DEFAULT (0) FOR MemberID,
	CONSTRAINT EM_Status_Default DEFAULT (0) FOR Status,
	CONSTRAINT Entertainer_Members_PK PRIMARY KEY   
	(
		EntertainerID,
		MemberID
	)  
GO

 CREATE  INDEX EntertainersEntertainerMembers ON Entertainer_Members(EntertainerID)
GO

 CREATE  INDEX MembersEntertainerMembers ON Entertainer_Members(MemberID)
GO

ALTER TABLE Entertainer_Styles ADD 
	CONSTRAINT ES_Style_ID_Default DEFAULT (0) FOR StyleID,
	CONSTRAINT Entertainer_Styles_PK PRIMARY KEY   
	(
		EntertainerID,
		StyleID
	)  
GO

 CREATE  INDEX EntertainersEntertainerStyles ON Entertainer_Styles(EntertainerID)
GO

 CREATE  INDEX MusicalStylesEntStyles ON Entertainer_Styles(StyleID)
GO

ALTER TABLE Entertainers ADD 
	CONSTRAINT Entertainers_PK PRIMARY KEY   
	(
		EntertainerID
	)  
GO

 CREATE  INDEX EntZipCode ON Entertainers(EntZipCode)
GO

ALTER TABLE Members ADD 
	CONSTRAINT Members_PK PRIMARY KEY   
	(
		MemberID
	)  
GO

ALTER TABLE Musical_Preferences ADD 
	CONSTRAINT MP_Customer_ID_Default DEFAULT (0) FOR CustomerID,
	CONSTRAINT MP_Style_ID_Default DEFAULT (0) FOR StyleID,
	CONSTRAINT Musical_Preferences_PK PRIMARY KEY   
	(
		CustomerID,
		StyleID
	)  
GO

 CREATE  INDEX CustomerID ON Musical_Preferences(CustomerID)
GO

 CREATE  INDEX StyleID ON Musical_Preferences(StyleID)
GO

ALTER TABLE Musical_Styles ADD 
	CONSTRAINT Musical_Styles_PK PRIMARY KEY   
	(
		StyleID
	)  
GO

ALTER TABLE Engagements ADD 
	CONSTRAINT Engagements_FK00 FOREIGN KEY 
	(
		AgentID
	) REFERENCES Agents (
		AgentID
	),
	CONSTRAINT Engagements_FK01 FOREIGN KEY 
	(
		CustomerID
	) REFERENCES Customers (
		CustomerID
	),
	CONSTRAINT Engagements_FK02 FOREIGN KEY 
	(
		EntertainerID
	) REFERENCES Entertainers (
		EntertainerID
	)
GO

ALTER TABLE Entertainer_Members ADD 
	CONSTRAINT Entertainer_Members_FK00 FOREIGN KEY 
	(
		EntertainerID
	) REFERENCES Entertainers (
		EntertainerID
	),
	CONSTRAINT Entertainer_Members_FK01 FOREIGN KEY 
	(
		MemberID
	) REFERENCES Members (
		MemberID
	)
GO

ALTER TABLE Entertainer_Styles ADD 
	CONSTRAINT Entertainer_Styles_FK00 FOREIGN KEY 
	(
		EntertainerID
	) REFERENCES Entertainers (
		EntertainerID
	),
	CONSTRAINT Entertainer_Styles_FK01 FOREIGN KEY 
	(
		StyleID
	) REFERENCES Musical_Styles (
		StyleID
	)
GO

ALTER TABLE Musical_Preferences ADD 
	CONSTRAINT Musical_Preferences_FK00 FOREIGN KEY 
	(
		CustomerID
	) REFERENCES Customers (
		CustomerID
	),
	CONSTRAINT Musical_Preferences_FK01 FOREIGN KEY 
	(
		StyleID
	) REFERENCES Musical_Styles (
		StyleID
	)
GO

