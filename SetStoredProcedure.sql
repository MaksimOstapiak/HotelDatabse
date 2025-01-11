--створення процедури
CREATE OR ALTER PROCEDURE dbo.sp_SetClient
@ClientsID INT = NULL,
@FirstName NVARCHAR(50) = NULL,
@LastName NVARCHAR(50) = NULL

AS
BEGIN
IF @ClientsID IS NULL AND @FirstName IS NULL
BEGIN
    PRINT 'Invalid value of @FirstName'
    RETURN
END
BEGIN TRY
    IF @ClientsID  IS NULL
    BEGIN
        INSERT dbo.Clients( FirstName, LastName, RoomID)
        VALUES( @FirstName, @LastName, @RoomID)
    END
    ELSE
        UPDATE TOP(1) dbo.Clients
        SET FirstName   = ISNULL(@FirstName,    FirstName),    
            LastName     = ISNULL(@LastName,     LastName),
        WHERE ClientsID = @ClientsID
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

--виклик процедури
EXEC dbo.sp_SetClient
@FirstName = 'Artur',
@LastName = 'Pukalo';

--створення процедури
CREATE OR ALTER PROCEDURE dbo.sp_SetClientStatus
@ClientsID INT = NULL,
@StatusVIP NVARCHAR(50) = NULL

AS
BEGIN
IF @ClientsID IS NULL AND @StatusVIP IS NULL
BEGIN
    PRINT 'Invalid value of @StatusVIP'
    RETURN
END
BEGIN TRY
    IF @ClientsID  IS NULL
    BEGIN
        INSERT dbo.ClientStatus(StatusVIP)
        VALUES(@StatusVIP)
    END
    ELSE
        UPDATE TOP(1) dbo.ClientStatus
        SET StatusVIP   = ISNULL(@StatusVIP,    StatusVIP)
        WHERE ClientsStatusID = @ClientsID
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

--виклик процедури
EXEC dbo.sp_SetClientStatus
@StatusVIP = 'NEW';

--створення процедури
CREATE OR ALTER PROCEDURE dbo.sp_SetEmployee
@EmployeeID INT = NULL,
@FirstName NVARCHAR(50) = NULL,
@LastName NVARCHAR(50) = NULL

AS
BEGIN
IF @EmployeeID IS NULL AND @FirstName IS NULL
BEGIN
    PRINT 'Invalid value of @FirstName'
    RETURN
END
BEGIN TRY
    IF @EmployeeID  IS NULL
    BEGIN
        INSERT dbo.Employees( FirstName, LastName)
        VALUES( @FirstName, @LastName)
    END
    ELSE
        UPDATE TOP(1) dbo.Employees
        SET FirstName   = ISNULL(@FirstName,    FirstName),    
            LastName     = ISNULL(@LastName,     LastName)
        WHERE EmployeeID = @EmployeeID
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

--виклик процедури
EXEC dbo.sp_SetEmployee
@FirstName = 'Andriy',
@LastName = 'Mukolenko';

--створення процедури
CREATE OR ALTER PROCEDURE dbo.sp_SetEmployeeDetails
@EmployeeID INT = NULL OUTPUT,
@WorkingHoursAtWeek INT = NULL,
@Salary DECIMAL(10, 2) = NULL,
@CurrentPosition VARCHAR(50) = NULL,
@JoinedOn DATE = NULL

AS
BEGIN
IF @EmployeeID IS NULL AND @CurrentPosition IS NULL
BEGIN
    PRINT 'Invalid value of @CurrentPosition'
    RETURN
END
BEGIN TRY
    IF @EmployeeID  IS NULL
    BEGIN
        SET @EmployeeID= 1 + (SELECT TOP(1) EmployeeID FROM dbo.EmployeeDetails ORDER BY EmployeeID DESC)
        INSERT dbo.EmployeeDetails(EmployeeID, WorkingHoursAtWeek, Salary, CurrentPosition, JoinedOn)
        VALUES(@EmployeeID, @WorkingHoursAtWeek, @Salary, @CurrentPosition, @JoinedOn)
    END
    ELSE
        UPDATE TOP(1) dbo.EmployeeDetails
        SET WorkingHoursAtWeek   = ISNULL(@WorkingHoursAtWeek,    WorkingHoursAtWeek),    
            Salary     = ISNULL(@Salary,     Salary),
            CurrentPosition     = ISNULL(@CurrentPosition,     CurrentPosition),
            JoinedOn     = ISNULL(@JoinedOn,     JoinedOn)
        WHERE EmployeeID = @EmployeeID
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

