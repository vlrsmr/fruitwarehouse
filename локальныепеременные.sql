DECLARE @FruitID INT;               
DECLARE @ProviderID INT;            
DECLARE @ClientID INT;              


SET @FruitID = 1;                  
SET @ProviderID = 2;                
SET @ClientID = 3;                  


SELECT * FROM Fruit WHERE ID_������ = @FruitID;
SELECT * FROM Provider WHERE ID_���������� = @ProviderID;
SELECT * FROM Client WHERE ID_������� = @ClientID;
