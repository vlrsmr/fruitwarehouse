--����������
BEGIN TRANSACTION;

-- ��������� ����������
DECLARE @FruitID INT = 1;          
DECLARE @ShipmentQuantity DECIMAL(10,2) = 100; 
DECLARE @ReceiptQuantity DECIMAL(10,2) = 30; 

-- ��������� �������

UPDATE Remains
SET ����������_�� = ����������_�� + @ShipmentQuantity - @ReceiptQuantity
WHERE ID_������ = @FruitID;

-- �������������� ��������, ����� ������� �� ���� �������������

IF EXISTS (
    SELECT 1 FROM Remains
    WHERE ID_������ = @FruitID AND ����������_�� < 0
)
BEGIN
    ROLLBACK TRANSACTION;
    PRINT '������: ������������ ������ �� ������.';
    RETURN;
END


COMMIT TRANSACTION;
PRINT '���������� ������� ���������';