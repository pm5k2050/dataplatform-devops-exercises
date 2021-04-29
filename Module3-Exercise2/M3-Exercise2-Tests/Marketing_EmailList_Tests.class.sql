EXEC tSQLt.NewTestClass 'Marketing_EmailList_Tests';
GO

CREATE PROCEDURE Marketing_EmailList_Tests.[test one user opted in]
AS
BEGIN
	EXEC tSQLt.FakeTable 'Booking.Customers';

	INSERT INTO Booking.Customers (CustomerId, FirstName, LastName, Email, OptIn)
						   VALUES (1, 'Srdan', 'Komlenovic','srdan.komlenovic@aimco.ca',1);

	SELECT  CustomerId, FirstName, LastName, Email, OptIn
	INTO #Actual
	FROM Marketing.EmailList

	SELECT
		1 AS CustomerId, 
		'Srdan' AS FirstName, 
		'Komlenovic' AS LastName,
		'srdan.komlenovic@aimco.ca' AS Email,
		1 AS OptIn
	INTO #Expected

	EXEC tSQLt.AssertEqualsTable #Expected, #Actual;
END
GO