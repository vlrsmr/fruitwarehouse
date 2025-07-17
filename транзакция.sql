BEGIN TRANSACTION;

-- 1. ��������� ����� �����������
INSERT INTO Receipts (ID_������, ID_����������, ID_�����������, ����������, ����_�����������)
VALUES (1, 1, 4, 100, CURRENT_TIMESTAMP);

-- 2. ��������� ������� �� ������
UPDATE Remains
SET ���������� = ���������� + 100
WHERE ID_������ = 1;

-- 3. ��������� �����
UPDATE Warehouse
SET ���������� = ���������� + 100, ����_���������� = CURRENT_TIMESTAMP
WHERE ID_������ = 1;

-- �������� �� ������
IF @@ERROR <> 0
BEGIN
    ROLLBACK TRANSACTION;
    PRINT '������ ��� ���������� ����������. ��� ��������� ����������.';
END
ELSE
BEGIN
    COMMIT TRANSACTION;
    PRINT '���������� ������� ���������.';
END