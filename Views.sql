CREATE VIEW Clients_names AS
SELECT Clients.FirstName, Clients.LastName
FROM Clients;

CREATE VIEW Rooms_general AS
SELECT RoomNum, FloorNum, IsFree
FROM Rooms
JOIN RoomOccupancy
ON Rooms.RoomNum = RoomOccupancy.RoomNum;

CREATE VIEW Employees_general AS
SELECT FirstName, LastName, CurrentPosition
FROM Employees
JOIN EmployeeDetails
ON EmployeeDetails.EmployeeID = Employees.EmployeeID;

CREATE VIEW Payments_general AS
SELECT FirstName, LastName, TotalSum
FROM Clients
JOIN Payments
ON Payments.ClientsID = Clients.ClientsID;

CREATE VIEW VIP_view AS
SELECT FirstName, LastName
FROM Clients
JOIN ClientStatus
ON ClientStatus.ClientsStatusID = Clients.ClientsID
WHERE StatusVIP = 'VIP';

CREATE VIEW Employees_salary AS
SELECT FirstName, LastName, Salary
FROM Employees
JOIN EmployeeDetails
ON EmployeeDetails.EmployeeID = Employees.EmployeeID;

CREATE VIEW All_dishes AS
SELECT DishName
FROM Menu;
