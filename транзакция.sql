BEGIN TRANSACTION;

-- 1. Вставляем новое поступление
INSERT INTO Receipts (ID_фрукта, ID_поставщика, ID_поступления, количество, дата_поступления)
VALUES (1, 1, 4, 100, CURRENT_TIMESTAMP);

-- 2. Обновляем остатки на складе
UPDATE Remains
SET количество = количество + 100
WHERE ID_фрукта = 1;

-- 3. Обновляем склад
UPDATE Warehouse
SET количество = количество + 100, дата_обновления = CURRENT_TIMESTAMP
WHERE ID_фрукта = 1;

-- Проверка на ошибки
IF @@ERROR <> 0
BEGIN
    ROLLBACK TRANSACTION;
    PRINT 'Ошибка при выполнении транзакции. Все изменения откатились.';
END
ELSE
BEGIN
    COMMIT TRANSACTION;
    PRINT 'Транзакция успешно завершена.';
END