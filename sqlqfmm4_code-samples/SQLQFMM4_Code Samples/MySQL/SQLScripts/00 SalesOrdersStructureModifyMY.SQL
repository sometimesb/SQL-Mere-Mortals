CREATE DATABASE SalesOrdersModify;

use SalesOrdersModify;

CREATE TABLE Categories (
	CategoryID int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	CategoryDescription nvarchar (75) NULL 
	);

CREATE TABLE Customers (
	CustomerID int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	CustFirstName nvarchar (25) NULL ,
	CustLastName nvarchar (25) NULL ,
	CustStreetAddress nvarchar (50) NULL ,
	CustCity nvarchar (30) NULL ,
	CustState nvarchar (2) NULL ,
	CustZipCode nvarchar (10) NULL ,
	CustAreaCode smallint NULL DEFAULT 0 ,
	CustPhoneNumber nvarchar (8) NULL 
	);

CREATE TABLE Employees (
	EmployeeID int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	EmpFirstName nvarchar (25) NULL ,
	EmpLastName nvarchar (25) NULL ,
	EmpStreetAddress nvarchar (50) NULL ,
	EmpCity nvarchar (30) NULL ,
	EmpState nvarchar (2) NULL ,
	EmpZipCode nvarchar (10) NULL ,
	EmpAreaCode smallint NULL DEFAULT 0 ,
	EmpPhoneNumber nvarchar (8) NULL 
	);

CREATE TABLE Order_Details (
	OrderNumber int NOT NULL DEFAULT 0 ,
	ProductNumber int NOT NULL DEFAULT 0 ,
	QuotedPrice decimal (15,2) NULL DEFAULT 0 ,
	QuantityOrdered smallint NULL DEFAULT 0  
	);

CREATE TABLE Order_Details_Archive (
	OrderNumber int NOT NULL DEFAULT 0 ,
	ProductNumber int NOT NULL DEFAULT 0 ,
	QuotedPrice decimal (15,2) NULL DEFAULT 0 ,
	QuantityOrdered smallint NULL DEFAULT 0 
);

CREATE TABLE Orders (
	OrderNumber int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	OrderDate date NULL ,
	ShipDate date NULL ,
	CustomerID int NULL DEFAULT 0 ,
	EmployeeID int NULL DEFAULT 0 ,
	OrderTotal decimal (15,2) NULL DEFAULT 0 
	);

CREATE TABLE Orders_Archive (
	OrderNumber int NOT NULL PRIMARY KEY DEFAULT 0 ,
	OrderDate date NULL ,
	ShipDate date NULL ,
	CustomerID int NULL DEFAULT 0 ,
	EmployeeID int NULL DEFAULT 0 ,
	OrderTotal decimal (15,2) NULL DEFAULT 0 
	);


CREATE TABLE Product_Vendors (
	ProductNumber int NOT NULL DEFAULT 0 ,
	VendorID int NOT NULL DEFAULT 0 ,
	WholesalePrice decimal (15,2) NULL DEFAULT 0 ,
	DaysToDeliver smallint NULL DEFAULT 0 
	);

CREATE TABLE Products (
	ProductNumber int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	ProductName nvarchar (50) NULL ,
	ProductDescription nvarchar (100) NULL ,
	RetailPrice decimal (15,2) NULL DEFAULT 0 ,
	QuantityOnHand smallint NULL DEFAULT 0 ,
	CategoryID int NULL DEFAULT 0 
	);

CREATE TABLE Vendors (
	VendorID int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	VendName nvarchar (25) NULL ,
	VendStreetAddress nvarchar (50) NULL ,
	VendCity nvarchar (30) NULL ,
	VendState nvarchar (2) NULL ,
	VendZipCode nvarchar (10) NULL ,
	VendPhoneNumber nvarchar (15) NULL ,
	VendFaxNumber nvarchar (15) NULL ,
	VendWebPage text NULL ,
	VendEMailAddress nvarchar (50) NULL
	);

CREATE  INDEX CustAreaCode ON Customers(CustAreaCode);

CREATE  INDEX CustZipCode ON Customers(CustZipCode);

CREATE  INDEX EmpAreaCode ON Employees(EmpAreaCode);

CREATE  INDEX EmpZipCode ON Employees(EmpZipCode);

ALTER TABLE Order_Details 
	ADD CONSTRAINT Order_Details_PK PRIMARY KEY 
	(
		OrderNumber, 
		ProductNumber
	);

CREATE  INDEX OrdersOrderDetails ON Order_Details(OrderNumber);

CREATE  INDEX ProductsOrderDetails ON Order_Details(ProductNumber);

ALTER TABLE Order_Details_Archive 
	ADD CONSTRAINT Order_Details_Archive_PK PRIMARY KEY 
	(
		OrderNumber, 
		ProductNumber
	); 

CREATE  INDEX Orders_ArchiveOrder_Details_Archive ON Order_Details_Archive(OrderNumber);

CREATE  INDEX CustomerID ON Orders(CustomerID);

CREATE  INDEX EmployeeID ON Orders(EmployeeID);

CREATE  INDEX CustomerID ON Orders_Archive(CustomerID);

CREATE  INDEX EmployeeID ON Orders_Archive(EmployeeID);

ALTER TABLE Product_Vendors 
	ADD CONSTRAINT Product_Vendors_PK PRIMARY KEY 
	(
		ProductNumber, 
		VendorID
	);

CREATE  INDEX ProductsProductVendors ON Product_Vendors(ProductNumber);

CREATE  INDEX VendorID ON Product_Vendors(VendorID);

CREATE  INDEX CategoryID ON Products(CategoryID);

CREATE  INDEX VendZipCode ON Vendors(VendZipCode);

ALTER TABLE Order_Details 
	ADD CONSTRAINT Order_Details_FK00 FOREIGN KEY 
	(
		OrderNumber
	) REFERENCES Orders (
		OrderNumber
	),
	ADD CONSTRAINT Order_Details_FK01 FOREIGN KEY 
	(
		ProductNumber
	) REFERENCES Products (
		ProductNumber
	);

ALTER TABLE Order_Details_Archive 
	ADD CONSTRAINT Order_Details_Archive_FK00 FOREIGN KEY 
	(
		OrderNumber
	) REFERENCES Orders_Archive (
		OrderNumber
	);

ALTER TABLE Orders 
	ADD CONSTRAINT Orders_FK00 FOREIGN KEY 
	(
		CustomerID
	) REFERENCES Customers (
		CustomerID
	),
	ADD CONSTRAINT Orders_FK01 FOREIGN KEY 
	(
		EmployeeID
	) REFERENCES Employees (
		EmployeeID
	);

ALTER TABLE Product_Vendors 
	ADD CONSTRAINT Product_Vendors_FK00 FOREIGN KEY 
	(
		ProductNumber
	) REFERENCES Products (
		ProductNumber
	),
	ADD CONSTRAINT Product_Vendors_FK01 FOREIGN KEY 
	(
		VendorID
	) REFERENCES Vendors (
		VendorID
	);

ALTER TABLE Products 
	ADD CONSTRAINT Products_FK00 FOREIGN KEY 
	(
		CategoryID
	) REFERENCES Categories (
		CategoryID
	);