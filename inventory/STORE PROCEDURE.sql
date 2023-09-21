DELIMITER //
CREATE PROCEDURE AutoGeneratePurchaseOrder(IN pProductID INT)
BEGIN
    DECLARE vReorderPoint INT;
    DECLARE vQuantityInStock INT;

    SELECT ReorderPoint, QuantityInStock
    INTO vReorderPoint, vQuantityInStock
    FROM Products
    WHERE ProductID = pProductID;

    IF vQuantityInStock < vReorderPoint THEN
        -- Generate a purchase order for this product
        INSERT INTO PurchaseOrders (SupplierID, OrderDate, Status)
        SELECT SupplierID, CURDATE(), 'Pending' FROM Suppliers WHERE SupplierID = pProductID;

        -- Insert details into PurchaseOrderDetails
        INSERT INTO PurchaseOrderDetails (OrderID, ProductID, QuantityOrdered)
        VALUES (LAST_INSERT_ID(), pProductID, vReorderQuantity); -- Define vReorderQuantity

        -- Add an alert for the user
        INSERT INTO Alerts (UserID, AlertMessage, AlertDate)
        SELECT UserID, CONCAT('Auto-generated purchase order created for ProductID ', pProductID), NOW()
        FROM Users
        WHERE Role = 'Admin';
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER LowStockAlert AFTER UPDATE ON Products FOR EACH ROW
BEGIN
    IF NEW.QuantityInStock < (SELECT MinimumStockLevel FROM Products WHERE ProductID = NEW.ProductID) THEN
        -- Add an alert for the user
        INSERT INTO Alerts (UserID, AlertMessage, AlertDate)
        SELECT UserID, CONCAT('Low stock alert for ProductID ', NEW.ProductID), NOW()
        FROM Users
        WHERE Role = 'Admin';
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ABCAnalysis()
BEGIN
    -- Calculate sales volume and value for each product
    INSERT INTO ABCAnalysis (ProductID, Classification)
    SELECT ProductID,
           CASE
               WHEN SalesValue >= 0.8 * TotalSalesValue THEN 'A'
               WHEN SalesValue >= 0.5 * TotalSalesValue THEN 'B'
               ELSE 'C'
           END
    FROM (
        SELECT p.ProductID,
               SUM(s.QuantitySold) AS SalesVolume,
               SUM(s.QuantitySold * p.Price) AS SalesValue,
               (SELECT SUM(QuantitySold * Price) FROM Sales) AS TotalSalesValue
        FROM Products p
        JOIN Sales s ON p.ProductID = s.ProductID
        GROUP BY p.ProductID
    ) AS ProductSales;
END //
DELIMITER ;



