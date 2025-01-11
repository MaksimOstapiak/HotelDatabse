SELECT Rooms.RoomID, Rooms.RoomNum, Rooms.FloorNum
FROM Rooms
JOIN RoomOccupancy
ON Rooms.RoomID = RoomOccupancy.RoomID
WHERE RoomOccupancy.IsFree > 0;

SELECT DishName, DishCost
FROM Menu
WHERE DishCost < 100.0;

SELECT Feature
FROM FeaturesForPremium
WHERE AdditionalCosts < 200;

SELECT Eventname, EventDate
FROM Events
WHERE EventTimeFrom < '20:00' AND EventTimeFrom > '10:00';

SELECT FirstName, LastName, CurrentPosition
FROM Employees
JOIN WorkerSchedule
ON WorkerSchedule.EmployeeID = Employees.EmployeeID
JOIN EmployeeDetails
ON EmployeeDetails.EmployeeID = Employees.EmployeeID
WHERE ToDay = 'Friday';

SELECT FirstName, LastName, CurrentPosition
FROM Employees
JOIN EmployeeDetails
ON EmployeeDetails.EmployeeID = Employees.EmployeeID
WHERE Salary < 50000.00;

SELECT FirstName, LastName, ClientsID
FROM Clients
JOIN ClientStatus
ON ClientStatus.ClientsStatusID = Clients.ClientsID
WHERE StatusVIP = 'VIP';

SELECT FirstName, LastName, TotalSum
FROM Clients
JOIN Payments
ON Payments.ClientsID = Clients.ClientsID
WHERE TotalSum > 30000;

SELECT ServiceName, ServicePrice
FROM Services
WHERE ServicePrice > 20;

SELECT RoomNum, FloorNum
FROM Rooms
JOIN Booking
ON Booking.BookingID = Rooms.RoomID;

SELECT FirstName, LastName
FROM Employees
JOIN EmployeeDetails
ON EmployeeDetails.EmployeeID = Employees.EmployeeID
WHERE CurrentPosition = 'Receptionist';

SELECT FirstName, LastName
FROM Employees
JOIN EmployeeDetails
ON EmployeeDetails.EmployeeID = Employees.EmployeeID
WHERE JoinedOn > '2022-01-01' AND JoinedOn < '2022-12-31';