CREATE OR ALTER PROCEDURE dbo.sp_NewRoomOrder
@ClientsIDInput INT = NULL,
@FirstNameInput NVARCHAR(50) = NULL,
@LastNameInput NVARCHAR(50) = NULL,
@StatusVIP1Input NVARCHAR(50) = NULL OUTPUT,
@InUseMonthsInput INT = NULL,
@InUseUntiInput DATE = NULL,
@RoomIDInput INT = NULL,
@PaidToInput DATE = NULL
AS
BEGIN
IF @FirstNameInput IS NULL AND @RoomIDInput IS NULL
BEGIN
    PRINT 'Invalid value of @FirstNameInput OR @RoomIDInput'
    RETURN
END
BEGIN TRY

SELECT @RoomNumIn = RoomNum FROM Rooms WHERE RoomID = @RoomIDInput;
SELECT @TotalSumIn  = @InUseMonthsInput * RoomPrice FROM Rooms WHERE RoomID = @RoomIDInput;

DECLARE @LastClientsID INT;
SELECT TOP 1 @LastClientsID = ClientsID 
FROM dbo.Clients 
ORDER BY ClientsID DESC;

EXEC dbo.sp_SetClient
@FirstName = @FirstNameInput,
@LastName = @LastNameInput;

EXEC dbo.sp_SetClientStatus
@StatusVIP = @StatusVIP1Input;

EXEC dbo.sp_SetRoom
@RoomID = @RoomIDInput,
@Status = 'Occupied';

EXEC dbo.sp_SetRoomOcupancy
@RoomNum = @RoomNumIn,
@InUseUntil  = @InUseUntiInput,
@IsFree = 0;


EXEC dbo.sp_SetPayments
@ClientsID = @LastClientsID,
@PaidTo = @PaidToInput,
@TotalSum  = @TotalSumIn;

END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

CREATE OR ALTER PROCEDURE dbo.sp_NewEmployee
    @FromDayInput VARCHAR(10) = NULL,
    @ToDayInput VARCHAR(10) = NULL,
    @StartTimeInput TIME = NULL,
    @EndTimeInput TIME = NULL,
    @WorkingHoursAtWeekInput INT = NULL,
    @SalaryInput DECIMAL(10, 2) = NULL,
    @CurrentPositionInput VARCHAR(50) = NULL,
    @JoinedOnInput DATE = NULL OUTPUT,
    @FirstNameInput NVARCHAR(50) = NULL,
    @LastNameInput NVARCHAR(50) = NULL
AS
BEGIN
IF @FirstNameInput IS NULL AND @CurrentPositionInput IS NULL
BEGIN
    PRINT 'Invalid value of @FirstNameInput OR @CurrentPositionInput'
    RETURN
END
BEGIN TRY
SET @JoinedOnInput = CAST(GETDATE() AS DATE);

EXEC dbo.sp_SetEmployee
@FirstName = @FirstNameInput,
@LastName = @LastNameInput;

EXEC dbo.sp_SetEmployeeDetails
@WorkingHoursAtWeek = @WorkingHoursAtWeekInput,
@Salary= @SalaryInput,
@CurrentPosition = @CurrentPositionInput,
@JoinedOn = @JoinedOnInput;

EXEC dbo.sp_Schedule
    @FromDay = @FromDayInput,
    @ToDay  = @ToDayInput,
    @StartTime = @StartTimeInput,
    @EndTime = @EndTimeInput;

END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END