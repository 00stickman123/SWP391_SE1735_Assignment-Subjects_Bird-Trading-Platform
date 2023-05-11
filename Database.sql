CREATE DATABASE SWP391

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(50),
    Username VARCHAR(20) UNIQUE NOT NULL,
    [Password] VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    [Address] VARCHAR(100) NOT NULL,
);

CREATE TABLE Shop (
    ShopID INT PRIMARY KEY,
    ShopName VARCHAR(50) NOT NULL,
    OwnerName VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Phone VARCHAR(20),
    [Address] VARCHAR(100) NOT NULL
);

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ShopID INT NOT NULL,
    ProductName VARCHAR(50) NOT NULL,
    [Description] VARCHAR(100),
    Price DECIMAL(18,2) NOT NULL,
    [Image] VARCHAR(100),
    StockQuantity INT NOT NULL,
	[Type] NVARCHAR(20) NOT NULL,
    FOREIGN KEY (ShopID) REFERENCES Shop(ShopID)
);

CREATE TABLE Food (
    FoodID INT PRIMARY KEY,
    ShopID INT NOT NULL,
    FoodName VARCHAR(50) NOT NULL,
    [Description] VARCHAR(100),
    Price DECIMAL(18,2) NOT NULL,
    [Image] VARCHAR(100),
    StockQuantity INT NOT NULL,
    FOREIGN KEY (ShopID) REFERENCES Shop(ShopID)
);

CREATE TABLE Accessory (
    AccessoryID INT PRIMARY KEY,
    ShopID INT NOT NULL,
    AccessoryName VARCHAR(50) NOT NULL,
    [Description] VARCHAR(100),
    Price DECIMAL(18,2) NOT NULL,
    [Image] VARCHAR(100),
    StockQuantity INT NOT NULL,
    FOREIGN KEY (ShopID) REFERENCES Shop(ShopID)
);

CREATE TABLE [Order](
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    ShopID INT NOT NULL,
    OrderDate DATETIME NOT NULL,
    [Status] VARCHAR(20) NOT NULL,
    TotalAmount DECIMAL(18,2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ShopID) REFERENCES Shop(ShopID)
);

CREATE TABLE OrderDetail (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT,
    FoodID INT,
    AccessoryID INT,
    Quantity INT NOT NULL,
    Price DECIMAL(18,2) NOT NULL,
    Amount DECIMAL(18,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES [Order](OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (FoodID) REFERENCES Food(FoodID),
    FOREIGN KEY (AccessoryID) REFERENCES Accessory(AccessoryID)
);

CREATE TABLE ProductFeedback (
    ProductFeedbackID INT PRIMARY KEY,
    ProductID INT NOT NULL,
    CustomerID INT NOT NULL,
    Comment VARCHAR(100),
    Rating INT NOT NULL,
    FeedbackDate DATETIME NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
);
