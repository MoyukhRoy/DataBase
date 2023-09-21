ALTER TABLE SalesOrderDetails
ADD FOREIGN KEY (OrderID) REFERENCES SalesOrders(OrderID);

ALTER TABLE PurchaseReceiptDetails
ADD FOREIGN KEY (ReceiptID) REFERENCES PurchaseReceipts(ReceiptID);

ALTER TABLE SalesOrders
ADD FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);

ALTER TABLE Notifications
ADD FOREIGN KEY (UserID) REFERENCES Users(UserID);

ALTER TABLE WarehouseInventory
ADD FOREIGN KEY (WarehouseID) REFERENCES Warehouses(WarehouseID);

ALTER TABLE WarehouseInventory
ADD FOREIGN KEY (ProductID) REFERENCES Products(ProductID);
