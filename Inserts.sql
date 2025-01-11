ALTER TABLE Services ALTER COLUMN ServiceName NVARCHAR(50);
ALTER TABLE FeaturesForPremium ALTER COLUMN Feature NVARCHAR(50);


iNSERT INTO Clients (FirstName, LastName)
VALUES ('John', 'Doe'),
       ('Jane', 'Smith'),
       ('Alice', 'Brown'),
       ('Max', 'Ostapiak'),
       ('Mukola', 'Gavrulo'),
       ('Muroslav', 'Puvovar'),
       ('Ivan', 'Kruvui'),
       ('Olena', 'Koval'),
       ('Oleg', 'Prime'),
       ('Mstuslav', 'Kravchuk'),
       ('Stanislav', 'Grucak'),
       ('Lina', 'Ciklevuch'),
       ('Volodumur', 'Kravec'),
       ('Ivan', 'Podolak'),
       ('Andrii', 'Mukolenko'),
       ('Vasul', 'Siromaha'),
       ('Marina', 'Plenuk'),
       ('Serhui', 'Tymoshenko'),
       ('Viktor', 'Petrovuch'),
       ('Oleksii', 'Zelenui'),
       ('Anton', 'Tumofii'),
       ('Serhii', 'Murcak');
INSERT INTO ClientStatus (ClientsStatusID)
VALUES ('VIP'),
       ('Regular'),
       ('New'),
       ('Regular'),
       ('Regular'),
       ('Regular'),
       ('VIP'),
       ('Regular'),
       ('New'),
       ('Regular'),
       ('New'),
       ('Regular'),
       ('VIP'),
       ('Regular'),
       ('Regular'),
       ('New'),
       ('Regular'),
       ('VIP'),
       ('Regular'),
       ('New'),
       ('Regular'),
       ('New');
INSERT INTO Employees (FirstName, LastName)
VALUES ('Mukuta', 'Kozach'),
       ('Muron', 'Davis'),
       ('Davud', 'Rutnuk'),
       ('Mukola','Arsenovuch'),
       ('Ulia','Polyakov'),
       ('Maria','Ivanova'),
       ('Mark','Koval'),
       ('Petro','Aresuk'),
       ('Roman','Plenuk')
       ;
INSERT INTO EmployeeDetails  (EmployeeID, WorkingHoursAtWeek, Salary, CurrentPosition, JoinedOn)
VALUES (1,45, 100000.00, 'Manager', '2023-01-01'),
       (2,35, 50000.00, 'Receptionist', '2023-02-01'),
       (3,35, 50000.00, 'Receptionist', '2023-03-05'),
       (4,35, 40000.00, 'Waiter', '2024-12-09'),
       (5,40, 50000.00, 'Waiter', '2022-03-10'),
       (6,40, 45000.00, 'Cleaner', '2023-12-11'),
       (7,40, 45000.00, 'Cleaner', '2021-02-16'),
       (8,30, 60000.00, 'Chef', '2024-11-11'),
       (9,30, 60000.00, 'Chef', '2023-08-28');

INSERT INTO WorkerSchedule (EmployeeID,FromDay, ToDay, StartTime, EndTime)
VALUES (1,'Monday', 'Friday', '09:00', '17:00'),
       (2,'Tuesday', 'Saturday', '10:00', '18:00'),
       (3,'Wednesday', 'Sunday', '08:00', '16:00'),
       (4,'Monday', 'Friday', '09:00', '17:00'),
       (5,'Tuesday', 'Saturday', '10:00', '18:00'),
       (6,'Wednesday', 'Sunday', '08:00', '16:00'),
       (7,'Monday', 'Friday', '09:00', '17:00'),
       (8,'Tuesday', 'Saturday', '10:00', '18:00'),
       (9,'Wednesday', 'Sunday', '08:00', '16:00');

INSERT INTO ChefDetails (FirstName, LastName, KitchenPosition)
VALUES ('Roman','Plenuk', 'Head Chef'),
       ('Petro','Aresuk', 'Sous Chef');

INSERT INTO Menu (MenuID, DishName, DishCost)
VALUES (1,'Juice',20.00),
       (2,'Tea', 40.00 ),
       (3,'Beer', 50.00)
       (4,'Pizza',130.00)
       (5,'Muffin', 30.00)
       (6,'Croissant', 25.00)
       (7,'Fries', 60.00)
       (8,'Coffee', 40.00);

