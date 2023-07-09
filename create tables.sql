create table MenuItems(
DishID int primary key not null,
DishName varchar (30) not null,
Description varchar (max) not null,
Ingredients varchar (max) not null,
Price decimal (10,2) not null,
Currency varchar (3) not null,
Category varchar (35));
go
create table OrderInformation(
OrderID int primary key not null,
DishID int foreign key references MenuItems(DishID),
TableNumber int not null,
WaiterName varchar (max) not null,
OrderDateTime datetime not null,
Status varchar (20) not null);
go
create table CustomerInformation(
CustomerID int primary key not null,
OrderID int foreign key references OrderInformation(OrderID),
CustomerName varchar (max) not null,
ContactNumber int not null,
EmailAdress varchar (max) not null,
ReservationStatus varchar (25) not null);
go
create table StaffInformation(
StaffID int primary key not null,
WaiterName varchar (max) not null,
Role varchar (50) not null,
Schedule varchar (max) not null,
SalaryInformation varchar (max) not null);
go
create table InventoryManagement(
IngID int primary key not null,
IngredientName varchar (100),
Quantity decimal (13,5) not null,
UnitOfMeasurement varchar (10) not null,
PurchaseDate date not null);
go
create table SalesInformation(
SalesID int primary key not null,
SalesDate date not null,
TotalSales decimal (13,5) not null,
Currency varchar (3) not null);
go
create table VendorInformation(
VendorID int primary key not null,
VendorName varchar (max),
OrderHistory varchar (max) null);
go
create table Feedback(
CustomerFeedback varchar (max) null,
FoodQuality varchar (20) not null,
OverallExperience int not null);
go