CREATE OR ALTER PROCEDURE dbo.sp_GetClient
 @ClientsID INT = NULL,
 @Name NVARCHAR(50) = NULL,
 @PageSize INT = 20,
 @PageNumber INT = 1,
 @SortColumn VARCHAR(128) = 'ClientsID',
 @SortDirection BIT = 0
AS
IF @ClientsID IS NOT NULL
AND    NOT EXISTS(SELECT *
    FROM dbo.Clients
    WHERE ClientsID = @ClientsID)
BEGIN
    PRINT 'Incorrect value of @ClientsID'
    RETURN
END

SELECT *
,'          '+CAST(ClientsID AS NVARCHAR(50))
FROM dbo.Clients
WHERE ClientsID = @ClientsID
OR @ClientsID IS NULL
AND (LastName LIKE @Name +'%'
 OR    FirstName LIKE @Name +'%'
 OR @Name IS NULL)
ORDER BY
CASE
WHEN @SortDirection = 0 THEN
    CASE @SortColumn
        WHEN 'ClientsID' THEN RIGHT('          '+CAST(ClientsID AS NVARCHAR(50)), 10)
        WHEN 'LastName'            THEN LastName
        WHEN 'FirstName'            THEN FirstName   
    END
END ASC,
CASE
WHEN @SortDirection = 1 THEN
    CASE @SortColumn
        WHEN 'ClientsID' THEN RIGHT('          '+CAST(ClientsID AS NVARCHAR(50)), 10)
        WHEN 'LastName'            THEN LastName
        WHEN 'FirstName'            THEN FirstName    
    END
END DESC
OFFSET (@PageNumber - 1) * @PageSize ROWS  
FETCH NEXT @PageSize ROWS ONLY;

-- звернення до процедури, сортування за колонкою FirstName за спаданням
EXEC dbo.sp_GetClient
@SortDirection = 1,
@SortColumn = 'FirstName';

CREATE OR ALTER PROCEDURE dbo.sp_GetEmployee
 @EmployeeID INT = NULL,
 @CurrentPosition NVARCHAR(50) = NULL,
 @PageSize INT = 20,
 @PageNumber INT = 1,
 @SortColumn VARCHAR(128) = 'BusinessEntityID',
 @SortDirection BIT = 0
AS
IF @EmployeeID IS NOT NULL
AND    NOT EXISTS(SELECT *
    FROM dbo.EmployeeDetails
    WHERE EmployeeID = @EmployeeID)
BEGIN
    PRINT 'Incorrect value of @BusinessEntityID'
    RETURN
END

SELECT EmployeeDetails.EmployeeID,Employees.FirstName,Employees.LastName,EmployeeDetails.WorkingHoursAtWeek,EmployeeDetails.Salary,
EmployeeDetails.CurrentPosition,EmployeeDetails.JoinedOn
FROM dbo.EmployeeDetails
JOIN dbo.Employees
ON Employees.EmployeeID = EmployeeDetails.EmployeeID
WHERE EmployeeDetails.EmployeeID = @EmployeeID
OR @EmployeeID IS NULL
AND (CurrentPosition LIKE @CurrentPosition +'%'
 OR @CurrentPosition IS NULL)
ORDER BY
CASE
WHEN @SortDirection = 0 THEN
    CASE @SortColumn
        WHEN 'EmployeeID' THEN RIGHT('          '+CAST(EmployeeDetails.EmployeeID AS NVARCHAR(50)), 10)
        WHEN 'Salary'            THEN RIGHT('          '+CAST(Salary AS NVARCHAR(50)), 10)
         WHEN 'WorkingHoursAtWeek'        THEN RIGHT('          '+CAST(WorkingHoursAtWeek AS NVARCHAR(50)), 10)

    END
END ASC,
CASE
WHEN @SortDirection = 1 THEN
    CASE @SortColumn
        WHEN 'EmployeeID' THEN RIGHT('          '+CAST(EmployeeDetails.EmployeeID AS NVARCHAR(50)), 10)
        WHEN 'Salary'            THEN RIGHT('          '+CAST(Salary AS NVARCHAR(50)), 10)
         WHEN 'WorkingHoursAtWeek'        THEN RIGHT('          '+CAST(WorkingHoursAtWeek AS NVARCHAR(50)), 10)    
    END
END DESC
OFFSET (@PageNumber - 1) * @PageSize ROWS  
FETCH NEXT @PageSize ROWS ONLY;

--виклилк сортування за спаданням за колонкою WorkingHoursAtWeek
EXEC dbo.sp_GetEmployee
@SortDirection = 1,
@SortColumn = 'WorkingHoursAtWeek';