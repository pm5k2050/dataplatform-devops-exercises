CREATE FUNCTION LostAndFound.CalculateShipping(@HotelState VARCHAR(2),@ShippingState VARCHAR(2))
RETURNS INT
AS
BEGIN
	IF (@HotelState = @ShippingState)
		return 10
	return 25
END