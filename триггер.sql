
CREATE TRIGGER trg_ReceiptWarehouse
ON Receipts
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- ��������� ���������� �� �������, ���� ������ ����
    UPDATE s
    SET s.���������� = s.���������� + i.����������,
        s.����_���������� = GETDATE()
    FROM Warehouse s
    INNER JOIN inserted i ON s.ID_������ = i.ID_������;

    -- ��������� ����� ������, ���� ������ ��� � ������
    INSERT INTO Warehouse(ID_������, ����������, ����_����������)
    SELECT i.ID_������, i.����������, GETDATE()
    FROM inserted i
    WHERE NOT EXISTS (
        SELECT 1 FROM Warehouse s WHERE s.ID_������ = i.ID_������
    );
END

