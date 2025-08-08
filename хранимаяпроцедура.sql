CREATE PROCEDURE RegisterFruitArrival
    @ID_фрукта INT,
    @ID_поставщика INT,
    @Количество_кг INT,
    @Дата_поступления DATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Добавление новой записи в таблицу Поступления
    INSERT INTO Receipts (ID_фрукта, ID_поставщика, количество, дата_поступления)
    VALUES (@ID_фрукта, @ID_поставщика, @количество_кг, @дата_поступления);

    -- Обновление остатков
    IF EXISTS (SELECT * FROM Remains WHERE ID_фрукта = @ID_фрукта)
    BEGIN
        UPDATE Remains
        SET количество = количество + @Количество_кг
        WHERE ID_фрукта = @ID_фрукта;
    END
    ELSE
    BEGIN
        INSERT INTO Remains(ID_фрукта, количество)
        VALUES (@ID_фрукта, @Количество_кг);
    END
END;
