CREATE DATABASE HOTEL;
CREATE TABLE Clients (
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    RoomID INT UNIQUE,
    ClientsID INT IDENTITY(1,1) PRIMARY KEY
);
CREATE TABLE ClientStatus (
    ClientsID INT IDENTITY(1,1) PRIMARY KEY,
    StatusVIP VARCHAR(20),
);
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

CREATE TABLE EmployeeDetails (
    EmployeeID INT PRIMARY KEY,
    WorkingHoursAtWeek INT,
    Salary DECIMAL(10, 2),
    CurrentPosition VARCHAR(50),
    JoinedOn DATE
);

CREATE TABLE WorkerSchedule (
    FromDay VARCHAR(10),
    ToDay VARCHAR(10),
    StartTime TIME,
    EndTime TIME,
    EmployeeID INT PRIMARY KEY
);

CREATE TABLE ChefDetails (
    ChefID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    KitchenPosition VARCHAR(50),
);
CREATE TABLE Menu (
    ChefID INT PRIMARY KEY,
    Drink1 VARCHAR(50),
    Drink2 VARCHAR(50),
    Dish1 VARCHAR(50),
    Dish2 VARCHAR(50),
    Dish3 VARCHAR(50)
);
CREATE TABLE RoomStatus (
    RoomID INT IDENTITY(1,1) PRIMARY KEY,
	RoomNum INT,
    FloorNum INT,
	MaxAmount INT,
	Status VARCHAR(20),
);

CREATE TABLE RoomOccupancy (	
    RoomID INT PRIMARY KEY,
    InUseUntil DATE,
    IsFree BIT
);

CREATE TABLE Booking(
    RoomID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    FromDate DATE,
    UntilDate DATE
);

CREATE TABLE Reports (	
    ReportAsk VARCHAR(50),
    RoomID INT IDENTITY(1,1) PRIMARY KEY
);

CREATE TABLE Services(	
    ServiceName VARCHAR(10),
    ServicePrice DECIMAL(10, 2)
);

CREATE TABLE Payments(	
    ClientsID INT PRIMARY KEY,
    PaidTo DATE,
    TotalSum  DECIMAL(10, 2)
);

CREATE TABLE EventsForLux(
    Eventname VARCHAR(10),
    EventTimeFrom TIME,
    EventTimeTo TIME 
);
CREATE TABLE FeaturesForPremium(
    Feature VARCHAR(10),
    AdditionalCosts DECIMAL(10, 2)
);

