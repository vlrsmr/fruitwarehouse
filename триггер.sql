CREATE TRIGGER UpdateRemainsOnShipment
ON Shipment
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    MERGE Remains AS target
    USING (SELECT ID_������, SUM(����������_��) AS TotalQuantity
           FROM inserted
           GROUP BY ID_������) AS source
    ON target.ID_������ = source.ID_������
    WHEN MATCHED THEN
        UPDATE SET target.����������_�� = target.����������_�� + source.TotalQuantity
    WHEN NOT MATCHED THEN
        INSERT (ID_������, ����������_��)
        VALUES (source.ID_������, source.TotalQuantity);
END;

