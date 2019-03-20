DELETE FROM Customer c
WHERE EXISTS (SELECT g.CustomerID
       FROM Game g
       WHERE c.CustomerID = g.CustomerID);
