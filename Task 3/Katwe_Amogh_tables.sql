AMOGH KATWE
DBMS: Oracle


create table Customer (
Name varchar(20) NOT NULL,
Address VARCHAR(20), 
Phone INT NOT NULL,
Primary Key (Name));

Create table USOrder(
OrderNo INT NOT NULL,
OrderDate DATE,
Amount Decimal(5,2) NOT NULL,
CustomerName VARCHAR(20) NOT NULL,
PRIMARY KEY (OrderNo),
FOREIGN KEY (CustomerName) REFERENCES Customer(Name) ON DELETE SET NULL);

Create table Branch(
BranchName VARCHAR(20) NOT NULL,
BrNo INT NOT NULL,
Address VARCHAR(20),
Phone INT NOT NULL,
CustomerName VARCHAR(20) NOT NULL,
PRIMARY KEY(BranchName),
FOREIGN KEY(CustomerName) REFERENCES Customer(Name)
ON DELETE SET NULL);

Create table Suborder(
OrderNo INT NOT NULL,
SuborderNo INT NOT NULL,
RequiredShipDate DATE NOT NULL,
ActualShipDate DATE,
BranchName VARCHAR(20) NOT NULL,
PRIMARY KEY(OrderNo, SuborderNo),
FOREIGN KEY(OrderNo) REFERENCES USOrder(OrderNo) ON DELETE SET NULL ,
FOREIGN KEY (BranchName) REFERENCES Branch(BranchName)
ON DELETE CASCADE);

Create table USEmployee(
EmployeeNo INT NOT NULL,
EmployeeName VARCHAR(20) NOT NULL,
Address VARCHAR(20),
DOB DATE,
EmployeeClass CHAR,
Salary DECIMAL(5,2) NOT NULL
Primary Key(EmployeeNo);

Create table Handles(
EmployeeNo INT NOT NULL,
OrderNo INT NOT NULL,
PRIMARY KEY(EmployeeNo, OrderNo),
FOREIGN KEY (EmployeeNo) REFERENCES USEmployee(EmployeeNo) ON DELETE SET NULL,
FOREIGN KEY (OrderNo) REFERENCES USOrder(OrderNo) ON DELETE SET NULL);

Create table OrderItem(
OrderNo INT NOT NULL,
SuborderNo INT NOT NULL,
TypeNo INT NOT NULL,
Quantity INT NOT NULL,
PRIMARY KEY(OrderNo, SuborderNo, TypeNo),
FOREIGN KEY(OrderNo, SuborderNo) REFERENCES Suborder(OrderNo, SuborderNo) ON DELETE SET NULL ,
FOREIGN KEY(TypeNo) REFERENCES Paper(TypeNo)
ON DELETE CASCADE);

Create table Paper(
TypeNo INT NOT NULL,
PaperSize INT NOT NULL,
Weight DECIMAL(3,2),
UnitPrice INT NOT NULL,
PRIMARY KEY(TypeNo));