INSERT INTO Rooms (RoomNum, FloorNum, MaxAmount, Status, RoomPrice)
VALUES (1, 1, 2, 'Occupied', 4000.00),
       (2, 1, 3, 'Occupied', 5500.00),
       (3, 1, 1, 'Occupied', 2500.00),
       (4, 1, 1, 'Occupied', 2500.00),
       (5, 1, 3, 'Occupied', 5500.00),
       (6, 1, 1, 'Occupied', 2500.00),
       (7, 1, 2, 'Occupied', 4000.00),
       (8, 1, 3, 'Occupied', 5500.00),
       (9, 1, 1, 'Occupied', 2500.00),
       (10, 2, 2, 'Occupied', 4000.00),
       (11, 2, 1, 'Occupied', 2500.00),
       (12, 2, 1, 'Occupied', 2500.00),
       (13, 2, 2, 'Occupied', 4000.00),
       (14, 2, 3, 'Occupied', 5500.00),
       (15, 2, 1, 'Occupied', 2500.00),
       (16, 2, 1, 'Occupied', 2500.00),
       (17, 2, 3, 'Occupied', 5500.00),
       (18, 2, 1, 'Occupied', 2500.00),
       (19, 2, 2, 'Occupied', 4000.00),
       (20, 3, 3, 'Occupied', 5500.00),
       (21, 3, 1, 'Occupied', 2500.00),
       (22, 3, 1, 'Occupied', 2500.00),
       (23, 3, 3, 'Available',5500.00),
       (24, 3, 1, 'Available', 2500.00),
       (25, 3, 1, 'Available', 2500.00),
       (26, 3, 1, 'Available', 2500.00),
       (27, 3, 1, 'Available', 2500.00),
       (28, 3, 1, 'Available', 2500.00),
       (29, 3, 1, 'Available', 2500.00),
       (30, 3, 1, 'Available', 2500.00);

INSERT INTO RoomOccupancy (ClientsID, RoomNum, InUseUntil, IsFree)
VALUES (1, 1, '2023-12-31', 0),
       (2, 2, '2025-02-28', 0),
       (3, 3, '2024-01-25', 0),
       (4, 4, '2023-09-15', 0),
       (5, 5, '2023-03-24', 0),
       (6, 6, '2023-06-01', 0),
       (7, 7'2023-05-05', 0),
       (8, 8'2023-01-03', 0),
       (9, 9'2023-05-09', 0),
       (10, 10'2023-09-10', 0),
       (11, 11'2023-06-10', 0),
       (12, 12'2023-12-07', 0),
       (13, 13'2023-11-30', 0),
       (14, 14'2023-07-03', 0),
       (15, 15'2023-05-16', 0),
       (16, 16'2023-01-23', 0),
       (17, 17'2023-04-02', 0),
       (18, 18'2023-04-26', 0),
       (19, 19'2023-12-12', 0),
       (20, 20'2023-10-05', 0),
       (21, 21, '2023-02-14', 0),
       (22, 22, '2023-01-26', 0);

INSERT INTO Booking (BookingID, FromDate, UntilDate)
VALUES (30, '2024-12-01', '2023-12-10'),
       (29, '2024-12-05', '2023-12-15'),
       (28, '2024-12-10', '2023-12-20'),
       (24, '2024-02-11', '2024-12-31');

INSERT INTO Reports (ReportAsk, RoomID)
VALUES ('Maintenance required', 12),
       ('Cleaning overdue', 12),
       ('Upgrade request' , 20);

INSERT INTO Services (ServiceName, ServicePrice)
VALUES ('Laundry', 20.00),
       ('Room Service', 50.00),
       ('Spa', 100.00);

INSERT INTO Payments (ClientsID, PaidTo, TotalSum)
VALUES (5,'2023-12-31', 20000),
       (6,'2025-02-28', 40000),
       (7,'2024-01-25', 30000),
       (8,'2023-09-15', 23000),
       (9,'2023-03-24', 22000),
       (10,'2023-06-01', 20000),
       (11,'2023-05-05', 20000),
       (12,'2023-01-03', 25000),
       (13,'2023-05-09', 26000),
       (14,'2023-09-10', 27000),
       (15,'2023-06-10', 31000),
       (16,'2023-12-07', 25000),
       (17,'2023-11-30', 25000),
       (18,'2023-07-03', 30000),
       (19,'2023-05-16', 21000),
       (20,'2023-01-23', 28000),
       (21,'2023-04-02', 26000),
       (22,'2023-04-26', 26000),
       (23,'2023-12-12', 30000),
       (24,'2023-10-05', 10000),
       (25,'2023-02-14', 20000),
       (26,'2023-01-26', 25000);

INSERT INTO Events (Eventname, EventTimeFrom, EventTimeTo, EventDate)
VALUES ('Concert', '19:00', '22:00', '2025-10-13'),
       ('Dinner', '20:00', '23:00', '2025-11-12'),
       ('Excursion', '08:00', '10:00', '2025-12-01'),
       ('Meeting', '15:00', '17:00', '2025-12-02');
       
INSERT INTO FeaturesForPremium (Feature, AdditionalCosts)
VALUES ('Swiss table', 100.00),
       ('Pub', 200.00),
       ('Computer', 400.00),
       ('Breakfast in room', 50.00),
       ('Beach', 100.00),
       ('Pool', 200.00);