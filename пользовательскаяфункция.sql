
CREATE FUNCTION dbo.fn_GetCurrentNumber
(
    @ID_������ INT
)
RETURNS INT
AS
BEGIN
    DECLARE @Receipts INT = 0;
    DECLARE @Shipment INT = 0;
    DECLARE @Remains INT = 0;

    SELECT @Receipts = ISNULL(SUM(����������), 0)
    FROM Receipts
    WHERE ID_������ = @ID_������;

    SELECT @Shipment = ISNULL(SUM(����������), 0)
    FROM Shipment
    WHERE ID_������ = @ID_������;

    SET @Remains = @Shipment - @Receipts;

    RETURN @Remains;
END