--виклик процедури
EXEC dbo.sp_SetEmployeeDetails
@WorkingHoursAtWeek = 20,
@Salary= 10000.00,
@CurrentPosition = 'Guard',
@JoinedOn = '2024-12-15';

--створення процедури
CREATE OR ALTER PROCEDURE dbo.sp_Schedule
    @FromDay VARCHAR(10) = NULL,
    @ToDay VARCHAR(10) = NULL,
    @StartTime TIME = NULL,
    @EndTime TIME = NULL,
    @EmployeeID INT  = NULL OUTPUT

AS
BEGIN
IF @EmployeeID IS NULL AND @FromDay IS NULL
BEGIN
    PRINT 'Invalid value of @FirstName'
    RETURN
END
BEGIN TRY
    IF @EmployeeID  IS NULL
    BEGIN
        SET @EmployeeID= 1 + (SELECT TOP(1) EmployeeID FROM dbo.WorkerSchedule ORDER BY EmployeeID DESC)
        INSERT dbo.WorkerSchedule( FromDay, ToDay, StartTime, EndTime, EmployeeID)
        VALUES( @FromDay, @ToDay, @StartTime, @EndTime, @EmployeeID)
    END
    ELSE
        UPDATE TOP(1) dbo.WorkerSchedule
        SET FromDay   = ISNULL(@FromDay,    FromDay),    
            ToDay     = ISNULL(@ToDay,     ToDay),
            StartTime    = ISNULL(@StartTime ,    StartTime ),
            EndTime   = ISNULL(@EndTime ,    EndTime )
        WHERE EmployeeID = @EmployeeID
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

--виклик процедури
EXEC dbo.sp_Schedule
    @FromDay = 'Saturday',
    @ToDay  = 'Sunday',
    @StartTime = '09:00',
    @EndTime = '23:00';

--створення процедури
CREATE OR ALTER PROCEDURE dbo.sp_SetChef
@ChefID INT = NULL,
@FirstName NVARCHAR(50) = NULL,
@LastName NVARCHAR(50) = NULL,
@KitchenPosition VARCHAR(50) = NULL

AS
BEGIN
IF @ChefID IS NULL AND @FirstName IS NULL
BEGIN
    PRINT 'Invalid value of @FirstName'
    RETURN
END
BEGIN TRY
    IF @ChefID  IS NULL
    BEGIN
        INSERT dbo.ChefDetails( FirstName, LastName, KitchenPosition)
        VALUES( @FirstName, @LastName, @KitchenPosition)
    END
    ELSE
        UPDATE TOP(1) dbo.ChefDetails
        SET FirstName   = ISNULL(@FirstName,    FirstName),    
            LastName     = ISNULL(@LastName,     LastName),
            KitchenPosition    = ISNULL(@KitchenPosition ,    KitchenPosition )
        WHERE ChefID = @ChefID
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

--виклик процедури
EXEC dbo.sp_SetChef
@FirstName = 'Cunkevuch',
@LastName = 'Mukola',
@KitchenPosition = 'Soup chef';

--створення процедури
CREATE OR ALTER PROCEDURE dbo.sp_SetMenu
    @MenuID INT = NULL OUTPUT,
    @DishName VARCHAR(50) = NULL,
    @DishCost VARCHAR(50) = NULL

AS
BEGIN
IF @MenuID IS NULL AND @DishName IS NULL
BEGIN
    PRINT 'Invalid value of @DishName'
    RETURN
END
BEGIN TRY
    IF @MenuID  IS NULL
    BEGIN
        SET @MenuID= 1 + (SELECT TOP(1) MenuID FROM dbo.Menu ORDER BY MenuID DESC)
        INSERT dbo.Menu(MenuID, DishName, DishCost)
        VALUES(@MenuID, @DishName, @DishCost)
    END
    ELSE
        UPDATE TOP(1) dbo.Menu
        SET DishCost   = ISNULL(@DishCost,    @DishCost),    
            DishName   = ISNULL(@DishName ,    @DishName )
        WHERE MenuID = @MenuID
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

--виклик процедури
EXEC dbo.sp_SetMenu
    @DishName = 'Uzvar',
    @DishCost = '20.50';

--створення процедури
CREATE OR ALTER PROCEDURE dbo.sp_SetRoom
@RoomID INT = NULL,
@RoomNum INT = NULL,
@FloorNum INT = NULL,
@MaxAmount INT = NULL,
@Status VARCHAR(20) = NULL

