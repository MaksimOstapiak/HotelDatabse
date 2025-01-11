CREATE DATABASE HOTEL;
CREATE TABLE Clients (
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    ClientsID INT IDENTITY(1,1) PRIMARY KEY
);
CREATE TABLE ClientStatus (
    ClientsStatusID INT IDENTITY(1,1) PRIMARY KEY,
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
    KitchenPosition VARCHAR(50)
);
CREATE TABLE Menu (
    MenuID INT PRIMARY KEY,
    DishName VARCHAR(20),
    DishCost DECIMAL(10,2)
);
CREATE TABLE Rooms (
    RoomID INT IDENTITY(1,1) PRIMARY KEY,
	RoomNum INT,
    FloorNum INT,
	MaxAmount INT,
	Status VARCHAR(20),
    RoomPrice DECIMAL(10,2)
);

CREATE TABLE RoomOccupancy (	
    ClientsID INT PRIMARY KEY,
    InUseUntil DATE,
    RoomNum INT,
    IsFree BIT
);

CREATE TABLE Booking(
    BookingID INT PRIMARY KEY,
    FromDate DATE,
    UntilDate DATE
);

CREATE TABLE Reports (	
    ReportAsk VARCHAR(50),
    RoomID INT
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

CREATE TABLE Events(
    Eventname VARCHAR(10),
    EventTimeFrom TIME,
    EventTimeTo TIME,
    EventDate DATE 
);
CREATE TABLE FeaturesForPremium(
    Feature VARCHAR(10),
    AdditionalCosts DECIMAL(10, 2)
);

