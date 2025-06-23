CREATE TRIGGER UpdateRemainsOnShipment
ON Shipment
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    MERGE Remains AS target
    USING (SELECT ID_фрукта, SUM(Количество_кг) AS TotalQuantity
           FROM inserted
           GROUP BY ID_фрукта) AS source
    ON target.ID_фрукта = source.ID_фрукта
    WHEN MATCHED THEN
        UPDATE SET target.Количество_кг = target.Количество_кг + source.TotalQuantity
    WHEN NOT MATCHED THEN
        INSERT (ID_фрукта, Количество_кг)
        VALUES (source.ID_фрукта, source.TotalQuantity);
END;

