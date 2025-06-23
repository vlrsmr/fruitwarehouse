--Транзакция
BEGIN TRANSACTION;

-- Объявляем переменные
DECLARE @FruitID INT = 1;          
DECLARE @ShipmentQuantity DECIMAL(10,2) = 100; 
DECLARE @ReceiptQuantity DECIMAL(10,2) = 30; 

-- Обновляем остаток

UPDATE Remains
SET Количество_кг = Количество_кг + @ShipmentQuantity - @ReceiptQuantity
WHERE ID_фрукта = @FruitID;

-- дополнительная проверка, чтобы остаток не стал отрицательным

IF EXISTS (
    SELECT 1 FROM Remains
    WHERE ID_фрукта = @FruitID AND Количество_кг < 0
)
BEGIN
    ROLLBACK TRANSACTION;
    PRINT 'Ошибка: недостаточно товара на складе.';
    RETURN;
END


COMMIT TRANSACTION;
PRINT 'Транзакция успешно завершена';