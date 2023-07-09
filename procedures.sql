--This procedure allows you to insert a new menu item into the MenuItems table.
CREATE PROCEDURE InsertMenuItem
(   @DishID INT,
    @DishName NVARCHAR(100),
    @Description NVARCHAR(100),
    @Ingredients NVARCHAR(200),
    @Price DECIMAL(10, 2),
    @Currency NVARCHAR(10),
    @Category NVARCHAR(50))
AS
BEGIN
    INSERT INTO MenuItems (DishID, DishName, Description, Ingredients, Price, Currency, Category)
    VALUES (@DishID, @DishName, @Description, @Ingredients, @Price, @Currency, @Category)
END

--This procedure allows you to update the status of an order in the OrderInformation table.
CREATE PROCEDURE UpdateOrderStatus
(@OrderID INT, @Status NVARCHAR(50))
AS
BEGIN
    UPDATE OrderInformation
    SET Status = @Status
    WHERE OrderID = @OrderID
END

--This procedure retrieves all the orders made by a specific customer based on their CustomerID.
CREATE PROCEDURE GetCustomerOrders
(@CustomerID INT)
AS
BEGIN
    SELECT o.OrderID, o.DishID, m.DishName, o.TableNumber, o.WaiterName, o.OrderDateTime, o.Status
    FROM OrderInformation o
    INNER JOIN MenuItems m ON o.DishID = m.DishID
    INNER JOIN CustomerInformation c ON c.OrderID = o.OrderID
    WHERE c.CustomerID = @CustomerID
END

--This procedure retrieves the top selling menu items based on their total quantity sold.
CREATE PROCEDURE GetTopSellingItems
AS
BEGIN
    SELECT m.DishID, m.DishName, m.Description, SUM(o.Quantity) AS TotalQuantitySold
    FROM MenuItems m
    INNER JOIN OrderDetails o ON o.DishID = m.DishID
    GROUP BY m.DishID, m.DishName, m.Description
    ORDER BY TotalQuantitySold DESC
END

--This procedure retrieves the schedule of a specific staff member based on their StaffID.
CREATE PROCEDURE GetStaffSchedule
(@StaffID INT)
AS
BEGIN
    SELECT Schedule
    FROM StaffInformation
    WHERE StaffID = @StaffID
END

