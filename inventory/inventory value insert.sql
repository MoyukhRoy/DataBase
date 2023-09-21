-- Insert data into Products table
INSERT INTO Products (ProductName, Description, Category, Cost, Price, QuantityInStock, Location)
VALUES
    ('Product A', 'Description for Product A', 'Category A', 10.00, 19.99, 100, 'Location A'),
    ('Product B', 'Description for Product B', 'Category B', 15.00, 29.99, 50, 'Location B'),
    ('Product C', 'Description for Product C', 'Category A', 12.50, 24.99, 75, 'Location C');
    -- Add more product entries as needed.

-- Insert data into Sales table
INSERT INTO Sales (ProductID, SaleDate, QuantitySold)
VALUES
    (1, '2023-09-22', 5),
    (2, '2023-09-22', 3),
    (3, '2023-09-22', 2);
    


INSERT INTO Suppliers (SupplierName, LeadTime, ContactName, ContactEmail, ContactPhone)
VALUES
    ('Supplier A', 7, 'Contact A', 'contactA@email.com', '123-456-7890'),
    ('Supplier B', 5, 'Contact B', 'contactB@email.com', '987-654-3210');



INSERT INTO PurchaseOrders (SupplierID, OrderDate, DeliveryDate, Status)
VALUES
    (1, '2023-09-23', '2023-09-30', 'Pending'),
    (2, '2023-09-24', '2023-10-01', 'Pending');


INSERT INTO PurchaseOrderDetails (OrderID, ProductID, QuantityOrdered)
VALUES
    (1, 1, 10),
    (2, 2, 8);


INSERT INTO Users (Username, Password, Role)
VALUES
    ('UserA', 'passwordA', 'Admin'),
    ('UserB', 'passwordB', 'Staff');
    

INSERT INTO Alerts (UserID, AlertMessage, AlertDate)
VALUES
    (1, 'Alert message for UserA', '2023-09-23 08:00:00'),
    (2, 'Alert message for UserB', '2023-09-24 10:30:00');
   


INSERT INTO ValuationMethods (MethodName)
VALUES
    ('FIFO'),
    ('LIFO'),
    ('Average Cost');
  

INSERT INTO InventoryValuation (ProductID, MethodID, ValuationAmount)
VALUES
    (1, 1, 10.00),
    (2, 2, 15.00);
  


INSERT INTO DemandForecasting (ProductID, ForecastDate, ForecastedQuantity)
VALUES
    (1, '2023-09-30', 50),
    (2, '2023-09-30', 30);
   


INSERT INTO SafetyStock (ProductID, MinimumStockLevel, MaximumStockLevel)
VALUES
    (1, 10, 50),
    (2, 5, 40);
   

INSERT INTO AutomatedReordering (ProductID, ReorderPoint, ReorderQuantity)
VALUES
    (1, 10, 20),
    (2, 5, 15);
   


INSERT INTO ABCAnalysis (ProductID, Classification)
VALUES
    (1, 'A'),
    (2, 'B');
    

INSERT INTO CostManagement (ProductID, StorageCost, InsuranceCost, ObsolescenceCost)
VALUES
    (1, 5.00, 2.00, 1.50),
    (2, 3.00, 1.50, 0.75);
 


INSERT INTO Tracking (ProductID, TrackingCode, Location)
VALUES
    (1, 'BarcodeA123', 'Location A'),
    (2, 'BarcodeB456', 'Location B');
    


INSERT INTO InventoryAuditing (ProductID, AuditDate, PhysicalCount)
VALUES
    (1, '2023-09-30', 45),
    (2, '2023-09-30', 38);
   


INSERT INTO Improvement (Description, DateImplemented)
VALUES
    ('Improvement A', '2023-09-25'),
    ('Improvement B', '2023-09-26');
 


INSERT INTO Customers (CustomerName, ContactName, ContactEmail, ContactPhone)
VALUES
    ('Customer 1', 'Contact 1', 'customer1@email.com', '123-456-7890'),
    ('Customer 2', 'Contact 2', 'customer2@email.com', '987-654-3210');
  


INSERT INTO SalesOrders (CustomerID, OrderDate, Status)
VALUES
    (1, '2023-09-23', 'Pending'),
    (2, '2023-09-24', 'Pending');
 


INSERT INTO SalesOrderDetails (OrderID, ProductID, QuantityOrdered)
VALUES
    (1, 1, 5),
    (2, 2, 3);
   


INSERT INTO PurchaseReceipts (SupplierID, ReceiptDate, Status)
VALUES
    (1, '2023-09-30', 'Received'),
    (2, '2023-09-30', 'Received');
   


INSERT INTO PurchaseReceiptDetails (ReceiptID, ProductID, QuantityReceived)
VALUES
    (1, 1, 10),
    (2, 2, 8);
   

INSERT INTO Notifications (UserID, NotificationMessage, NotificationDate)
VALUES
    (1, 'Notification message for UserA', '2023-09-25 08:30:00'),
    (2, 'Notification message for UserB', '2023-09-26 09:45:00');
    


INSERT INTO Warehouses (WarehouseName, Location)
VALUES
    ('Warehouse A', 'Location A'),
    ('Warehouse B', 'Location B');
  


INSERT INTO WarehouseInventory (WarehouseID, ProductID, QuantityInWarehouse)
VALUES
    (1, 1, 40),
    (2, 2, 30);
   
