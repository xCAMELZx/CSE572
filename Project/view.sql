CREATE VIEW V1 AS
SELECT title, Description, Availablity, InventoryCount, CustomerID
FROM Game
WHERE InventoryID IS NOT NULL;
