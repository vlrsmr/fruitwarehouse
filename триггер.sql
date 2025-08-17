
CREATE TRIGGER trg_ReceiptWarehouse
ON Receipts
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Обновляем количество по фруктам, если запись есть
    UPDATE s
    SET s.количество = s.количество + i.количество,
        s.дата_обновления = GETDATE()
    FROM Warehouse s
    INNER JOIN inserted i ON s.ID_фрукта = i.ID_фрукта;

    -- Вставляем новые записи, если фрукта нет в складе
    INSERT INTO Warehouse(ID_фрукта, количество, дата_обновления)
    SELECT i.ID_фрукта, i.количество, GETDATE()
    FROM inserted i
    WHERE NOT EXISTS (
        SELECT 1 FROM Warehouse s WHERE s.ID_фрукта = i.ID_фрукта
    );
END

