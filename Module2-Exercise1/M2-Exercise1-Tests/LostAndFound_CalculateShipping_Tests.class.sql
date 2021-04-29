EXEC tSQLt.NewTestClass 'LostAndFound_CalculateShipping_Tests';
GO

CREATE PROCEDURE LostAndFound_CalculateShipping_Tests.[test when shipping and hotel state are the same]
AS
BEGIN
	DECLARE @ExpectedShippingCost INT;
	DECLARE @ActualShippingCost INT;

	SELECT @ActualShippingCost = (LostAndFound.CalculateShipping('AL','AL'));

	SET @ExpectedShippingCost = 10;

	EXEC tSQLt.AssertEquals @ExpectedShippingCost, @ActualShippingCost;
END
GO

CREATE PROCEDURE LostAndFound_CalculateShipping_Tests.[test when shipping and hotel state are diff]
AS
BEGIN
	DECLARE @ExpectedShippingCost INT;
	DECLARE @ActualShippingCost INT;

	SELECT @ActualShippingCost = (LostAndFound.CalculateShipping('AL','CA'));

	SET @ExpectedShippingCost = 25;

	EXEC tSQLt.AssertEquals @ExpectedShippingCost, @ActualShippingCost;
END
GO