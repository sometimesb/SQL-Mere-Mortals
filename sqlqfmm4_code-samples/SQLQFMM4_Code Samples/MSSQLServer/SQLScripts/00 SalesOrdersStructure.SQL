CREATE DATABASE SalesOrdersExample
GO

use SalesOrdersExample
GO

CREATE TABLE Categories (
	CategoryID int NOT NULL ,
	CategoryDescription nvarchar (75) NULL 
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
	CustAreaCode smallint NULL ,
	CustPhoneNumber nvarchar (8) NULL 
)
GO

CREATE TABLE Employees (
	EmployeeID int NOT NULL ,
	EmpFirstName nvarchar (25) NULL ,
	EmpLastName nvarchar (25) NULL ,
	EmpStreetAddress nvarchar (50) NULL ,
	EmpCity nvarchar (30) NULL ,
	EmpState nvarchar (2) NULL ,
	EmpZipCode nvarchar (10) NULL ,
	EmpAreaCode smallint NULL ,
	EmpPhoneNumber nvarchar (8) NULL , 
        EmpBirthDate date NULL
)
GO

CREATE TABLE Order_Details (
	OrderNumber int NOT NULL ,
	ProductNumber int NOT NULL ,
	QuotedPrice money NULL ,
	QuantityOrdered smallint NULL 
)
GO

CREATE TABLE Orders (
	OrderNumber int NOT NULL ,
	OrderDate date NULL ,
	ShipDate date NULL ,
	CustomerID int NULL ,
	EmployeeID int NULL 
)
GO

CREATE TABLE Product_Vendors (
	ProductNumber int NOT NULL ,
	VendorID int NOT NULL ,
	WholesalePrice money NULL ,
	DaysToDeliver smallint NULL 
)
GO

CREATE TABLE Products (
	ProductNumber int NOT NULL ,
	ProductName nvarchar (50) NULL ,
	ProductDescription nvarchar (100) NULL ,
	RetailPrice money NULL ,
	QuantityOnHand smallint NULL ,
	CategoryID int NULL 
)
GO

CREATE TABLE Vendors (
	VendorID int NOT NULL ,
	VendName nvarchar (25) NULL ,
	VendStreetAddress nvarchar (50) NULL ,
	VendCity nvarchar (30) NULL ,
	VendState nvarchar (2) NULL ,
	VendZipCode nvarchar (10) NULL ,
	VendPhoneNumber nvarchar (15) NULL ,
	VendFaxNumber nvarchar (15) NULL ,
	VendWebPage ntext NULL ,
	VendEMailAddress nvarchar (50) NULL 
) 
GO

CREATE TABLE ztblMonths (
	MonthYear nvarchar (15) NOT NULL ,
        YearNumber smallint NOT NULL ,
        MonthNumber smallint NOT NULL ,
        MonthStart date NOT NULL ,
        MonthEnd date NOT NULL ,
        January smallint NOT NULL ,
        February smallint NOT NULL ,
        March smallint NOT NULL ,
        April smallint NOT NULL ,
        May smallint NOT NULL ,
        June smallint NOT NULL ,
        July smallint NOT NULL ,
        August smallint NOT NULL ,
        September smallint NOT NULL ,
        October smallint NOT NULL ,
        November smallint NOT NULL ,
        December smallint NOT NULL 
) 
GO

CREATE TABLE ztblPriceRanges ( 
        PriceCategory nvarchar (20) NOT NULL ,
        LowPrice money NULL ,
        HighPrice money NULL
)
GO

CREATE TABLE ztblPurchaseCoupons (
        LowSpend money NOT NULL ,
        HighSpend money NULL ,
        NumCoupons smallint NULL 
)
GO

CREATE TABLE ztblSeqNumbers (
        Sequence int NOT NULL 
)
GO

ALTER TABLE Categories ADD 
	CONSTRAINT Category_ID_Default DEFAULT (0) FOR CategoryID,
	CONSTRAINT Categories_PK PRIMARY KEY   
	(
		CategoryID
	)  
GO

 CREATE  INDEX CategoryID ON Categories(CategoryID)
GO

ALTER TABLE Customers ADD 
	CONSTRAINT Cust_Area_Code_Default DEFAULT (0) FOR CustAreaCode,
	CONSTRAINT Customers_PK PRIMARY KEY   
	(
		CustomerID
	)  
GO

 CREATE  INDEX CustAreaCode ON Customers(CustAreaCode)
GO

 CREATE  INDEX CustZipCode ON Customers(CustZipCode)
GO

ALTER TABLE Employees ADD 
	CONSTRAINT Emp_Area_Code_Default DEFAULT (0) FOR EmpAreaCode,
	CONSTRAINT Employees_PK PRIMARY KEY   
	(
		EmployeeID
	)  
GO

 CREATE  INDEX EmpAreaCode ON Employees(EmpAreaCode)
GO

 CREATE  INDEX EmpZipCode ON Employees(EmpZipCode)
GO

ALTER TABLE Order_Details ADD 
	CONSTRAINT OD_Order_Number_Default DEFAULT (0) FOR OrderNumber,
	CONSTRAINT OD_Product_Number_Default DEFAULT (0) FOR ProductNumber,
	CONSTRAINT Quoted_Price_Default DEFAULT (0) FOR QuotedPrice,
	CONSTRAINT Quantity_Ordered_Default DEFAULT (0) FOR QuantityOrdered,
	CONSTRAINT Order_Details_PK PRIMARY KEY   
	(
		OrderNumber,
		ProductNumber
	)  
