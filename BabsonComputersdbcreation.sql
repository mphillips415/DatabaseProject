--Babson Computers--

--Eli Iaslovits, Kevin Mitchell, Michael Phillips --


Create Database BabsonComputers;
Go

Use BabsonComputers;
Go


Create Table Customer(
	CustomerID bigint NOT NULL PRIMARY KEY,
	LastName varchar(50) NOT NULL,
	FirstName varchar(50) NOT NULL,
	CompanyName varchar(50) NOT NULL,
	EmailAddress varchar(50) NOT NULL);

Create table OrderHeader(
	OrderID bigint NOT NULL PRIMARY KEY,
	CustomerID bigint NOT NULL,
	OrderDate date NOT NULL,
	TotalDue money NOT NULL);

Create Table OrderLine(
	OrderLineID bigint NOT NULL PRIMARY KEY,
	OrderID bigint NOT NULL,
	AssetTag bigint NOT NULL,
	Quantity bigint NOT NULL);


Create Table Product(
	AssetTag bigint NOT NULL PRIMARY KEY,
	Make varchar(50) NOT NULL,
	Model varchar(50) NOT NULL,
	UnitPrice money NOT NULL,
	UnitCost money NOT NULL,
	Orientation varchar(50) NOT NULL);

--Create Foreign Key in OrderHeader Table --

Alter Table OrderHeader ADD Constraint FK_OrderHeader_Customer
Foreign Key (CustomerID) References Customer(CustomerID);
Go


--Create Foreign Key (OrderID) in OrderLine Table --

Alter Table OrderLine ADD Constraint FK_OrderLine_OrderHeader
Foreign Key (OrderID) References OrderHeader(OrderID);
Go

--Add Data to tables --

Insert Into Customer (CustomerID, LastName, FirstName, CompanyName, EmailAddress) Values
	(1, 'Phillips', 'Andrew', 'JP Morgan', 'aphillips@jpmorgan.com'),
	(2, 'Gates', 'Bill', 'Microsoft', 'gates@microsoft.com'),
	(3, 'Jobs', 'Steve', 'Apple', 'jobs@apple.com'),
	(4, 'Riggins', 'Tim', 'Dell', 'riggins@dell.com'),
	(5, 'Cook', 'Tim', 'IBM', 'cook@ibm.com'),
	(6, 'Buffet', 'Warren', 'Berkshire', 'wbuffet@berkshire.com'),
	(7, 'James', 'Rick', 'Goldman', 'rjames@goldman.com'),
	(8, 'Lincoln', 'Abraham', 'FBI', 'Lincoln@fbi.com'),
	(9, 'Damon', 'Matt', 'Dreamworks', 'mdamon@dreamworks.com'),
	(10, 'Lucas', 'George', 'LucasArts', 'glucas@lucasarts.com');

Insert Into OrderHeader (OrderID, CustomerID, OrderDate, TotalDue) Values
	(1, '4', '1/05/2005', '1400.00'),
	(2, '6', '1/07/2005', '2000.00'),
	(3, '8', '1/25/2005', '500.00'),
	(4, '10', '2/14/2005', '3500.00'),
	(5, '1', '2/18/2005', '750.00'),
	(6, '2', '2/27/2005', '2100.00'),
	(7, '4', '3/05/2005', '800.00'),
	(8, '3', '3/10/2005', '600.00'), 
	(9, '5', '3/26/2005', '650.00'),
	(10, '7', '4/10/2005', '2500.00');


Insert Into Product (AssetTag, Make, Model, UnitPrice, UnitCost, Orientation) Values
	(1, 'Dell', 'Precision 380', '1400.00', '800.00', 'Tower'),
	(2, 'Dell', 'Precision T5400', '3500.00', '2100.00', 'Tower'),
	(3, 'HP', 'Z420', '2500.00', '1500.00', 'Tower'),
	(4, 'HP', 'Elitebook 8780', '650.00', '250.00', 'Laptop'),
	(5, 'Dell', 'Latitude 7470', '2000.00', '800.00', 'Laptop'),
	(6, 'Dell', 'Mobile Precision 4400', '2100.00', '1400.00', 'Laptop'),
	(7, 'Lenovo', 'X1 Carbon', '750.00', '400.00', 'Laptop'),
	(8, 'Lenovo', 'Yoga', '600.00', '300.00', 'Laptop'),
	(9, 'Dell', 'Optiplex 9010', '800.00', '350.00', 'Small Form Desktop'),
	(10, 'HP', 'Compaq 8000', '500.00', '225.00', 'Small Form Desktop');


Insert Into OrderLine (OrderLineID, OrderID, AssetTag, Quantity) Values
	(1, '1', '1', '1'),
	(2, '3', '10', '1'),
	(3, '2', '5', '1'),
	(4, '4', '2', '1'),
	(5, '5', '7', '1'),
	(6, '7', '9', '1'),
	(7, '6', '6', '1'),
	(8, '10', '3', '1'),
	(9, '9', '4', '1'),
	(10, '8', '8', '1');


