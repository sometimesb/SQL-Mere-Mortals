CREATE DATABASE EntertainmentAgencyExample
GO

use EntertainmentAgencyExample
GO

CREATE TABLE Agents (
	AgentID int NOT NULL ,
	AgtFirstName nvarchar (25) NULL ,
	AgtLastName nvarchar (25) NULL ,
	AgtStreetAddress nvarchar (50) NULL ,
	AgtCity nvarchar (30) NULL ,
	AgtState nvarchar (2) NULL ,
	AgtZipCode nvarchar (10) NULL ,
	AgtPhoneNumber nvarchar (15) NULL ,
	DateHired date NULL ,
	Salary money NULL ,
	CommissionRate float(24) NULL
)
GO

CREATE TABLE Customers (
	CustomerID int NOT NULL ,
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
	StyleID smallint NOT NULL , 
        StyleStrength smallint NOT NULL 
)
GO

CREATE TABLE Entertainers (
	EntertainerID int NOT NULL ,
	EntStageName nvarchar (50) NULL ,
	EntSSN nvarchar (12) NULL ,
	EntStreetAddress nvarchar (50) NULL ,
	EntCity nvarchar (30) NULL ,
	EntState nvarchar (2) NULL ,
	EntZipCode nvarchar (10) NULL ,
	EntPhoneNumber nvarchar (15) NULL ,
	EntWebPage nvarchar (50) NULL ,
	EntEMailAddress nvarchar (50) NULL ,
	DateEntered date NULL 
)
GO

CREATE TABLE Members (
	MemberID int NOT NULL ,
	MbrFirstName nvarchar (25) NULL ,
	MbrLastName nvarchar (25) NULL ,
	MbrPhoneNumber nvarchar (15) NULL ,
	Gender nvarchar (2) NULL 
)
GO

CREATE TABLE Musical_Preferences (
	CustomerID int NOT NULL ,
	StyleID smallint NOT NULL ,
        PreferenceSeq smallint NOT NULL 
)
GO

CREATE TABLE Musical_Styles (
	StyleID smallint NOT NULL ,
	StyleName nvarchar (75) NULL 
)
GO

CREATE TABLE ztblDays (
        DateField date NOT NULL 
)
GO

CREATE TABLE ztblMonths ( 
        MonthYear nvarchar (15) NULL ,
        YearNumber smallint NOT NULL ,
        MonthNumber smallint NOT NULL ,
        MonthStart date NULL ,
        MonthEnd date NULL ,
        January smallint NULL ,
        February smallint NULL ,
        March smallint NULL ,
        April smallint NULL ,
        May smallint NULL ,
        June smallint NULL ,
        July smallint NULL ,
        August smallint NULL ,
        September smallint NULL ,
        October smallint NULL ,
        November smallint NULL ,
        December smallint NULL 
)
GO

CREATE TABLE ztblSkipLabels (
        LabelCount int NOT NULL  
)
GO

CREATE TABLE ztblWeeks ( 
        WeekStart date NOT NULL ,
        WeekEnd date NULL 
)
GO

ALTER TABLE Agents ADD 
	CONSTRAINT Salary_Default DEFAULT (0) FOR Salary,
	CONSTRAINT Commission_Rate_Default DEFAULT (0) FOR CommissionRate,
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
	CONSTRAINT Engagement_Number_Default DEFAULT (0) FOR EngagementNumber,
	CONSTRAINT Contract_Price_Default DEFAULT (0) FOR ContractPrice,
	CONSTRAINT Customer_ID_Default DEFAULT (0) FOR CustomerID,
	CONSTRAINT EN_Agent_ID_Default DEFAULT (0) FOR AgentID,
	CONSTRAINT EN_Entertainer_ID_Default DEFAULT (0) FOR EntertainerID,
	CONSTRAINT Engagements_PK PRIMARY KEY   
	(
		EngagementNumber
	)  
GO

 CREATE  INDEX AgentsEngagements ON Engagements(AgentID)
GO

 CREATE  INDEX CustomersEngagements ON Engagements(CustomerID)
GO

 CREATE  INDEX EntertainersEngagements ON Engagements(EntertainerID)
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
	CONSTRAINT EN_Styles_Default DEFAULT (0) FOR StyleID,
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

 CREATE  UNIQUE  INDEX EntertainerID ON Entertainers(EntertainerID)
GO

 CREATE  INDEX EntZipCode ON Entertainers(EntZipCode)
GO

ALTER TABLE Members ADD 
	CONSTRAINT Member_ID_Default DEFAULT (0) FOR MemberID,
	CONSTRAINT Members_PK PRIMARY KEY   
	(
		MemberID
	)  
GO

 CREATE  INDEX MemberID ON Members(MemberID)
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

 CREATE  INDEX CustomersMusicalPreferences ON Musical_Preferences(CustomerID)
GO

 CREATE  INDEX StyleID ON Musical_Preferences(StyleID)
GO

ALTER TABLE Musical_Styles ADD 
	CONSTRAINT MS_Style_ID_Default DEFAULT (0) FOR StyleID,
	CONSTRAINT Musical_Styles_PK PRIMARY KEY   
	(
		StyleID
	)  
GO

ALTER TABLE ztblDays ADD 
        CONSTRAINT ztblDays_PK PRIMARY KEY 
        ( 
                DateField 
        )
GO

ALTER TABLE ztblMonths ADD 
        CONSTRAINT January_Default DEFAULT (0) FOR January, 
        CONSTRAINT February_Default DEFAULT (0) FOR February, 
        CONSTRAINT March_Default DEFAULT (0) FOR March, 
        CONSTRAINT April_Default DEFAULT (0) FOR April, 
        CONSTRAINT May_Default DEFAULT (0) FOR May, 
        CONSTRAINT June_Default DEFAULT (0) FOR June, 
        CONSTRAINT July_Default DEFAULT (0) FOR July, 
        CONSTRAINT August_Default DEFAULT (0) FOR August, 
        CONSTRAINT September_Default DEFAULT (0) FOR september, 
        CONSTRAINT October_Default DEFAULT (0) FOR October, 
        CONSTRAINT November_Default DEFAULT (0) FOR November, 
        CONSTRAINT December_Default DEFAULT (0) FOR December, 
        CONSTRAINT ztblMonths_PK PRIMARY KEY 
        ( 
                YearNumber, 
                MonthNumber
        )
GO

 CREATE UNIQUE INDEX ztblMontths_MonthEnd ON ztblMonths(MonthEnd) 
GO

 CREATE UNIQUE INDEX ztblMonths_MonthStart ON ztblMonths(MonthStart) 
GO

 CREATE UNIQUE INDEX ztblMonths_MonthYear ON ztblMonths(MonthYear) 
GO

ALTER TABLE ztblSkipLabels ADD 
        CONSTRAINT ztblSkipLabels_PK PRIMARY KEY 
        (
                LabelCount 
        ) 
GO

ALTER TABLE ztblWeeks ADD 
        CONSTRAINT ztblWeeks_PK PRIMARY KEY 
        ( 
                WeekStart 
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