GO

 CREATE  INDEX OrdersOrderDetails ON Order_Details(OrderNumber)
GO

 CREATE  INDEX ProductsOrderDetails ON Order_Details(ProductNumber)
GO

ALTER TABLE Orders ADD 
	CONSTRAINT Order_Number_Default DEFAULT (0) FOR OrderNumber,
	CONSTRAINT O_Customer_ID_Default DEFAULT (0) FOR CustomerID,
	CONSTRAINT O_Employee_ID_Default DEFAULT (0) FOR EmployeeID,
	CONSTRAINT Orders_PK PRIMARY KEY   
	(
		OrderNumber
	)  
GO

 CREATE  INDEX CustomerID ON Orders(CustomerID)
GO

 CREATE  INDEX EmployeeID ON Orders(EmployeeID)
GO

ALTER TABLE Product_Vendors ADD 
	CONSTRAINT PV_Product_Number_Default DEFAULT (0) FOR ProductNumber,
	CONSTRAINT PV_Vendor_ID_Default DEFAULT (0) FOR VendorID,
	CONSTRAINT Wholesale_Price_Default DEFAULT (0) FOR WholesalePrice,
	CONSTRAINT Days_To_Deliver_Default DEFAULT (0) FOR DaysToDeliver,
	CONSTRAINT Product_Vendors_PK PRIMARY KEY   
	(
		ProductNumber,
		VendorID
	)  
GO

 CREATE  INDEX ProductsProductVendors ON Product_Vendors(ProductNumber)
GO

 CREATE  INDEX VendorID ON Product_Vendors(VendorID)
GO

ALTER TABLE Products ADD 
	CONSTRAINT Product_Number_Default DEFAULT (0) FOR ProductNumber,
	CONSTRAINT Retail_Price_Default DEFAULT (0) FOR RetailPrice,
	CONSTRAINT Quantitiy_On_Hand_Default DEFAULT (0) FOR QuantityOnHand,
	CONSTRAINT P_Product_ID_Default DEFAULT (0) FOR CategoryID,
	CONSTRAINT roducts_PK PRIMARY KEY   
	(
		ProductNumber
	)  
GO

 CREATE  INDEX CategoriesProducts ON Products(CategoryID)
GO

ALTER TABLE Vendors ADD 
	CONSTRAINT Vendors_PK PRIMARY KEY   
	(
		VendorID
	)  
GO

 CREATE  INDEX VendZipCode ON Vendors(VendZipCode)
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
        CONSTRAINT September_Default DEFAULT (0) FOR September, 
        CONSTRAINT October_Default DEFAULT (0) FOR October, 
        CONSTRAINT November_Default DEFAULT (0) FOR November, 
        CONSTRAINT December_Default DEFAULT (0) FOR December, 
 	CONSTRAINT ztblMonths_PK PRIMARY KEY 
	(
		YearNumber, 
                MonthNumber
	)
GO

 CREATE  UNIQUE INDEX Month_End ON ztblMonths(MonthEnd)
GO

 CREATE  UNIQUE INDEX Month_Start ON ztblMonths(MonthStart)
GO

 CREATE  UNIQUE INDEX Month_Year ON ztblMonths(MonthYear)
GO

ALTER TABLE ztblPriceRanges ADD 
	CONSTRAINT ztblPriceRanges_PK PRIMARY KEY 
	(
		PriceCategory 
	)
GO

ALTER TABLE ztblPurchaseCoupons ADD 
	CONSTRAINT NumCoupons_Default DEFAULT (0) FOR NumCoupons, 
	CONSTRAINT ztblPurchaseCoupons_PK PRIMARY KEY 
	( 
		LowSpend
	)
GO

 CREATE  INDEX Num_Coupons ON ztblPurchaseCoupons(NumCoupons)
GO

ALTER TABLE ztblSeqNumbers ADD 
	CONSTRAINT Sequence_Default DEFAULT (0) FOR Sequence, 
        CONSTRAINT ztblSeqNumbers_PK PRIMARY KEY
        (
                Sequence
        )
GO

ALTER TABLE Order_Details ADD 
	CONSTRAINT Order_Details_FK00 FOREIGN KEY 
	(
		OrderNumber
	) REFERENCES Orders (
		OrderNumber
	),
	CONSTRAINT Order_Details_FK01 FOREIGN KEY 
	(
		ProductNumber
	) REFERENCES Products (
		ProductNumber
	)
GO

ALTER TABLE Orders ADD 
	CONSTRAINT Orders_FK00 FOREIGN KEY 
	(
		CustomerID
	) REFERENCES Customers (
		CustomerID
	),
	CONSTRAINT Orders_FK01 FOREIGN KEY 
	(
		EmployeeID
	) REFERENCES Employees (
		EmployeeID
	)
GO

ALTER TABLE Product_Vendors ADD 
	CONSTRAINT Product_Vendors_FK00 FOREIGN KEY 
	(
		ProductNumber
	) REFERENCES Products (
		ProductNumber
	),
	CONSTRAINT Product_Vendors_FK01 FOREIGN KEY 
	(
		VendorID
	) REFERENCES Vendors (
		VendorID
	)
GO

ALTER TABLE Products ADD 
	CONSTRAINT Products_FK00 FOREIGN KEY 
	(
		CategoryID
	) REFERENCES Categories (
		CategoryID
	)
GO

