create view Marketing.EmailList AS
select CustomerId, FirstName, LastName, Email, OptIn
from Booking.Customers
where OptIn = 1