--This view displays all the menu items along with their category and price information.
CREATE VIEW MenuItemsView AS
SELECT DishID, DishName, Description, Ingredients, Price, Currency, Category
FROM MenuItems;

--This view provides detailed information about each order, including the dish, table number, waiter name, and status.
CREATE VIEW OrderInformationView AS
SELECT o.OrderID, o.DishID, m.DishName, o.TableNumber, o.WaiterName, o.OrderDateTime, o.Status
FROM OrderInformation o
INNER JOIN MenuItems m
ON o.DishID = m.DishID;

--This view shows customer information along with their respective order details and reservation status.
CREATE VIEW CustomerInformationView AS
SELECT c.CustomerID, c.CustomerName, c.ContactNumber, c.EmailAdress, o.OrderID, o.TableNumber, o.WaiterName, o.Status, c.ReservationStatus
FROM CustomerInformation c
INNER JOIN OrderInformation o ON c.OrderID = o.OrderID;

--This view displays information about the staff members, including their roles, schedules, and salary information.
CREATE VIEW StaffInformationView AS
SELECT s.StaffID, s.WaiterName, s.Role, s.Schedule, s.SalaryInformation
FROM StaffInformation s;

--This view provides details about the sales, including the sales date, total sales amount, and currency.
CREATE VIEW SalesInformationView AS
SELECT SalesID, SalesDate, TotalSales, Currency
FROM SalesInformation;