AS
BEGIN
IF @RoomID IS NULL AND @RoomNum  IS NULL
BEGIN
    PRINT 'Invalid value of @RoomNum '
    RETURN
END
BEGIN TRY
    IF @RoomID  IS NULL
    BEGIN
        INSERT dbo.Rooms( RoomNum, FloorNum, MaxAmount, Status)
        VALUES( @RoomNum, @FloorNum, @MaxAmount, @Status)
    END
    ELSE
        UPDATE TOP(1) dbo.Rooms
        SET RoomNum   = ISNULL(@RoomNum,    RoomNum),    
            FloorNum     = ISNULL(@FloorNum,     FloorNum),
            MaxAmount    = ISNULL(@MaxAmount ,    MaxAmount ),
            Status    = ISNULL(@Status ,    Status )
        WHERE RoomID = @RoomID
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

--виклик процедури
EXEC dbo.sp_SetRoom
@RoomNum = 31,
@FloorNum = 3,
@MaxAmount = 1,
@Status = 'Avaible';

--створення процедури
CREATE OR ALTER PROCEDURE dbo.sp_SetRoomOcupancy
    @ClientsID INT = NULL OUTPUT,
    @InUseUntil DATE = NULL,
    @IsFree BIT = NULL,
    @RoomNum INT = NULL

AS
BEGIN
IF @ClientsID IS NULL AND @RoomNum IS NULL
BEGIN
    PRINT 'Invalid value of @RoomNum and @ClientsID'
    RETURN
END
BEGIN TRY
    IF @ClientsID  IS NULL
    BEGIN
        SET @ClientsID= 1 + (SELECT TOP(1) ClientsID FROM dbo.RoomOccupancy ORDER BY ClientsID DESC)
        INSERT dbo.RoomOccupancy(ClientsID, RoomNum, InUseUntil, IsFree )
        VALUES(@ClientsID ,@RoomNum, @InUseUntil, @IsFree)
    END
    ELSE
        UPDATE TOP(1) dbo.RoomOccupancy
        SET InUseUntil   = ISNULL(@InUseUntil,    InUseUntil),    
            IsFree     = ISNULL(@IsFree,     IsFree),
            RoomNum     = ISNULL(@RoomNum,     RoomNum)
        WHERE ClientsID = @ClientsID
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

--виклик процедури
EXEC dbo.sp_SetRoomOcupancy
    @ClientsID = 27,
    @InUseUntil  = '2025-02-01',
    @RoomNum  = 21,
    @IsFree = 0;

--створення процедури
CREATE OR ALTER PROCEDURE dbo.sp_SetBooking
    @BookingID INT = NULL,
    @FromDate DATE = NULL,
    @UntilDate DATE = NULL

AS
BEGIN
IF @BookingID IS NULL AND @FirstName IS NULL
BEGIN
    PRINT 'Invalid value of @FirstName'
    RETURN
END
BEGIN TRY
    IF @BookingID  IS NULL
    BEGIN
        SET @BookingID= 1 + (SELECT TOP(1) BookingID FROM dbo.Booking ORDER BY BookingID DESC)
        INSERT dbo.Booking(BookingID, FirstName, LastName, FromDate, UntilDate)
        VALUES(@BookingID, @FirstName, @LastName, @FromDate, @UntilDate)
    END
    ELSE
        UPDATE TOP(1) dbo.Booking
        SET FromDate  = ISNULL(@FromDate,    FromDate),    
            UntilDate     = ISNULL(@UntilDate,     UntilDate)
        WHERE BookingID = @BookingID
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

--виклик процедури
EXEC dbo.sp_SetBooking
    @FromDate = '2024-11-01',
    @UntilDate = '2025-12-01';

--створення процедури
CREATE OR ALTER PROCEDURE dbo.sp_SetReport
@RoomID INT = NULL,
@ReportAsk VARCHAR(50) = NULL

AS
BEGIN
IF @RoomID IS NULL OR @ReportAsk  IS NULL
BEGIN
    PRINT 'Invalid value of @RoomID or @ReportAsk '
    RETURN
END
BEGIN TRY
        UPDATE TOP(1) dbo.Reports
        SET ReportAsk   = ISNULL(@ReportAsk,    ReportAsk)
        SET RoomID   = ISNULL(@RoomID,    RoomID)
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

--виклик процедури
EXEC dbo.sp_SetReport
@RoomID = 12,
@ReportAsk = 'No WiFi';

