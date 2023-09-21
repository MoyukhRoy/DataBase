-- Indexes for Products table
CREATE INDEX idx_ProductID ON Products(ProductID);
CREATE INDEX idx_Category ON Products(Category);
CREATE INDEX idx_QuantityInStock ON Products(QuantityInStock);

-- Indexes for Sales table
CREATE INDEX idx_ProductID_Sales ON Sales(ProductID);
CREATE INDEX idx_SaleDate ON Sales(SaleDate);

-- Indexes for Suppliers table
CREATE INDEX idx_SupplierID ON Suppliers(SupplierID);

-- Indexes for Purchase Orders table
CREATE INDEX idx_SupplierID_PurchaseOrders ON PurchaseOrders(SupplierID);
CREATE INDEX idx_OrderDate ON PurchaseOrders(OrderDate);

-- Indexes for Purchase Order Details table
CREATE INDEX idx_OrderID_PurchaseOrderDetails ON PurchaseOrderDetails(OrderID);
CREATE INDEX idx_ProductID_PurchaseOrderDetails ON PurchaseOrderDetails(ProductID);

-- Indexes for Users table
CREATE INDEX idx_UserID ON Users(UserID);

-- Indexes for Inventory Valuation table
CREATE INDEX idx_ProductID_InventoryValuation ON InventoryValuation(ProductID);

-- Indexes for Demand Forecasting table
CREATE INDEX idx_ProductID_DemandForecasting ON DemandForecasting(ProductID);
CREATE INDEX idx_ForecastDate ON DemandForecasting(ForecastDate);

-- Indexes for Safety Stock Management table
CREATE INDEX idx_ProductID_SafetyStock ON SafetyStock(ProductID);

-- Indexes for Automated Reordering table
CREATE INDEX idx_ProductID_AutomatedReordering ON AutomatedReordering(ProductID);

-- Indexes for ABC Analysis table
CREATE INDEX idx_ProductID_ABCAnalysis ON ABCAnalysis(ProductID);

-- Indexes for Cost Management table
CREATE INDEX idx_ProductID_CostManagement ON CostManagement(ProductID);

-- Indexes for Barcode and RFID Tracking table
CREATE INDEX idx_ProductID_Tracking ON Tracking(ProductID);
CREATE INDEX idx_TrackingCode ON Tracking(TrackingCode);

-- Indexes for Inventory Auditing table
CREATE INDEX idx_ProductID_InventoryAuditing ON InventoryAuditing(ProductID);

-- Indexes for Sales Orders table
CREATE INDEX idx_CustomerID_SalesOrders ON SalesOrders(CustomerID);
CREATE INDEX idx_OrderDate_SalesOrders ON SalesOrders(OrderDate);

-- Indexes for Sales Order Details table
CREATE INDEX idx_OrderID_SalesOrderDetails ON SalesOrderDetails(OrderID);
CREATE INDEX idx_ProductID_SalesOrderDetails ON SalesOrderDetails(ProductID);

-- Indexes for Purchase Receipts table
CREATE INDEX idx_SupplierID_PurchaseReceipts ON PurchaseReceipts(SupplierID);
CREATE INDEX idx_ReceiptDate ON PurchaseReceipts(ReceiptDate);

-- Indexes for Purchase Receipt Details table
CREATE INDEX idx_ReceiptID_PurchaseReceiptDetails ON PurchaseReceiptDetails(ReceiptID);
CREATE INDEX idx_ProductID_PurchaseReceiptDetails ON PurchaseReceiptDetails(ProductID);

-- Indexes for Notifications table
CREATE INDEX idx_UserID_Notifications ON Notifications(UserID);

-- Indexes for Warehouse Inventory table
CREATE INDEX idx_WarehouseID_WarehouseInventory ON WarehouseInventory(WarehouseID);
CREATE INDEX idx_ProductID_WarehouseInventory ON WarehouseInventory(ProductID);
