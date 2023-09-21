
CREATE DATABASE InventoryManagement;
USE InventoryManagement;



-- Products table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    Description TEXT,
    Category VARCHAR(50),
    Cost DECIMAL(10, 2),
    Price DECIMAL(10, 2),
    QuantityInStock INT,
    Location VARCHAR(100)
);

-- Sales table
CREATE TABLE Sales (
    SaleID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    SaleDate DATE,
    QuantitySold INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Suppliers table
CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(255) NOT NULL,
    LeadTime INT, -- Lead time in days
    ContactName VARCHAR(100),
    ContactEmail VARCHAR(255),
    ContactPhone VARCHAR(20)
);

-- Purchase Orders table
CREATE TABLE PurchaseOrders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierID INT,
    OrderDate DATE,
    DeliveryDate DATE,
    Status VARCHAR(50), -- Status of the order (e.g., "Pending," "Received")
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Purchase Order Details table
CREATE TABLE PurchaseOrderDetails (
    DetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    QuantityOrdered INT,
    FOREIGN KEY (OrderID) REFERENCES PurchaseOrders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Users table (for access control)
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Role VARCHAR(50) -- User role (e.g., "Admin," "Staff")
);

-- Alerts table (for notifications)
CREATE TABLE Alerts (
    AlertID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    AlertMessage TEXT,
    AlertDate DATETIME,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Inventory Valuation Methods table
CREATE TABLE ValuationMethods (
    MethodID INT AUTO_INCREMENT PRIMARY KEY,
    MethodName VARCHAR(50) NOT NULL
);

-- Inventory Valuation table (linking products to valuation methods)
CREATE TABLE InventoryValuation (
    ProductID INT,
    MethodID INT,
    ValuationAmount DECIMAL(10, 2),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (MethodID) REFERENCES ValuationMethods(MethodID)
);

  -- Create a Demand Forecasting table
CREATE TABLE DemandForecasting (
    ForecastID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    ForecastDate DATE,
    ForecastedQuantity INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create a Safety Stock Management table
CREATE TABLE SafetyStock (
    ProductID INT,
    MinimumStockLevel INT,
    MaximumStockLevel INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create an Automated Reordering table
CREATE TABLE AutomatedReordering (
    ReorderID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    ReorderPoint INT,
    ReorderQuantity INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create an ABC Analysis table
CREATE TABLE ABCAnalysis (
    ProductID INT,
    Classification VARCHAR(1), -- A, B, or C
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create a Cost Management table
CREATE TABLE CostManagement (
    ProductID INT,
    StorageCost DECIMAL(10, 2),
    InsuranceCost DECIMAL(10, 2),
    ObsolescenceCost DECIMAL(10, 2),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create a Barcode and RFID Tracking table
CREATE TABLE Tracking (
    TrackingID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    TrackingCode VARCHAR(50), -- Barcode or RFID code
    Location VARCHAR(100),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create an Inventory Auditing table
CREATE TABLE InventoryAuditing (
    AuditID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    AuditDate DATE,
    PhysicalCount INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Continuous Improvement table
CREATE TABLE Improvement (
    ImprovementID INT AUTO_INCREMENT PRIMARY KEY,
    Description TEXT,
    DateImplemented DATE
);

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(255) NOT NULL,
    ContactName VARCHAR(100),
    ContactEmail VARCHAR(255),
    ContactPhone VARCHAR(20)
);

-- Sales Orders table
CREATE TABLE SalesOrders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT, -- Reference to customers
    OrderDate DATE,
    Status VARCHAR(50), -- Status of the order (e.g., "Pending," "Shipped")
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Sales Order Details table
CREATE TABLE SalesOrderDetails (
    DetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    QuantityOrdered INT,
    FOREIGN KEY (OrderID) REFERENCES SalesOrders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE PurchaseReceipts (
    ReceiptID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierID INT, -- Reference to suppliers
    ReceiptDate DATE,
    Status VARCHAR(50), -- Status of the receipt (e.g., "Received," "Pending")
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Purchase Receipt Details table
CREATE TABLE PurchaseReceiptDetails (
    DetailID INT AUTO_INCREMENT PRIMARY KEY,
    ReceiptID INT,
    ProductID INT,
    QuantityReceived INT,
    FOREIGN KEY (ReceiptID) REFERENCES PurchaseReceipts(ReceiptID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Notifications table
CREATE TABLE Notifications (
    NotificationID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    NotificationMessage TEXT,
    NotificationDate DATETIME,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Warehouses table
CREATE TABLE Warehouses (
    WarehouseID INT AUTO_INCREMENT PRIMARY KEY,
    WarehouseName VARCHAR(255),
    Location VARCHAR(100)
);

-- Warehouse Inventory table
CREATE TABLE WarehouseInventory (
    WarehouseID INT,
    ProductID INT,
    QuantityInWarehouse INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(WarehouseID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


