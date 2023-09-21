-- Create a view for product sales
DROP VIEW IF EXISTS ProductSalesView;
CREATE VIEW ProductSalesView AS
SELECT
    P.ProductID,
    P.ProductName,
    P.Category,
    S.SaleDate,
    S.QuantitySold,
    P.Price * S.QuantitySold AS Revenue
FROM
    Products AS P
JOIN
    Sales AS S ON P.ProductID = S.ProductID;

