ALTER TABLE ClientStatus
ADD CONSTRAINT fk_status_cl
FOREIGN KEY (ClientsStatusID) REFERENCES Clients(ClientsID);

ALTER TABLE EmployeeDetails
ADD CONSTRAINT fk_employee
FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID);

ALTER TABLE WorkerSchedule
ADD CONSTRAINT fk_schedule
FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID);

ALTER TABLE RoomOccupancy
ADD CONSTRAINT fk_occopancy
FOREIGN KEY (ClientsID) REFERENCES Clients(ClientsID);

ALTER TABLE Booking
ADD CONSTRAINT fk_rooms
FOREIGN KEY (BookingID) REFERENCES Rooms(RoomID);

ALTER TABLE Reports
ADD CONSTRAINT fk_reports
FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID);

ALTER TABLE Payments
ADD CONSTRAINT fk_payment
FOREIGN KEY (ClientsID) REFERENCES Clients(ClientsID);