--створення процедури
CREATE OR ALTER PROCEDURE dbo.sp_SetService
@ServiceName VARCHAR(10) = NULL,
@ServicePrice DECIMAL(10, 2) = NULL
AS
BEGIN
IF @ServiceName IS NULL
BEGIN
    PRINT 'Invalid value of @ServiceName '
    RETURN
END
BEGIN TRY
    IF NOT EXISTS (SELECT 1 FROM dbo.Services WHERE ServiceName = @ServiceName)
    BEGIN
        INSERT dbo.Services(ServiceName, ServicePrice)
        VALUES(@ServiceName, @ServicePrice)
    END
    ELSE
        UPDATE TOP(1) dbo.Services
        SET ServicePrice   = ISNULL(@ServicePrice,    ServicePrice)
        WHERE ServiceName  = @ServiceName 
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

--виклик процедури
EXEC dbo.sp_SetService
@ServiceName = 'Football',
@ServicePrice = 20.00;

--створення процедури
CREATE OR ALTER PROCEDURE dbo.sp_SetPayments
    @ClientsID INT = NULL OUTPUT,
    @PaidTo DATE = NULL,
    @TotalSum  DECIMAL(10, 2) = NULL

AS
BEGIN
IF @ClientsID IS NULL OR @TotalSum IS NULL
BEGIN
    PRINT 'Invalid value of @TotalSum'
    RETURN
END
BEGIN TRY
    IF NOT EXISTS (SELECT 1 FROM dbo.Payments WHERE ClientsID = @ClientsID)
    BEGIN
        INSERT dbo.Payments(ClientsID, PaidTo, TotalSum)
        VALUES(@ClientsID, @PaidTo, @TotalSum)
    END
    ELSE
        UPDATE TOP(1) dbo.Payments
        SET PaidTo   = ISNULL(@PaidTo,    PaidTo),    
            TotalSum     = ISNULL(@TotalSum,     TotalSum)
        WHERE ClientsID = @ClientsID
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

--виклик процедури
EXEC dbo.sp_SetPayments
@ClientsID = 54,
@PaidTo = '2023-11-11',
@TotalSum  = 53000.00;

--створення процедури
CREATE OR ALTER PROCEDURE dbo.sp_SetEvent
    @Eventname VARCHAR(10) = NULL,
    @EventTimeFrom TIME = NULL,
    @EventTimeTo TIME = NULL,
    @EventDate DATE = NULL  
AS
BEGIN
IF @Eventname IS NULL
BEGIN
    PRINT 'Invalid value of @Eventname '
    RETURN
END
BEGIN TRY
    IF NOT EXISTS (SELECT 1 FROM dbo.Events WHERE Eventname = @Eventname)
    BEGIN
        INSERT dbo.Events(Eventname, EventTimeFrom, EventTimeTo, EventDate)
        VALUES(@Eventname, @EventTimeFrom, @EventTimeTo, @EventDate)
    END
    ELSE
        UPDATE TOP(1) dbo.Events
        SET EventTimeFrom   = ISNULL(@EventTimeFrom,    EventTimeFrom),
            EventTimeTo   = ISNULL(@EventTimeTo,    EventTimeTo),
            EventDate   = ISNULL(@EventDate,    EventDate)
        WHERE Eventname  = @Eventname 
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

--виклик процедури
EXEC dbo.sp_SetEvent
    @Eventname = 'Chess',
    @EventTimeFrom = '16:00',
    @EventTimeTo = '18:00',
    @EventDate = '2025-02-01';

--створення процедури
CREATE OR ALTER PROCEDURE dbo.sp_SetFeature
    @Feature VARCHAR(10) = NULL,
    @AdditionalCosts DECIMAL(10, 2) = NULL
AS
BEGIN
IF @Feature IS NULL
BEGIN
    PRINT 'Invalid value of @Feature '
    RETURN
END
BEGIN TRY
    IF NOT EXISTS (SELECT 1 FROM dbo.FeaturesForPremium WHERE Feature = @Feature)
    BEGIN
        INSERT dbo.FeaturesForPremium(Feature, AdditionalCosts)
        VALUES(@Feature, @AdditionalCosts)
    END
    ELSE
        UPDATE TOP(1) dbo.FeaturesForPremium
        SET AdditionalCosts   = ISNULL(@AdditionalCosts,    AdditionalCosts)
        WHERE Feature  = @Feature 
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

--виклик процедури
EXEC dbo.sp_SetFeature
    @Feature = 'tea',
    @AdditionalCosts = 10.0;