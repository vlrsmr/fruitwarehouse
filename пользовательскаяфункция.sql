
CREATE FUNCTION dbo.fn_GetCurrentNumber
(
    @ID_фрукта INT
)
RETURNS INT
AS
BEGIN
    DECLARE @Receipts INT = 0;
    DECLARE @Shipment INT = 0;
    DECLARE @Remains INT = 0;

    SELECT @Receipts = ISNULL(SUM(количество), 0)
    FROM Receipts
    WHERE ID_фрукта = @ID_фрукта;

    SELECT @Shipment = ISNULL(SUM(количество), 0)
    FROM Shipment
    WHERE ID_фрукта = @ID_фрукта;

    SET @Remains = @Shipment - @Receipts;

    RETURN @Remains;
END
