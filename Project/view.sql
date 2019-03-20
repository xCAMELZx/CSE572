-- ******* ABILITY TO VIEW WHAT GAMES ARE AVILABLE AND HOW MANY AND WHO OWNS IT. 
CREATE VIEW V1 AS
SELECT title, Description, Availablity, InventoryCount, CustomerID
FROM Game
WHERE InventoryID IS NOT NULL;
